function onTarget(cid, target)
    if(attacker and isPlayer(attacker) and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and getPlayerSecureMode(attacker) == 0) then
       doPlayerSendCancel(attacker, "Turn secure mode off if you really want to attack unmarked players.")
	   return false
    end
    return true
end
 
function onStatsChange(cid, attacker, type, combat, value)
    if(attacker and isPlayer(attacker) and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and getPlayerSecureMode(attacker) == 0) then
        if combat ~= COMBAT_HEALING then
return false
end
end
return true
end
 
function onCast(cid, target)
    if(attacker and isPlayer(attacker) and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and getPlayerSecureMode(attacker) == 0) then
        if combat ~= COMBAT_HEALING then
return false
end
end
return true
end


function onCombat(cid, target)
	if (isPlayer(target) and getPlayerSecureMode(cid) == 0) then
		return false
	end
return true
end