function onChannelJoin(cid, channelId, users)
	if(channelId ~= 21) then
		return true
	end
	setPlayerStorageValue(cid, "lootch", 1)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� abriu o canal de Loot, as menssagens de drop agora ser�o mostradas l�.")
	return true
end

function onChannelLeave(cid, channelId, users)
	if(channelId ~= 21) then
		return true
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� fechou o canal de Loot. As menssagens de drop agora retornar�o para o Server Log.")
	setPlayerStorageValue(cid, "lootch", -1)

	return true
end