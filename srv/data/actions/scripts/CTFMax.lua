--[[
	Capture The Flag System
	Author: Maxwell Denisson(MaXwEllDeN)
	Version: 2.0
	Contact: maxwellmda@gmail.com
]]

local CTF = CTF_LIB

function onUse(cid, item)
	if getPlayerStorageValue(cid, 16700) == CTF.getFlagTeam(item.itemid) then
		return doPlayerSendCancel(cid, "Voc� n�o pode roubar a bandeira do seu pr�prio time")
	end

	CTF.stealFlag(cid, CTF.getFlagTeam(item.itemid))
	doRemoveItem(item.uid, 1)
	return true
end
