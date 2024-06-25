local config = {
storage = 86436
}


function onStatsChange(cid, attacker, type, combat, value)
if type == STATSCHANGE_HEALTHLOSS and value >= getCreatureHealth(cid) then
if isPlayer(cid) and getPlayerStorageValue(cid, config.storage) == 1 then
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
doCreatureExecuteTalkAction(cid, "transform 1", TRUE)
doMutePlayer(cid, 0)
local pos = getCreaturePosition(cid)
doSendAnimatedText(pos, "feel better",30)
doSendMagicEffect(pos, 646)
local player = getPlayerGUID(cid)
addEvent(function()
end, 1000)
return false
end
end
return true
end