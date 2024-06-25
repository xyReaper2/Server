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

if not getPlayerSaga(cid, 6, 1) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local msg = string.lower(msg)
if isInArray({"ajuda","ajudar"}, msg) then
npcHandler:say("Ultimamente eu ando preocupado com a tsunade pelo fato de orochimaru ter aparecido recetemente, voce pode ir {conversar} com ela?.", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","pronto","conversar"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
npcHandler:unGreet(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif msg == "no" then  
selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())