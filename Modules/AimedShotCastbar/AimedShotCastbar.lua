local berserkValue   = false;
local aimedStart     = false;
local posX, posY;


local function AimedShotStart()
    local aimedShotTime = 3;

    for i = 1, 32 do
        if UnitBuff("player", i) == HSK_AURA_QUICKSHOTS_ICON then
            aimedShotTime = aimedShotTime / 1.3;
        end
        if UnitBuff("player", i) == HSK_AURA_RAPIDFIRE_ICON then
            aimedShotTime = aimedShotTime / 1.4;
        end
        if UnitBuff("player", i) == HSK_AURA_TROLLBERSERK_ICON then
            aimedShotTime = aimedShotTime / berserkValue;
        end
        if UnitBuff("player", i) == HSK_AURA_NAXXHASTTRINKET_ICON then
            aimedShotTime = aimedShotTime / 1.2;
        end
    end

    CastingBarFrame.startTime = GetTime();
    CastingBarFrame.maxValue  = CastingBarFrame.startTime + aimedShotTime;
    CastingBarFrame.mode      = "casting";
    CastingBarFrame.casting   = 1;
    CastingBarFrame.holdTime  = 0;
    CastingBarFrame.fadeOut   = nil;

    CastingBarFrameStatusBar:SetStatusBarColor(1.0, 0.7, 0.0);
    CastingBarFrameStatusBar:SetMinMaxValues(CastingBarFrame.startTime, CastingBarFrame.maxValue);
    CastingBarFrameStatusBar:SetValue(CastingBarFrame.startTime);

    CastingBarText:SetText(string.format("%s   %.2f", HSK_SPELL_AIMEDSHOT_NAME, aimedShotTime));


    CastingBarFrame:Show();
    CastingBarFrameStatusBar:Show();
    CastingBarSpark:Show();

    posX, posY = GetPlayerMapPosition("player");
    aimedStart = true;
end


local function AimedShotStop()
    CastingBarFrame:Hide();
    CastingBarFrameStatusBar:Hide();
    CastingBarSpark:Hide();

    aimedStart = false;
end


local function CheckBerserk()
    for i = 1, 16 do
        if UnitBuff("player", i) == HSK_AURA_TROLLBERSERK_ICON then
            if not berserkValue then
                local healthRatio = UnitHealth("player") / UnitHealthMax("player");

                if healthRatio >= 0.40 then
                    berserkValue = 1 + ((1.30 - healthRatio) / 3);
                else
                    berserkValue = 1.30;
                end
            end

            return;
        end
    end

    berserkValue = false;
end


function HSK_Module_AimedShotCastbar_OnLoad(frame)
    frame:RegisterEvent("UNIT_AURA");

    frame:RegisterEvent("SPELLCAST_STOP");
    frame:RegisterEvent("SPELLCAST_FAILED");
    frame:RegisterEvent("SPELLCAST_INTERRUPTED");

    HSK_Core_PrintToChat(HSK_COLOR_CYAN.."AimedShotCastbar Module |rLoaded");
end


function HSK_Module_AimedShotCastbar_OnUpdate()
    if aimedStart then
        local cposX, cposY = GetPlayerMapPosition("player");

        if not (cposX == posX and cposY == posY) then
            AimedShotStop();
        end
    end
end


HSK_Module_AimedShotCastbar_OnEvent = {}

HSK_Module_AimedShotCastbar_OnEvent["UNIT_AURA"] = function()
    CheckBerserk();
end

HSK_Module_AimedShotCastbar_OnEvent["SPELLCAST_STOP"] = function()
    AimedShotStop();
end

HSK_Module_AimedShotCastbar_OnEvent["SPELLCAST_FAILED"] = function()
    AimedShotStop();
end

HSK_Module_AimedShotCastbar_OnEvent["SPELLCAST_INTERRUPTED"] = function()
    AimedShotStop();
end


HSK_Module_AimedShotCastbar_OnAction = {}

HSK_Module_AimedShotCastbar_OnAction[HSK_SPELL_AIMEDSHOT_NAME] = function(slot, checkCursor, onSelf)
    AimedShotStart();
end


HSK_Module_AimedShotCastbar_OnCastSpellByName = {}

HSK_Module_AimedShotCastbar_OnCastSpellByName[HSK_SPELL_AIMEDSHOT_NAME] = function(spellName)
    AimedShotStart();
end


function HSK_Module_AimedShotCastbar_OnCastSpell(spellId, spellTab)
    if GetSpellName(spellId,"BOOKTYPE_SPELL") == HSK_SPELL_AIMEDSHOT_NAME then
        AimedShotStart();
    end
end
