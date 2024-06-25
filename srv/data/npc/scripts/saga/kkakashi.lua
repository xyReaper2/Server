local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local temp_Saga2 = 10 -- tempo em minutos
local g_stor_Saga2 = 5000
local function saga2V(cid)
if isCreature(cid) and isInRange(getCreaturePosition(cid), {x= 2273, y=3666, z= 7}, {x= 2351, y=3742, z= 7}) then
doTeleportThing(cid,{x= 2050, y=2095, z= 7})
setPlayerSaga(cid, 2, 1)
doPlayerSendTextMessage(cid,22,"Seu tempo acabou")
end
end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

local msg = string.lower(msg)


if not (getPlayerSaga(cid, 2, 1) or getPlayerSaga(cid, 5, 1) or getPlayerSaga(cid, 8, 1)) then
npcHandler:say("[SAGA SYSTEM]I can't talk to you right now.", cid)
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
return true
end


if isInArray({"treino","treinar", "training", "train"}, msg) and getPlayerSaga(cid, 2, 1) then
npcHandler:say("Para concluir o treino basta me derrotar e pegar meus gizos, voce esta {pronto}?.", cid)
talkState[talkUser] = 2
elseif isInArray({"yes","pronto"}, msg) and getPlayerSaga(cid, 2, 1) and talkState[talkUser] == 2 then
if getGlobalStorageValue(g_stor_Saga2) - os.time() <= 0 then
npcHandler:say("Boa Sorte!", cid)
npcHandler:say("Você tem "..temp_Saga2.." minutos para completar a saga", cid)
setGlobalStorageValue(g_stor_Saga2, temp_Saga2*60 + os.time())
addEvent(saga2V, temp_Saga2*TIME_MINUTES, cid)
doSetCreatureOutfit(cid, {lookType = 350}, -1)
doPlayerNextSaga(cid)
doTeleportThing(cid, {x= 2300, y=3698, z= 7})
removeSummons(cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)
else
local seetime = getGlobalStorageValue(g_stor_Saga2)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
npcHandler:say(string.format(_TR(cid,"Alguem fez esta saga recentemente, favor aguarde %s minutos e %s segundos"), minutes, seconds), cid)
end
elseif isInArray({"deter","deter-lo", "stop"}, msg) and getPlayerSaga(cid, 5, 1) then
npcHandler:say("Tem {certeza} que pode fazer isso? Nao tenho certeza do que o gaara pode fazer nesse estado?.", cid)
talkState[talkUser] = 6
elseif isInArray({"yes","certeza", "sim"}, msg) and getPlayerSaga(cid, 5, 1) and talkState[talkUser] == 6 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
elseif isInArray({"para","parar","para-los", "stop"}, msg) and (getPlayerStorageValue(cid, 40000) == 8) then
npcHandler:say("Nesse momento precisamos do maximo de ajuda possivel, se voce quer {ajudar} nesta missao va até o shikamaru.", cid)
talkState[talkUser] = 11
elseif isInArray({"ajudar"}, msg) and getPlayerSaga(cid, 8, 1) and talkState[talkUser] == 11 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
elseif msg == "no" and getPlayerSaga(cid, 2, 1) then  
selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)
elseif msg == "no" and getPlayerSaga(cid, 5, 1) then  
selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)
elseif msg == "no" and getPlayerSaga(cid, 8, 1) then  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())