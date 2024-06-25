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
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


if not getPlayerSaga(cid, 1, 1) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)  
return true
end

if(msgcontains(msg, 'ajuda')) then
selfSay('Entao, ouvi falar que tem um {pergaminho} muito poderoso, acredito que se conseguir ele podera aprender qualquer jutsu.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'pergaminho')) then
selfSay('Entao quer mesmo aprender todos os jutsus? muito bom, ouvi falar que que no predio do hokage tem um bau, e nele existe um pergaminho, pegue o pergaminho e me encontre na {floresta}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'floresta') and talkState[talkUser] == 1) then
selfSay('Exato, saia de konoha e va caminhando para west encontrara na entrada da floresta perdida duas rochas, depois segue o caminho e ira me achar la, vou te ensinar a ler o pergaminho la.', cid)
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
return true
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())