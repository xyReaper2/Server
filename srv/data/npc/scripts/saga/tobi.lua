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

if not getPlayerSaga(cid, 14, 1) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local msg = string.lower(msg)
if isInArray({"missao", "mission"}, msg) then
npcHandler:say("prove to me that you have enough strength to be part of this faction, defeat the jinchuuriki of {KumoGakure No Sato} and bring it to us..be careful, that ninja is a complete jinchuuriki.", cid)
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())