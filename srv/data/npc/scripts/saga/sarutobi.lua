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
if(msgcontains(msg, 'shinobi')) then
selfSay('Ohh yes ... really, from now on you/ll be called {chunin}, I really like this young spirit, I remember my youth.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'chunin')) then
selfSay('Okay then, without further ado give me the {certificate} of the completion of the exam, as it will be in your ninja files that you have completed the chunin exam!', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'certificado', 'certificate') and talkState[talkUser] == 1) then
if(doPlayerRemoveItem(cid, 6087, 1) == true) then
doPlayerAddExperience(cid,25000)
doPlayerNextSaga(cid)
doTeleportThing(cid, {x= 1965, y=2025, z= 7})
selfSay('Umm, that gives me more joy and encouragement to live, seeing this youth so determined, you can consider yourself a chunin from now on!', cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
else
selfSay('Cade the Shinobi certificate, without it you cannot win the Chunin title, bring me the CERTIFICATE!', cid)
talkState[talkUser] = 0
npcHandler:unGreet(cid)
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())