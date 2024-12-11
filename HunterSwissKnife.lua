-----------------------
-- Command Interface --
-----------------------

SLASH_HUNTERSWISSKNIFE1 = "/hsk";
SLASH_HUNTERSWISSKNIFE2 = "/hunterswissknife";

function HSK_OnCmd(argument)
    HSK_UI_MainMenu_OnShow();
end


---------------------------
-- Event-based functions --
---------------------------

function HSK_OnLoad()
    HSK_Module_AspectsAntiDaze_OnLoad(this);
    HSK_Module_AimedShotCastbar_OnLoad(this);
    HSK_Module_AutoShotCastbar_OnLoad(this);

    SlashCmdList["HUNTERSWISSKNIFE"] = HSK_OnCmd;

    HSK_Core_PrintToChat(HSK_MESSAGE_ADDONLOADED);
end


function HSK_OnUpdate()
    if HSK_Settings.AimedShotCastbar.Enabled then
        HSK_Module_AimedShotCastbar_OnUpdate();
    end
    if HSK_Settings.AutoShotCastbar.Enabled then
        HSK_Module_AutoShotCastbar_OnUpdate();
    end
end


function HSK_OnEvent()
    if HSK_Settings.AspectsAntiDaze.Enabled and HSK_Module_AspectsAntiDaze_OnEvent[event] then
        HSK_Module_AspectsAntiDaze_OnEvent[event](arg1);
    end
    if HSK_Settings.AimedShotCastbar.Enabled and HSK_Module_AimedShotCastbar_OnEvent[event] then
        HSK_Module_AimedShotCastbar_OnEvent[event]();
    end
    if HSK_Settings.AutoShotCastbar.Enabled and HSK_Module_AutoShotCastbar_OnEvent[event] then
        HSK_Module_AutoShotCastbar_OnEvent[event]();
    end
end


-----------------------------------
-- Overridden blizzard functions --
-----------------------------------

local HSK_Original_CastSpell = CastSpell;
function CastSpell(spellID, spellbookType)
    if HSK_Settings.AimedShotCastbar.Enabled then
        HSK_Module_AimedShotCastbar_OnCastSpell(spellID, spellbookType);
    end

    -- ORIGINAL CAST: should not be called if the triggered and original action are exclusive
    HSK_Original_CastSpell(spellID, spellbookType);
end


local HSK_Original_CastSpellByName = CastSpellByName;
function CastSpellByName(spellName, onSelf)
    if HSK_Settings.AimedShotCastbar.Enabled and HSK_Module_AimedShotCastbar_OnCastSpellByName[spellName] then
        HSK_Module_AimedShotCastbar_OnCastSpellByName[spellName](spellName, onSelf);
    end

    -- ORIGINAL CAST: should not be called if the triggered and original action are exclusive
    HSK_Original_CastSpellByName(spellName);
end


local actionTooltip = CreateFrame("GameTooltip", "actionTooltip", UIParent, "GameTooltipTemplate");
actionTooltip:SetOwner(UIParent,"ANCHOR_NONE");

local HSK_Original_UseAction = UseAction;
function UseAction(slot, checkCursor, onSelf)
    actionTooltip:ClearLines();
    actionTooltip:SetAction(slot);
    local spellName = actionTooltipTextLeft1:GetText();

    local isOriginalExcluded = false;

    if HSK_Settings.AimedShotCastbar.Enabled and HSK_Module_AimedShotCastbar_OnAction[spellName] then
        HSK_Module_AimedShotCastbar_OnAction[spellName](slot, checkCursor, onSelf);
    end
    if HSK_Settings.AspectsOverride.Enabled and HSK_Module_AspectsOverride_OnAction[spellName] then
        HSK_Module_AspectsOverride_OnAction[spellName](slot, checkCursor, onSelf);
        isOriginalExcluded = true;
    end
    if HSK_Settings.AutoShotOverride.Enabled and HSK_Module_AutoShotOverride_OnAction[spellName] then
        HSK_Module_AutoShotOverride_OnAction[spellName](slot, checkCursor, onSelf);
        isOriginalExcluded = true;
    end
    if HSK_Settings.CallpetOverride.Enabled and HSK_Module_CallPetOverride_OnAction[spellName] then
        HSK_Module_CallPetOverride_OnAction[spellName](slot, checkCursor, onSelf);
        isOriginalExcluded = true;
    end

    --ORIGINAL CAST: should not be called if the triggered and original action are exclusive
    if not isOriginalExcluded then
        HSK_Original_UseAction(slot, checkCursor, onSelf);
    end
end
