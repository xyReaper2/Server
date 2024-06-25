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

if not getPlayerSaga(cid, 8, 2) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local msg = string.lower(msg)
if isInArray({"resgate","resgatar"}, msg) then
npcHandler:say("Hm.. Entao quer ajudar a resgatar o sasuke {yes} ou {no}.", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","pronto","ajudar"}, msg) and talkState[talkUser] == 1 then
npcHandler:say("Fiquei sabendo que a equipe do orochimaru foi vista recentemente em south florest.", cid)
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