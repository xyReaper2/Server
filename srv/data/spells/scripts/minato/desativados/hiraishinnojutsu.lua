local config = {
storage = 49608,
tempo = 6
}


function onCastSpell(cid, var)
if isPlayer(getCreatureTarget(cid)) then
local name = getCreatureName(getCreatureTarget(cid))


if getPlayerStorageValue(cid, config.storage) <= 0 then
doPlayerSetStorageValue(cid, config.storage, 1)
doSendMagicEffect(getThingPos(cid), 65)
doSendMagicEffect(getThingPos(getCreatureByName(name)), 65)
addEvent(function()
  if isCreature(cid) then
  doPlayerSetStorageValue(cid, config.storage, 0)
  doTeleportThing(cid, getThingPos(getCreatureByName(name))) 
  end
 end, 1000*config.tempo)
elseif getPlayerStorageValue (cid, config.storage) > 0 then
doSendMagicEffect(getThingPos(cid), 2)
doPlayerSendCancel(cid, "Voc� marcou seu target.")
end
elseif(getTilePzInfo(aqui)) then
return doPlayerSendCancel(cid, "N�o pode usar o teleport em casas ou areas protegidas.")
end
else
doPlayerSendCancel (cid, "Voc� s� pode usar esse jutsu em players!.")
end
return true
end
