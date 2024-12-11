HSK_Module_AspectsOverride_OnAction = {}

HSK_Module_AspectsOverride_OnAction[HSK_SPELL_HAWK_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_HAWK_ICON, "player") then
        CastSpellByName(HSK_SPELL_HAWK_NAME);
    end
end

HSK_Module_AspectsOverride_OnAction[HSK_SPELL_MONKEY_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_MONKEY_ICON, "player") then
        CastSpellByName(HSK_SPELL_MONKEY_NAME);
    end
end

HSK_Module_AspectsOverride_OnAction[HSK_SPELL_CHEETAH_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_CHEETAH_ICON, "player") then
        CastSpellByName(HSK_SPELL_CHEETAH_NAME);
    end
end

HSK_Module_AspectsOverride_OnAction[HSK_SPELL_PACK_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_PACK_ICON, "player") then
        CastSpellByName(HSK_SPELL_PACK_NAME);
    end
end

HSK_Module_AspectsOverride_OnAction[HSK_SPELL_BEAST_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_BEAST_ICON, "player") then
        CastSpellByName(HSK_SPELL_BEAST_NAME);
    end
end

HSK_Module_AspectsOverride_OnAction[HSK_SPELL_WILD_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_WILD_ICON, "player") then
        CastSpellByName(HSK_SPELL_WILD_NAME);
    end
end


HSK_Module_AspectsOverride_OnAction[HSK_SPELL_WOLF_NAME] = function(slot, checkCursor, onSelf)
    if not HSK_Core_IsBuffActive(HSK_AURA_WOLF_ICON, "player") then
        CastSpellByName(HSK_SPELL_WOLF_NAME);
    end
end
