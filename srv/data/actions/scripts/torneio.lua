function onUse(cid, item)
local torneios = 1
if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "remove o kuchyose caso esteja!")
else
if #getPlayersInArea(torneio.area) > 1 then
doPlayerSendTextMessage(cid, 20 ,"S� o ultimo que ficar na arena, poder� abrir est� porta! ") return true end
doTeleportThing(cid, torneio.playerTemple)
doBroadcastMessage("[Torneio] Parab�ns ao treinador "..getCreatureName(cid).." foi o ganhador do torneio de hoje, verifique o rank em nosso site www.narutoinsanity.ddns.net!")
doPlayerAddItem(cid,2160,100)
doPlayerAddItem(cid,10137,2)
doPlayerAddItem(cid,7477,150)
doPlayerAddItem(cid,2144,150)
addTopt(cid, torneios)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ORANGE,"[Torneio] Voc� j� venceu "..(getTopt(cid,torneio)).."x, Parab�ns.")
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
return true
end
end