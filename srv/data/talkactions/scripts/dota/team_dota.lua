function onSay(cid, words, param, channel)
local mensage1 = "[Evento Dota] Liberada Sala dos Times! Quem quiser Participar, v� para a sala de times at� o Evento come�ar. Depois que come�ar, s� na outra rodada! Gogo (TELEPORTE PARA O DOTA NO TEMPLO DA CIDADE PRINCIPAL)" -- Mensagem Inicial

gatepos = {x=677, y=14, z=7, stackpos=1} -- Posi��o da Pedra
getgate = getThingfromPos(gatepos)

if getgate.itemid == 1304 then
broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE)
doRemoveItem(getgate.uid,1)

end
return 1
end