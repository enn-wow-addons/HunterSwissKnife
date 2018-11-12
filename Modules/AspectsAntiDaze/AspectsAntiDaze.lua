function HSK_Module_AspectsAntiDaze_OnLoad(frame)
    frame:RegisterEvent("UNIT_AURA");
    frame:RegisterEvent("COMBAT_TEXT_UPDATE");
end


HSK_Module_AspectsAntiDaze_OnEvent = {}

HSK_Module_AspectsAntiDaze_OnEvent["UNIT_AURA"] = function(unitId)
    if unitId ~= "player" and (unitId == (string.find(unitId,"party%d")) or unitId == (string.find(unitId,"pet"))) then
        -- TODO: replace with UnitPlayerOrPetInParty("unit")
        -- TODO: replace with UnitPlayerOrPetInRaid("unit")
        if HSK_Core_isDazed(unitId) then
            HSK_Core_CancelBuff(HSK_AURA_PACK_ICON);
        end
    end
end

HSK_Module_AspectsAntiDaze_OnEvent["COMBAT_TEXT_UPDATE"] = function(combatMessageType)
    if combatMessageType == "AURA_START_HARMFUL" then
        if HSK_Core_isDazed("player") then
            HSK_Core_CancelBuff(HSK_AURA_PACK_ICON);
            HSK_Core_CancelBuff(HSK_AURA_CHEETAH_ICON);
        end
    end
end
