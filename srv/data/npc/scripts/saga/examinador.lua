local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


local function cont(cid, count)
if isCreature(cid) and count > -1 then
if count == 6 then
doSendAnimatedText(getCreaturePosition(cid), "Preparar!!", math.random(01,255))
elseif count > 0 then
doSendAnimatedText(getCreaturePosition(cid), ""..count.."", math.random(01,255))
else
doTeleportThing(cid, {x = 1881, y = 3586, z = 7})
end
addEvent(cont, 1000, cid, count -1)
end
end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if not getPlayerSaga(cid, 4, 6) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

---------------------------------------------------------
if(msgcontains(msg, 'chunin')) then
selfSay('Tudo bem ent�o, para {confirmar}, vou pegar seus dois pergaminhos que voce conseguiu no caminho ate aqui!', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'confirmar') and talkState[talkUser] == 1) then
if((doPlayerRemoveItem(cid, 12281, 1) == true) and (doPlayerRemoveItem(cid, 12282, 1) == true)) then
doPlayerNextSaga(cid)
addEvent(cont, 1000, cid, 6)
selfSay('Boa Sorte!', cid)
npcHandler:unGreet(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
else
selfSay('Haha, nao podes me passar a perna, voce tem que me trazer os pergaminhos das outras equipes.', cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
npcHandler:unGreet(cid)
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())