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

if not getPlayerSaga(cid, 1, 5) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'pergaminho')) then
selfSay('Muito bem shinobi, esse pergaminho eh muito antigo e uma {reliquia} secreta de nossa aldeia.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'reliquia')) then
selfSay('Por sua bravura em combate quando me {devolver} esse pergaminho, te darei o titulo de Genin, por esse enorme espirito shinobi que ha dentro de voce.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'devolver') and talkState[talkUser] == 1) then
if(doPlayerRemoveItem(cid, 2155, 1) == true) then
doPlayerAddEloPoints(cid,10)
doPlayerAddExperience(cid,7000)
doTeleportThing(cid, {x= 2051, y=2040, z= 5})
doPlayerSendTextMessage(cid,22,"Nova Graduacao: Genin")
doPlayerLearnInstantSpell(cid, "Bunshin no Jutsu")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Novo jutsu: Bunshin no Jutsu.")
doPlayerNextSaga(cid)
-- doPlayerPopupFYI(cid, '     Capitulo '..getPlayerStorageValue(cid, 40000)..' desbloquado. \n ** Treino com Kakashi ** \n            (digite "saga")')
-- doPlayerAddItem(cid,10140,1)
npcHandler:unGreet(cid)
selfSay('Muito Bem Genin, de agora em diante tambem tera acesso a lugares que os guardas deixao apenas genin passarem, como recompensa tome esse livro, esta anotado varios jutsus nele...{voce leu o livro}... (you received 7000 points of experience)', cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
else
talkState[talkUser] = 0
npcHandler:unGreet(cid)
selfSay('Ueh.. cade o pergaminho? nao me digas que perdeu? volte e pegue ele...', cid)
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())