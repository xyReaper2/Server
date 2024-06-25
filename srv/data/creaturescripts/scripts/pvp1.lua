function onCombat(cid, target)

if (isPlayer(target) and getPlayerSecureMode(cid) == 0) then

doPlayerSendCancel(cid, "Turn secure mode off if you really want to attack unmarked players.")

return false

elseif (target and isPlayer(target) and getPlayerSecureMode(cid) == 1) then

return true

end

return true

end