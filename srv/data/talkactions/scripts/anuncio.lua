local config = {
storage = 245434, -- storage em que ser� salvo o tempo
cor = "green", -- de acordo com o constant.lua da lib
tempo = 300, -- em minutos
itemid = 2160,
price = 10, -- quantidade de dinheiro que ir� custar
level = 150 -- level pra poder utilizar o broadcast
}
 
 
function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� precisa escrever algo.")
return true
end
if getGlobalStorageValue(5421) < 1 then
if getPlayerLevel(cid) >= config.level then
if getPlayerStorageValue(cid, config.storage) - os.time() <= 0 then
if doPlayerRemoveItem(cid, config.itemid, config.price) then
setPlayerStorageValue(cid, config.storage, os.time() + (config.tempo*1)) 
doBroadcastMessage(""..getCreatureName(cid).." [ANUNCIO]: "..param.."", config.cor)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voce enviou com sucesso um Anuncio, agora voc� vai ter que esperar " ..config.tempo.. " second(s) until you broadcast again.")
return true
else
doPlayerSendCancel(cid, "Voc� n�o tem "..price.." Gds para anunciar.")
return true
end
else
doPlayerSendCancel(cid, "Voc� tem que esperar " ..(getPlayerStorageValue(cid, config.storage) - os.time()).. " segundos para anunciar novamente.")
return true
end
else
doPlayerSendCancel(cid, "Voc� precisa de "..config.level.."+ para anunciar.")
end
else
doPlayerSendCancel(cid, "ANUNCIO FOI BLOQUEADO.")
return true
end
end