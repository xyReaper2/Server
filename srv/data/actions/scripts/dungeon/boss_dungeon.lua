local lever = {
  [14101] = {storage = 29323, cooldown = 5}
}

local config = {
  effect = 700,
  duration = 60000,
  interval = 3,
  monsters = {
    {name = "Akatsuki spy", pos = {x = 1409, y = 2477, z = 8}}
  }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
  local info = lever[item.actionid]
  if not info then return true end

  local cooldown = getPlayerStorageValue(cid, info.storage) - os.time()
  if cooldown > 0 then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa esperar alguns segundos antes de ativar novamente.", cooldown)
    return true
  end

  local playerCount = #getAllPlayersInArea({x = 1394, y = 2473, z = 8}, {x = 1413, y = 2481, z = 8}) -- Position: [X: 1394] [Y: 2473] [Z: 8]. -- Position: [X: 1413] [Y: 2481] [Z: 8].
  if playerCount == 0 then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não há jogadores na área.")
    return true
  end

  local monsterCount = playerCount * 2 -- Change this value to adjust the number of monsters spawned per player.
  local monsters = getSpectators({x = 1407, y = 2478, z = 8}, 3, 3, false)
  for _, monster in ipairs(monsters) do
    if isMonster(monster) then
      doCreatureSetNoMove(monster, true)
      doCreatureAddHealth(monster, getCreatureMaxHealth(monster))
	  addEvent(doCreatureSetNoMove, 1000 + config.duration * 1000, monster, false)
      addEvent(doCreatureSay, 2000, monster, "Minha energia foi restaurada!")
      addEvent(doCreatureSay, 4000, monster, "Eu vou destruir todos vocês!")
      addEvent(doTeleportThing, 1000, monster, {x = 1412, y = 2478, z = 8})
      for i = 1, monsterCount do
        local delay = (i - 1) * config.interval * 1000
        addEvent(doCreateMonster, delay, config.monsters[math.random(1, #config.monsters)].name, {x = 1409, y = 2477, z = 8})
      end
      addEvent(doCreatureSay, 20000, monster, "HAHAHAHAAAAAA!")
      addEvent(doCreatureSay, 25000, monster, "HAHAHAHAAAAAA!")
      addEvent(doCreatureSay, 30000, monster, "SUA DERROTA É MINHA VITÓRIA!")
      addEvent(doCreatureSay, 60000, monster, "VAMOS LUTAR!!!")
    end
  end

  addEvent(function()
    for i = 1, #config.monsters do
      local creature = getCreatureByName(config.monsters[i].name)
      if creature then
        doTeleportThing(creature, config.monsters[i].pos)
      end
    end
  end, 60000)

  setPlayerStorageValue(cid, info.storage, os.time() + info.cooldown)
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você ativou")
  return true
end