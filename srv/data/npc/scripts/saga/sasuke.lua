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

if not getPlayerSaga(cid, 7, 1) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"parar"}, msg) then
npcHandler:say("HAHAHAHA, ninguem vai me impedir de matar meu irmão e se você não sair do meu caminho tambem morrerá? quer mesmo tentar a sorte idiota?{yes}", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","sim"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
doRemoveCreature(getNpcId())
doCreateMonster("Sasuke  ", {x= 2120, y=2065, z= 5})
talkState[talkUser] = 0
npcHandler:unGreet(cid)
elseif msg == "no" then  
selfSay("Hahahaha, sabia que você era fraco, fuja seu verme, fuja pra bem longe", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())