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

if not getPlayerSaga(cid, 6, 2) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

local msg = string.lower(msg)
if isInArray({"certa","yes"}, msg) then
npcHandler:say("Pois bem, o problema e que o orochimaru e o kabuto estao tramando algo e precisam que eu desfaça o jutsu usado pelo Sandaime Hokage que selou os braços do orochimaru. Voce pode me ajudar {derrota}-los?", cid)
talkState[talkUser] = 1
elseif isInArray({"derrota","derrotar","sim","yes"}, msg) and talkState[talkUser] == 1 then
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