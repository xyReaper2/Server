local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local area = {
{{x = 1830, y = 3565, z = 7},{x = 1998, y = 3843, z = 7}},
{{x = 1830, y = 3565, z = 6},{x = 1998, y = 3843, z = 6}}
}
local checkTime = 20 -- tempo em minutos
local storage_Saga4 = 50001

local function checkSaga4(cid)
if isCreature(cid) and getCreatureIn(cid, area) then
doPlayerRemoveItem(cid, 2198, getPlayerItemCount(cid, 2198))
doPlayerRemoveItem(cid, 2199, getPlayerItemCount(cid, 2199))
setPlayerSaga(cid, 4, 2)
setPlayerStorageValue(cid,39842, 0)
setPlayerStorageValue(cid,39843, 0)
doPlayerSendTextMessage(cid,22, "Your time is over")
doTeleportThing(cid,{x= 1965, y=2026, z= 7})
end
end

local function createOrochi(cid)
if isCreature(cid) then
doPlayerNextSaga(cid)
local sumonado = doCreateMonster("Orochimaru ", getCreaturePosition(cid))
onSay(sumonado, "Hello Sasuke", TALKTYPE_SAY)
addEvent(onSay, 1000, sumonado, "Shh...",TALKTYPE_SAY)
doSetCreatureOutfit(cid, {lookType = 390}, -1)
end
end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid


if not getPlayerSaga(cid, 4, 2) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end


local msg = string.lower(msg)
if isInArray({"exame","fight","entrar","participar"}, msg) then
npcHandler:say("HAHAHAHA, a mere novice genin really want to {try} his luck? because the rules are as follows, you need to collect 2 scrolls and go to the chunin exam tower", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","sim","tentar", "try"}, msg) and talkState[talkUser] == 1 then
if getGlobalStorageValue(storage_Saga4) - os.time() <= 0 then
doPlayerNextSaga(cid)
setPlayerStorageValue(cid,40235, 0)
npcHandler:say(string.format(_TR(cid,"You have %d minutes to complete the saga"), checkTime), cid)
setGlobalStorageValue(storage_Saga4, checkTime*60 + os.time())
addEvent(checkSaga4, checkTime*TIME_MINUTES, cid)
addEvent(createOrochi, 5000, cid)
setPlayerStorageValue(cid, 39842, 0)
setPlayerStorageValue(cid, 39843, 0)
doTeleportThing(cid, {x = 1899, y = 3812, z = 7})
removeSummons(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
else
local seetime = getGlobalStorageValue(storage_Saga4)-os.time()
local minutes, seconds =  math.floor(seetime/60), math.floor(seetime%60)
npcHandler:say(string.format(_TR(cid,"Someone did this saga recently, please wait %s minutes and %s seconds"), minutes, seconds), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
end
elseif msg == "no" then  
selfSay("Hahahaha, I figured you weren't ready!", cid)  
talkState[talkUser] = 0  
npcHandler:unGreet(cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())