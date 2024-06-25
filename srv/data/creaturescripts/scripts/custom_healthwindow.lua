
local custom_healthwindow_info_opcode = 55 -- opcode da informacao customizada
local vocation_name = 54 -- opcode da informacao customizada
local storage_custom = 11145 -- o que vai armazenar aqui da storage vai enviar pro cliente

-- Skill Window
local custom_skillwindow_info_opcode = 56 -- opcode da informacao
function onExtendedOpcode(cid, opcode, buffer)
	if opcode == 22 then
		local storage = getPlayerStorageValue(cid, storage_custom) or 0
		if storage == 1 then
			doSendPlayerExtendedOpcode(cid, custom_healthwindow_info_opcode, "Elo Points ".. storage.."@")
		end
		local voc = getVocationInfo(getPlayerVocation(cid)).name
		doSendPlayerExtendedOpcode(cid, vocation_name, voc.."@")
	end

	if opcode == 23 then
		local sex = ""
		if getPlayerSex(cid) == 0 then
			sex = "Female"
		else
			sex = "Male"
		end

		doSendPlayerExtendedOpcode(cid, custom_skillwindow_info_opcode, "sex".."@"..sex.."@")
		doSendPlayerExtendedOpcode(cid, custom_skillwindow_info_opcode, "city".."@"..getTownName(getPlayerTown(cid)).."@")

		local guild_id = getPlayerGuildId(cid)
		if guild_id > 0 then
			doSendPlayerExtendedOpcode(cid, custom_skillwindow_info_opcode, "guild".."@"..getPlayerGuildName(cid).."@")
		end
	end
	return true
end