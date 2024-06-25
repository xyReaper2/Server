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


if not (getPlayerSaga(cid, 9, 1) or getPlayerSaga(cid, 15, 1)) then
npcHandler:say("[SAGA SYSTEM]I can't talk to you right now.", cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"missao","mission"}, msg) and getPlayerSaga(cid, 9, 1) then
npcHandler:say("I received a report from SunaGakure, Kazekage Gaara was taken by akatsuki, they need our help to {rescue} him, we don't know what they can do!", cid)
talkState[talkUser] = 1
elseif isInArray({"seguir", "follow", "go", "following", "move on"}, msg) and getPlayerSaga(cid, 15, 1) then
npcHandler:say("Antes que a Akatsuki faça outro ataque, o fukasaku propôs leva-lo para treinar com os sapos no monte myoboku!!", cid)
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif isInArray({"resgata","sim","resgatar", "yes", "rescue"}, msg) and talkState[talkUser] == 1 and getPlayerSaga(cid, 9, 1) then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif msg == "no" then  
selfSay("Hahahaha, sabia que voce era fraco, fuja seu verme, fuja pra bem longe", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())