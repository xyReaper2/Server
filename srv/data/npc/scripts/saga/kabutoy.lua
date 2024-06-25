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

if not (getPlayerSaga(cid, 10, 4) or getPlayerSaga(cid, 10, 5)) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

local area = {{x = 1074, y = 2698, z = 13},{x = 1145, y = 2724, z = 13} }

local msg = string.lower(msg)
if isInArray({"resolver"}, msg) then
npcHandler:say("Pois bem ja pode me entregar oque foi {combinado}.", cid)
talkState[talkUser] = 1
elseif isInArray({"combinado"}, msg) and talkState[talkUser] == 1 then
    if getPlayerSaga(cid, 10, 4) then
    doRemoveCondition(cid, CONDITION_OUTFIT)
    doPlayerNextSaga(cid)
	npcHandler:unGreet(cid)
    end
    if not checkMonstersInArea(area,{"Orochimaru     "}) then
	npcHandler:say("HAHAHA!! Achou que podia me enganar", cid)
    local sumonado = doCreateMonster("orochimarusaga10", getCreaturePosition(cid))
    doCreatureSay(sumonado, "Hahaha! Idiota. Achou mesmo que poderia me enganar!", TALKTYPE_SAY)
	npcHandler:unGreet(cid)
    end
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