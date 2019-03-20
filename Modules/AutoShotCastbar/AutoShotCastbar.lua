local AutoShotCastbarFrame;
local AutoShotCastbarBar;

local CBConfig = {
    x           = 0;
    y           = -235;
    height      = 12;
    width       = 100;

    innerBorder = { height = 4, width  = 4 };
    outerBorder = { height = 2, width  = 2 };

    reloadColor = { r = 1, g = 0, b = 0 };
    aimingColor = { r = 1, g = 1, b = 0 };

    alpha       = { visible = 1, hidden  = 0 };
}

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
    AutoShotCastbarBar:SetVertexColor(CBConfig.aimingColor.r, CBConfig.aimingColor.g, CBConfig.aimingColor.b);

    reloadingStart = false;
    posX, posY     = GetPlayerMapPosition("player");

    aimingStart    = GetTime();
end


local function GunReload()
    AutoShotCastbarBar:SetVertexColor(CBConfig.reloadColor.r, CBConfig.reloadColor.g, CBConfig.reloadColor.b);

    reloadingStart = GetTime();
    reloadingTime  = UnitRangedDamage("player") - aimingTime;

    aimingStart    = false;
end


function HSK_Module_AutoShotCastbar_CreateBar()
    local posX              = CBConfig.x      * GetScreenWidth()  / 1000;
    local posY              = CBConfig.y      * GetScreenHeight() / 1000;
    local height            = CBConfig.height * GetScreenHeight() / 1000;
    local width             = CBConfig.width  * GetScreenWidth()  / 1000;
    local innerBorderHeight = CBConfig.innerBorder.height;
    local innerBorderWidth  = CBConfig.innerBorder.width;
    local outerBorderHeight = CBConfig.outerBorder.height;
    local outerBorderWidth  = CBConfig.outerBorder.width;

    local frame = HSK_MODULE_AUTOSHOTCASTBAR;
    frame:SetHeight(height);
    frame:SetWidth(width);
    frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY);

    local bar = HSK_MODULE_AUTOSHOTCASTBAR_BAR;
    bar:SetHeight(height);
    bar:SetWidth(width);

    local innerBorder = HSK_MODULE_AUTOSHOTCASTBAR_INNERBORDER;
    innerBorder:SetHeight(height + innerBorderHeight);
    innerBorder:SetWidth(width + innerBorderWidth);

    local outerBorder = HSK_MODULE_AUTOSHOTCASTBAR_OUTERBORDER;
    outerBorder:SetHeight(height + innerBorderHeight + outerBorderHeight);
    outerBorder:SetWidth(width + innerBorderWidth + outerBorderWidth);

    AutoShotCastbarFrame = frame;
    AutoShotCastbarBar   = bar;
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
                AutoShotCastbarFrame:SetAlpha(CBConfig.alpha.visible);

                local timePassed = GetTime() - aimingStart;
                if timePassed <= aimingTime then
                    AutoShotCastbarBar:SetWidth(AutoShotCastbarFrame:GetWidth() * timePassed/aimingTime);
                end
            else
                AutoShotCastbarFrame:SetAlpha(CBConfig.alpha.hidden);
                GunReset();
            end
        end
    else
        local timePassed = GetTime() - reloadingStart;
        if timePassed <= reloadingTime then
            AutoShotCastbarBar:SetWidth(
                AutoShotCastbarFrame:GetWidth() - (AutoShotCastbarFrame:GetWidth() * timePassed/reloadingTime)
            );
        else
            if not shooting then
                AutoShotCastbarFrame:SetAlpha(CBConfig.alpha.hidden);
                AutoShotCastbarBar:SetWidth(0);
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
        AutoShotCastbarFrame:SetAlpha(CBConfig.alpha.hidden);
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
