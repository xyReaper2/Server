local name_bosses_DG ={"Akatsuki unknown", "Akatsuki guard", "Akatsuki big member"} -- nome dos boss's da DG

function onKill(cid, target)
    if not isCreature(cid) then
        return true
    end

    if not isCreature(target) then
        return true
    end

    if isInArray(name_bosses_DG, getCreatureName(target)) and getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) - os.time() > 0 then
        if getPartyMembers(cid) ~= false then
            for k, v in ipairs(getPartyMembers(cid)) do
                local tabela = DUNGEONS_MISSIONCATEGORY[getPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY)]
                if not tabela then return true end
                tabela = tabela[getPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION)]

                doPlayerSendTextMessage(v, 25, "Parabéns! você derrotaram o boss, portanto você foram teleportados para a area do premio.")
                checkSalaDisponivelBauParty(cid, getPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY), getPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION))
            end
        else
            local tabela = DUNGEONS_MISSIONCATEGORY[getPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY)]
            if not tabela then return true end
            tabela = tabela[getPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION)]

            doPlayerSendTextMessage(cid, 25, "Parabéns! você derrotou o boss, portanto você foi teleportado para a area do premio.")
            checkSalaDisponivelBau(cid, getPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY), getPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION))
        end
    end
    return true
end