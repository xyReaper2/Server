function onStatsChange(cid, attacker, type, combat, value)
    local health = {
        high = {75, 50, 25},
        low = {70, 45, 20}
    }

    local monsters = {
        {name = "Akatsuki unknown", position = {x = 1412, y = 2478, z = 8, dir = WEST}, summon = "Akatsuki spy", summonposition = {x = 1408, y = 2477, z = 8}},
        {name = "Akatsuki guard", position = {x = 1301, y = 2455, z = 8, dir = SOUTH}, summon = "Akatsuki spy", summonposition = {x = 1304, y = 2461, z = 8}},
        {name = "Akatsuki big member", position = {x = 1229, y = 2497, z = 8, dir = WEST}, summon = "Akatsuki spy", summonposition = {x = 1223, y = 2497, z = 8}}
    }

  local playerCount = #getSpectators(getCreaturePosition(cid), 5, 5, false) -- Position: [X: 1394] [Y: 2473] [Z: 8]. -- Position: [X: 1413] [Y: 2481] [Z: 8].
  if playerCount == 0 then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não há jogadores na área.")
    return true
  end

    local hp = math.ceil(100/getCreatureMaxHealth(cid)*getCreatureHealth(cid))

    for _, monster in ipairs(monsters) do
        if getCreatureName(cid):lower() == monster.name:lower() then
            local current_storage = getGlobalStorageValue(250)
            local new_storage = current_storage

            for i = 1, #health.high do
                if hp <= health.high[i] and hp >= health.low[i] then
                    new_storage = health.high[i]
                    break
                end
            end

		local monsterCount = playerCount * 1 -- Change this value to adjust the number of monsters spawned per player.
            if new_storage ~= current_storage then
                setGlobalStorageValue(250, new_storage)
                doCreatureSay(cid, "Aqui está mais uma vítima para vocês!")
                doTeleportThing(cid, monster.position)
                doCreatureSetNoMove(cid, true)
                doCreatureSetLookDirection(cid, monster.position.dir)
                for i = 1, monsterCount do
                    local convince = doCreateMonster(monster.summon, monster.summonposition)
                    doConvinceCreature(cid, convince)
					doCreatureSay(cid, "SPY PEGUE ELE!!!")
                end
            end

            break -- encerra o loop para evitar processar outros monstros com o mesmo nome
        end
    end

    return true
end