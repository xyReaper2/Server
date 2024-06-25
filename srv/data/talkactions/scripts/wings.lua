local effects = {
	["angel"] = {wing = 1, storage = 7128201},
	["fallen"] = {wing = 2, storage = 7128202},
}
local config = {
	storageRunning = 712860,
}

local function runAura(cid, wing)
	if isCreature(cid) then
		doPlayerAddWing(cid, wing)
		else
		return false
	end
	return true
end

function onSay(cid, words, param)
	local t = string.explode(param, ",")
	if(not t[1]) then
		local wing = ""
		for k, v in pairs(effects) do
			if getPlayerStorageValue(cid, v.storage) >= 1 then
				wing = wing .. k .. ", "
			end
		end

		if wing ~= "" then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Suas wing disponíveis são: " .. string.sub(wing, 1, -3) .. ".")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não possui nenhuma aura disponível.")
		end
		return true
	end


	local wing = effects[t[1]]

	if wing then
		if getPlayerStorageValue(cid, wing.storage) >= 1 then
			setPlayerStorageValue(cid, config.storageRunning, wing.wing) -- set the storage value with the current wing
			runAura(cid, wing.wing)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao possui essa wing. Para adquiri-la, acesse o shop.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando invalido.")
		end
	return true
end