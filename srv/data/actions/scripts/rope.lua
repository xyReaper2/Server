function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(toPosition.x == CONTAINER_POSITION) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	toPosition.stackpos = STACKPOS_GROUND
	local itemGround = getThingFromPos(toPosition)
	if(isInArray(SPOTS, itemGround.itemid)) then
		doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, false)
		return true
	elseif(isInArray(ROPABLE, itemEx.itemid)) then
		local hole = getThingFromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
		if(isPlayer(hole.uid) and (not isPlayerGhost(hole.uid) or getPlayerGhostAccess(cid) >= getPlayerGhostAccess(hole.uid))) then
		if(not isMonster(hole.uid)) then
			doTeleportThing(hole.uid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z}, false)
		else
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		end
		else
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		end
		return true
	end

	return false
end