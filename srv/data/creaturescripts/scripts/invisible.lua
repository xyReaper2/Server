local storage = 3482180

function onLogin(cid)
registerCreatureEvent(cid, "invisiblemuu")
exhaustion.set(cid, storage, 0)
return true
end

function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if (isPlayer(cid) and exhaustion.get(cid, storage) and isCreature(attacker)) or (isPlayer(attacker) and exhaustion.get(attacker, storage) and isCreature(cid)) then
return false
end
end
return true
end