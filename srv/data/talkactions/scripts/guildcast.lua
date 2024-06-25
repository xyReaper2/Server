function onSay(cid, words, param)
	local playerGuild = getPlayerGuildId(cid)
	if playerGuild > 0 then
		local playerGuildLevel = getPlayerGuildLevel(cid)
		if playerGuildLevel >= GUILDLEVEL_VICE then
			local players = getOnlinePlayers()
			local message = "*Guild* " .. getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]:\n" .. param;
			for i,playerName in ipairs(players) do
				local player = getPlayerByName(playerName);
				if getPlayerGuildId(player) == playerGuild then
					doPlayerSendTextMessage(player, MESSAGE_STATUS_WARNING, message);
				end
			end
		else
			doPlayerSendCancel(cid, "Voce deve ser Vice-Leader para usar o guildcast.");
		end
	else
		doPlayerSendCancel(cid, "Desculpe, voce não tem uma guild.");
	end
	return true
end
