function HSK_Core_PrintToChat(text)
    DEFAULT_CHAT_FRAME:AddMessage(text);
end


function HSK_Core_IsBuffActive(buffIcon, unit)
    if not buffIcon then return nil end
    if not unit then unit = "player" end

    local it = 0;
    if unit == "player" then
        while true do
            local buffIndex = GetPlayerBuff(it);
            if buffIndex == -1 then break end

            if string.find(GetPlayerBuffTexture(buffIndex), buffIcon) then
                return it;
            end

            it = it + 1;
        end
    else
        while true do
            local buffTexture = UnitBuff(unit, it+1);
            if not buffTexture then break end

            if string.find(buffTexture, buffIcon) then
                return it;
            end

            it = it + 1;
        end
    end

    return nil;
end


function HSK_Core_IsDebuffActive(debuffIcon, unit)
    if not debuffIcon then return nil end
    if not unit then unit = "player" end

    local it = 0;
    while true do
        local debuffTexture = UnitDebuff(unit, it+1);
        if not debuffTexture then break end

        if string.find(debuffTexture, debuffIcon) then
            return it;
        end

        it = it + 1;
    end

    return nil;
end


function HSK_Core_CancelBuff(buffIcon)
    local buffIndex = HSK_Core_IsBuffActive(buffIcon, "player");
    if buffIndex then
        CancelPlayerBuff(buffIndex);
    end
end


function HSK_Core_isDazed(unit)
    if not ((IsMounted) and UnitIsMounted("player")) then
        if HSK_Core_IsDebuffActive(HSK_AURA_DAZED_ICON, unit) then
            return true;
        end
    end

    return false;
end


function HSK_Core_HasPet()
    local hasUI, isHunterPet = HasPetUI();
    if hasUI and isHunterPet then
        return true;
    end

    return false;
end


function HSK_Core_GetSpellNameById(spellId)
    return GetSpellName(spellId, "BOOKTYPE_SPELL");
end


function HSK_Core_GetSpellIdByName(spellName, spellPage)
    local whatPage = spellPage;
    if not spellPage then whatPage = GetNumSpellTabs() end

    local _, _, offset, numSpells = GetSpellTabInfo(whatPage);
    numSpells = offset + numSpells;
    if not spellPage then offset = 0 end

    for spellId = numSpells, offset+1, -1 do
        if GetSpellName(spellId, "BOOKTYPE_SPELL") == spellName then
            return spellId;
        end
    end

    return nil;
end
