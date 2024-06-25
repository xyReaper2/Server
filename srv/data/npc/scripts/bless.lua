local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end


function creatureSayCallback(cid, type, msg)


    if(not npcHandler:isFocused(cid)) then
        return FALSE
    end




    if msgcontains(msg, "first") or msgcontains(msg, "first bless") or msgcontains(msg, "primeira bless") or msgcontains(msg, "primeira") then
        selfSay("Deseja pagar 10 golds pela primeira blessing?", cid)
        talkState[cid] = 1
    elseif msgcontains(msg, 'yes') and talkState[cid] == 1 then
    if not getPlayerBlessing(cid, 1) then
       if doPlayerRemoveMoney(cid, 1000000) then
          doPlayerAddBlessing(cid, 1)
          selfSay("Voce adquiriu a primeira blessing.", cid)
          talkState[cid] = 0
     else
     selfSay("Voce nao possui dinheiro suficiente.", cid)
     end
     else
     selfSay("Voce ja possui a primeira blessing.", cid)
     end
    elseif msgcontains(msg, 'no') and talkState[cid] == 1 then
     selfSay("Qual voce deseja entao?", cid)
     talkState[cid] = 0
     end


    if msgcontains(msg, "second") or msgcontains(msg, "second bless") or msgcontains(msg, "segunda bless") or msgcontains(msg, "segunda")  then
         selfSay("Deseja pagar 10 golds pela segunda blessing?", cid)
         talkState[cid] = 2
     elseif msgcontains(msg, "yes") and talkState[cid] == 2 then
     if not getPlayerBlessing(cid, 2) then
        if doPlayerRemoveMoney(cid, 100000) then
          doPlayerAddBlessing(cid, 2)
          selfSay("Voce adquiriu a segunda blessing.", cid)
          talkState[cid] = 0
        else
        selfSay("Voce nao possui dinheiro suficiente.", cid)
        end
        else
        selfSay("Voce ja possui a segunda blessing.", cid)
        end
     elseif msgcontains(msg, 'no') and talkState[cid] == 2 then
     selfSay("Qual voce deseja entao?", cid)
     talkState[cid] = 0
     end


    if msgcontains(msg, "third") or msgcontains(msg, "third bless") or msgcontains(msg, "terceira bless") or msgcontains(msg, "terceira")  then
         selfSay("Deseja pagar 10 golds pela terceira blessing?", cid)
         talkState[cid] = 3
     elseif msgcontains(msg, "yes") and talkState[cid] == 3 then
     if not getPlayerBlessing(cid, 3) then
        if doPlayerRemoveMoney(cid, 100000) then
          doPlayerAddBlessing(cid, 3)
          selfSay("Voce adquiriu a terceira blessing.", cid)
          talkState[cid] = 0
        else
        selfSay("Voce nao possui dinheiro suficiente.", cid)
        end
        else
        selfSay("Voce ja possui a terceira blessing.", cid)
        end
     elseif msgcontains(msg, 'no') and talkState[cid] == 3 then
     selfSay("Qual voce deseja entao?", cid)
     talkState[cid] = 0
     end


         if msgcontains(msg, "fourth") or msgcontains(msg, "fourth bless") or msgcontains(msg, "quarta bless") or msgcontains(msg, "quarta")  then
         selfSay("Deseja pagar 10 golds pela quarta blessing?", cid)
         talkState[cid] = 4 
     elseif msgcontains(msg, "yes") and talkState[cid] == 4 then
     if not getPlayerBlessing(cid, 4) then
        if doPlayerRemoveMoney(cid, 100000) then
          doPlayerAddBlessing(cid, 4)
          selfSay("Voce adquiriu a quarta blessing.", cid)
          talkState[cid] = 0
        else
        selfSay("Voce nao possui dinheiro suficiente.", cid)
        end
        else
        selfSay("Voce ja possui a quarta blessing.", cid)
        end
     elseif msgcontains(msg, 'no') and talkState[cid] == 4 then
     selfSay("Qual voce deseja entao?", cid)
     talkState[cid] = 0
end


    if msgcontains(msg, "fifth") or msgcontains(msg, "fifth bless") or msgcontains(msg, "quinta bless") or msgcontains(msg, "quinta")  then
         selfSay("Deseja pagar 10 Jp Ienes pela quinta blessing?", cid)
         talkState[cid] = 5 
     elseif msgcontains(msg, "yes") and talkState[cid] == 5 then
     if not getPlayerBlessing(cid, 5) then
        if doPlayerRemoveMoney(cid, 1000000) then
          doPlayerAddBlessing(cid, 5)
          selfSay("Voce adquiriu a quinta blessing.", cid)
          talkState[cid] = 0
        else
        selfSay("Voce nao possui dinheiro suficiente.", cid)
        end
        else
        selfSay("Voce ja possui a quinta blessing.", cid)
        end
     elseif msgcontains(msg, 'no') and talkState[cid] == 5 then
     selfSay("Qual voce deseja entao?", cid)
     talkState[cid] = 0
     return false
end


local bless = {1, 2, 3, 4, 5}
if msgcontains(msg, "all") or msgcontains(msg, "all blessings") or msgcontains(msg, "todas as bless") or msgcontains(msg, "todas")  then
         selfSay("Deseja pagar 10 Jp Ienes por todas blessings? {yes}", cid)
         talkState[cid] = 6
     elseif msgcontains(msg, "yes") and talkState[cid] == 6 then
for i = 1, table.maxn(bless) do
     if getPlayerBlessing(cid, bless[i]) then
       return selfSay("Voce ja possui todas blessings.", cid)
end
end
        if not doPlayerRemoveMoney(cid, 100000) then
return selfSay("Voce nao possui dinheiro suficiente.", cid)
end
local bless = {1, 2, 3, 4, 5}


          selfSay("Voce adquiriu todas as blessings.", cid)
          talkState[cid] = 0
 for i = 1, table.maxn(bless) do
 doPlayerAddBlessing(cid, bless[i])
 end


     elseif msgcontains(msg, 'no') and talkState[cid] == 6 then
     selfSay("Qual voce deseja entao?", cid)
     talkState[cid] = 0
     end
end




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())