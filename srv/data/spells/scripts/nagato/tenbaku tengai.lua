local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -120.2, 1, -125.2, 1)

function onCastSpell(cid, var)
local waittime = 2.0
local storage = 51210

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 591)
return doCombat(cid, combat, var)
end
