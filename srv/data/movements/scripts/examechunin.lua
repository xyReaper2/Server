function onStepIn(cid, item, position, fromPosition)

if (not(getPlayerStorageValue(cid, 40000) == 15)) then
doPlayerPopupFYI(cid, "Voce nao pertence a esta Saga")
return false
end

local storage = 89745 -- Storage
if getPlayerStorageValue(cid, storage) >= 1 then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce precisa ser Genin para fazer o Exame Chunin.")
end
return true
end