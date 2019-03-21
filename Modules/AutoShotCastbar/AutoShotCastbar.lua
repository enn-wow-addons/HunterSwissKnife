local CastBar = {}
CastBar.__index = CastBar;

function CastBar:new()
    local newObj = {}
    return setmetatable(newObj, CastBar);
end

function CastBar:applyConfig(config)
    local posX              = self.config.x      * GetScreenWidth()  / 1000;
    local posY              = self.config.y      * GetScreenHeight() / 1000;
    local height            = self.config.height * GetScreenHeight() / 1000;
    local width             = self.config.width  * GetScreenWidth()  / 1000;
    local innerBorderHeight = self.config.innerBorder.height;
    local innerBorderWidth  = self.config.innerBorder.width;
    local outerBorderHeight = self.config.outerBorder.height;
    local outerBorderWidth  = self.config.outerBorder.width;

    self.frame:SetHeight(height);
    self.frame:SetWidth(width);
    self.frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY);

    self.bar:SetHeight(height);
    self.bar:SetWidth(width);

    self.innerBorder:SetHeight(height + innerBorderHeight);
    self.innerBorder:SetWidth(width + innerBorderWidth);

    self.outerBorder:SetHeight(height + innerBorderHeight + outerBorderHeight);
    self.outerBorder:SetWidth(width + innerBorderWidth + outerBorderWidth);
end

local CastBarConfig = {}
CastBarConfig.__index = CastBarConfig;

function CastBarConfig:new()
    local newObj = {
        x           = 0;
        y           = -235;
        height      = 12;
        width       = 100;

        innerBorder = { height = 4, width  = 4 };
        outerBorder = { height = 2, width  = 2 };

        reloadColor = { r = 1, g = 0, b = 0 };
        aimingColor = { r = 1, g = 1, b = 0 };

        alpha       = { visible = 1, hidden  = 0 };
    };

    return setmetatable(newObj, CastBarConfig);
end

local AutoShotCastBar;

local shooting       = false;

local aimingStart    = false;
local aimingTime     = 0.65;

local reloadingStart = false;
local reloadingTime;

local posX, posY;
local gCooldownStartOld;


local function CheckGCD()
    local spellId = HSK_Core_GetSpellIdByName(HSK_SPELL_SERPENTSTING_NAME);

    if spellId then
        local gCooldownStart, gCooldownTime = GetSpellCooldown(spellId, "BOOKTYPE_SPELL");

        return gCooldownStart, gCooldownTime;
    end
end


local function GunReset()
    AutoShotCastBar.bar:SetVertexColor(
        AutoShotCastBar.config.aimingColor.r,
        AutoShotCastBar.config.aimingColor.g,
        AutoShotCastBar.config.aimingColor.b
    );

    reloadingStart = false;
    posX, posY     = GetPlayerMapPosition("player");

    aimingStart    = GetTime();
end


local function GunReload()
    AutoShotCastBar.bar:SetVertexColor(
        AutoShotCastBar.config.reloadColor.r,
        AutoShotCastBar.config.reloadColor.g,
        AutoShotCastBar.config.reloadColor.b
    );

    reloadingStart = GetTime();
    reloadingTime  = UnitRangedDamage("player") - aimingTime;

    aimingStart    = false;
end

function HSK_Module_AutoShotCastbar_CreateBar()
    AutoShotCastBar             = CastBar:new();
    AutoShotCastBar.frame       = HSK_MODULE_AUTOSHOTCASTBAR;
    AutoShotCastBar.bar         = HSK_MODULE_AUTOSHOTCASTBAR_BAR;
    AutoShotCastBar.innerBorder = HSK_MODULE_AUTOSHOTCASTBAR_INNERBORDER;
    AutoShotCastBar.outerBorder = HSK_MODULE_AUTOSHOTCASTBAR_OUTERBORDER;

    AutoShotCastBar.config = CastBarConfig:new();
    AutoShotCastBar:applyConfig();
end


function HSK_Module_AutoShotCastbar_OnLoad(frame)
    frame:RegisterEvent("START_AUTOREPEAT_SPELL");
    frame:RegisterEvent("STOP_AUTOREPEAT_SPELL");

    frame:RegisterEvent("SPELLCAST_STOP");
    frame:RegisterEvent("ITEM_LOCK_CHANGED");

    frame:RegisterEvent("ADDON_LOADED");

    HSK_Core_PrintToChat(HSK_COLOR_CYAN.."AutoShotCastbar Module |rLoaded");
end


function HSK_Module_AutoShotCastbar_OnUpdate()
    if not reloadingStart then
        if shooting then
            local cposX, cposY = GetPlayerMapPosition("player");

            if cposX == posX and cposY == posY then
                AutoShotCastBar.frame:SetAlpha(AutoShotCastBar.config.alpha.visible);

                local timePassed = GetTime() - aimingStart;
                if timePassed <= aimingTime then
                    AutoShotCastBar.bar:SetWidth(AutoShotCastBar.frame:GetWidth() * timePassed/aimingTime);
                end
            else
                AutoShotCastBar.frame:SetAlpha(AutoShotCastBar.config.alpha.hidden);
                GunReset();
            end
        end
    else
        local timePassed = GetTime() - reloadingStart;
        if timePassed <= reloadingTime then
            AutoShotCastBar.bar:SetWidth(
                AutoShotCastBar.frame:GetWidth() - (AutoShotCastBar.frame:GetWidth() * timePassed/reloadingTime)
            );
        else
            if not shooting then
                AutoShotCastBar.frame:SetAlpha(AutoShotCastBar.config.alpha.hidden);
                AutoShotCastBar.bar:SetWidth(0);
            end
            GunReset();
        end
    end
end


HSK_Module_AutoShotCastbar_OnEvent = {}

HSK_Module_AutoShotCastbar_OnEvent["START_AUTOREPEAT_SPELL"] = function()
    shooting = true;
    aimingStart = GetTime();
end

HSK_Module_AutoShotCastbar_OnEvent["STOP_AUTOREPEAT_SPELL"] = function()
    shooting = false;
    aimingStart = false;

    if not reloadingStart then
        AutoShotCastBar.frame:SetAlpha(AutoShotCastBar.config.alpha.hidden);
    end
end

HSK_Module_AutoShotCastbar_OnEvent["SPELLCAST_STOP"] = function()
    local gCooldownStart, gCooldownTime = CheckGCD();

    if gCooldownTime == 1.5 then
        gCooldownStartOld = gCooldownStart;
    end
end

HSK_Module_AutoShotCastbar_OnEvent["ITEM_LOCK_CHANGED"] = function()
    if shooting then
        local gCooldownStart, gCooldownTime = CheckGCD();

        if gCooldownTime ~= 1.5 then
            GunReload();
        elseif gCooldownStartOld == gCooldownStart then
            GunReload();
        else
            gCooldownStartOld = gCooldownStart;
        end
    end
end

HSK_Module_AutoShotCastbar_OnEvent["ADDON_LOADED"] = function()
    HSK_Module_AutoShotCastbar_CreateBar();
end
