function onCastSpell(cid, var)
if isPlayer(cid) and getPlayerStorageValue(cid, 17456)-os.time() > 1 then
local seetime = getPlayerStorageValue(cid, 17456)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..minutes.." minuto(s) e "..seconds.." segundo(s) para usar novamente!")
return false
end

setPlayerStorageValue(cid, 17456, 5*60+os.time())
for _, uid in pairs (getCreatureSummons(cid)) do
doSendMagicEffect(getThingPosition(uid), 54)
doRemoveCreature(uid)
end  
doPlayerSetVocation(cid, 130)
doCreatureChangeOutfit(cid, {lookType = 290})
return true
end