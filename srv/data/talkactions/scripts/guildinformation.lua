function onSay(cid, words, param, channel)
local players,str,GuildName = {},'',getPlayerGuildName(cid)
if getPlayerGuildId(cid) <= 0  then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce precisa estar em uma guild.") return true end
				for _, cid in pairs(getPlayersOnline()) do
								if getPlayerGuildName(cid) == GuildName then
												table.insert(players, cid)
								end
				end
				str = str .. "Membros total da guild: "..CountGuildMembers(GuildName).." Players.\n\nExistem "..#players.." players online na sua guild:\n\n"
				for i = 1, #players do
				str = str.."\n["..getPlayerName(players[i]).."]["..getPlayerGuildRank(players[i]).."]"
				end
return doShowTextDialog(cid, 2533, str)
end