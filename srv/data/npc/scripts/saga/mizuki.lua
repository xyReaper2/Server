local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatMizuki(cid)
if isCreature(cid) then
registerCreatureEvent(cid, "sagaonemfourk")
local sumonado = doCreateMonster("mizukii", {x= 1972, y=1966, z= 7})
doCreatureSay(sumonado, "Nessa floresta sera seu Funeral!!", TALKTYPE_SAY)
removeSummons(cid)
-- doRemoveCreature(getCreatureByName("Mizuki "))
end
end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end


if not getPlayerSaga(cid, 1,4) then
npcHandler:say(npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_SAGAERROR), {[TAG_PLAYERNAME] = getCreatureName(cid)}), cid)
npcHandler:unGreet(cid)  
return false
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"lutar"}, msg) then
npcHandler:say("HAHAHAHA, um mero academico quer mesmo lutar contra um Chunin, sabes que nao tem chance, esta mesmo preparado? {yes}", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","sim"}, msg) and talkState[talkUser] == 1 then
addEvent(creatMizuki, 2, cid)
npcHandler:unGreet(cid)
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