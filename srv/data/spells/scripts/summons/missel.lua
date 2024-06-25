local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEFFECT, 93)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -95.2, 1, -100.2, 1)

function onCastSpell(cid, var)
local waittime = 1.0 -- Tempo de exhaustion
local storage = 1158001
if isPlayer(cid) then
if exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y, z = pos.z}, 0)
doSendMagicEffect(position1, 214)
return doCombat(cid, combat, var)
end
