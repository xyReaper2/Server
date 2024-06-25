local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if not getPlayerSaga(cid, 11, 1) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

if(msgcontains(msg, 'missoes')) then
selfSay('Ok, Para come�ar vamos fazer a {primeira missao}?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'primeira missao')) then
setPlayerStorageValue(cid,14543,1)
selfSay('Mate alguns nekenins e me traga 10 Nukenin {talisma}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'talisma') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,1111) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 10551, 10) == true) then
setPlayerStorageValue(cid,1111,1)
setPlayerStorageValue(cid,24342,1)
doPlayerAddExperience(cid,5000)

selfSay('Obrigado! Se quiser ja podes fazer a {segunda missao}.. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
else
selfSay('Voce n�o tens os 10 nukenins talisma ainda..', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'segunda missao')) then
if getPlayerStorageValue(cid,24342) < 1 then
selfSay('Voce ainda n�o completou a Primeira Miss�o', cid)
return true
end
selfSay('Va ate a Florest Renegade, quero que me tragas 25 renegade {essence}', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'essence') and talkState[talkUser] == 2) then
if (getPlayerStorageValue(cid,1222) > 0) then
selfSay('Voce ja acabou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 6500, 25) == true) then
setPlayerStorageValue(cid,24342,2)
setPlayerStorageValue(cid,1222,1)
doPlayerAddExperience(cid,10000)
selfSay('Obrigado! Se quiser ja podes fazer a {terceira missao}.. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
else
selfSay('Voce n�o tens os  25 renegade essence ainda', cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'terceira missao')) then
if getPlayerStorageValue(cid,24342) < 2 then
selfSay('Voce ainda n�o completou a Segunda Miss�o', cid)
return true
end
selfSay('Va ate o Local 05 do mapa que fica na Floresta Renegade, Tens um Shinobi de gradua��o Jounin la que roubou 1 saco de {dinheiro} de um alde�o, pegue e traga para mim.', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'dinheiro') and talkState[talkUser] == 3) then
if (getPlayerStorageValue(cid,1333) > 0) then
selfSay('Voc� ja terminou essa miss�o e ainda n�o tenho uma quarta miss�o para lhe dar.', cid)
else
if(doPlayerRemoveItem(cid, 2690, 1) == true) then
setPlayerStorageValue(cid,1333,1)
doPlayerAddExperience(cid,15000)
selfSay('Obrigado! Voce ja terminou 3 miss�es minhas, ja � digno de fazer o exame Jounin. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
setPlayerStorageValue(cid,89745, 3)
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
else
selfSay('Voce n�o pegou o Saco de Dinheiro ainda', cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
end
end
return true
end
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())