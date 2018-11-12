HSK_Module_CallPetOverride_OnAction = {}

HSK_Module_CallPetOverride_OnAction[HSK_SPELL_CALLPET_NAME] = function(slot, checkCursor, onSelf)
    if HSK_Core_HasPet() then
        if UnitIsUnit("playertarget", "pettarget") then
            PetFollow();
        else
            PetAttack();
        end
    else
        CastSpellByName(HSK_SPELL_CALLPET_NAME);
    end
end
