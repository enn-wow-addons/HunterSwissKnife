HSK_Module_AutoShotOverride_OnAction = {}

HSK_Module_AutoShotOverride_OnAction[HSK_SPELL_AUTOSHOT_NAME] = function(slot, checkCursor, onSelf)
    if CheckInteractDistance("target", 3) and (not PlayerFrame.inCombat) then
        AttackTarget();
    elseif not IsAutoRepeatAction(slot) then
        CastSpellByName(HSK_SPELL_AUTOSHOT_NAME);
    end
end
