
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

if not getPlayerSaga(cid, 4, 1) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local msg = string.lower(msg)
if isInArray({"ajuda"}, msg) then
npcHandler:say(_TR(cid,"Hahaha, tudo bem, vou te dar 3 alternativas, diga qual a correta:\na) {brasil}\nb) {pais do fogo}\nc) {africa}"), cid)
talkState[talkUser] = 1
elseif isInArray({"a","pais do fogo"}, msg) and talkState[talkUser] == 1 then
npcHandler:say(_TR(cid,"Muito bem garoto!"), cid)
doPlayerNextSaga(cid)
npcHandler:unGreet(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif isInArray({"b","brasil"}, msg) then  
selfSay("Vai assistir naruto, mula.", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
elseif isInArray({"c","africa"}, msg) then  
selfSay(_TR(cid,"Africa nem é pais duença é um continente, vai estudar."), cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())