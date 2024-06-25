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


if not getPlayerSaga(cid, 9, 5) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"yes"}, msg) then
npcHandler:say("Preciso apenas que você {transmita} seu chakra para o corpo dele!!", cid)
setPlayerStorageValue(cid,16332, 0)
doPlayerNextSaga(cid)
removeSummons(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif msg == "transmita" then  
selfSay("Basta você clicar com o botão direito do mouse no corpse", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid) 
elseif msg == "no" then  
selfSay("Covarde vai deixar o kazekage morrer mermao tu ta maluco é?", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())