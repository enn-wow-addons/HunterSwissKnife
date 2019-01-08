local AutoShotCastbarFrame;
local AutoShotCastbarBar;

local castbarFrame = {
    ["posX"]              = 0;
    ["posY"]              = -235;
    ["height"]            = 12;
    ["width"]             = 100;
    ["innerBorderHeight"] = 4;
    ["innerBorderWidth"]  = 4;
    ["outerBorderHeight"] = 2;
    ["outerBorderWidth"]  = 2;
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
    AutoShotCastbarBar:SetVertexColor(1,1,0);

    reloadingStart = false;
    posX, posY     = GetPlayerMapPosition("player");

    aimingStart    = GetTime();
end


local function GunReload()
    AutoShotCastbarBar:SetVertexColor(1,0,0);

    reloadingStart = GetTime();
    reloadingTime  = UnitRangedDamage("player") - aimingTime;

    aimingStart    = false;
end


function HSK_Module_AutoShotCastbar_CreateBar()
    local posX              = castbarFrame["posX"]   * GetScreenWidth()   / 1000;
    local posY              = castbarFrame["posY"]   * GetScreenHeight()  / 1000;
    local height            = castbarFrame["height"] * GetScreenHeight()  / 1000;
    local width             = castbarFrame["width"]  * GetScreenWidth()   / 1000;
    local innerBorderHeight = castbarFrame["innerBorderHeight"];
    local innerBorderWidth  = castbarFrame["innerBorderWidth"];
    local outerBorderHeight = castbarFrame["outerBorderHeight"];
    local outerBorderWidth  = castbarFrame["outerBorderWidth"];

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

    HSK_Core_PrintToChat(HSK_COLOR_CYAN.."AutoShotCastbar Module |rLoaded");
end


function HSK_Module_AutoShotCastbar_OnUpdate()
    if not reloadingStart then
        if shooting then
            local cposX, cposY = GetPlayerMapPosition("player");

            if cposX == posX and cposY == posY then
                AutoShotCastbarFrame:SetAlpha(1);

                local timePassed = GetTime() - aimingStart;
                if timePassed <= aimingTime then
                    AutoShotCastbarBar:SetWidth(AutoShotCastbarFrame:GetWidth() * timePassed/aimingTime);
                end
            else
                AutoShotCastbarFrame:SetAlpha(0);
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
                AutoShotCastbarFrame:SetAlpha(0);
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
        AutoShotCastbarFrame:SetAlpha(0);
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
