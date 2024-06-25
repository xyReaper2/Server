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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if not getPlayerSaga(cid, 15) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local msg = string.lower(msg)
if isInArray({"treino"}, msg) and getPlayerSaga(cid, 15, 4) then
npcHandler:say("Muito bem!! Vejo que conseguiu concetrar o seu Chakra agora vença uma {batalha} com o gamabunta para concluir seu treino", cid)
talkState[talkUser] = 1
elseif isInArray({"treino"}, msg) and getPlayerSaga(cid, 15, 6) then
npcHandler:say("Estou surpreso com tal poder, vejo que concluiu seu treino e ja pode {voltar} para konoha", cid)
talkState[talkUser] = 2
elseif isInArray({"batalha"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif isInArray({"voltar"}, msg) and talkState[talkUser] == 2 then
doTeleportThing(cid,{x = 2196, y = 3312, z = 7})
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif msg == "no" then  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())