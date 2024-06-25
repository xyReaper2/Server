function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local storage = 6159298

    if isPlayerPzLocked(cid) then
		if exhaustion.check(cid, storage) then
		    doTeleportThing(cid, fromPosition, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você está em PZ locked e já usou a escada recentemente, aguarde " .. exhaustion.get(cid, storage) .. " segundos.")
			return false
		end 
		exhaustion.set(cid, storage, 2)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você está em PZ locked, aguarde 2 segundos antes de usar a escada novamente.")
		return false
    end
    return true
end