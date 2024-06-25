local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)		---balanço nivel 200
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -27, 1, -31, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 899123) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local efepos = {x=getCreaturePosition(getCreatureTarget(cid)).x, y=getCreaturePosition(getCreatureTarget(cid)).y+1, z=getCreaturePosition(getCreatureTarget(cid)).z}
local efepos1 = {x=getCreaturePosition(getCreatureTarget(cid)).x+1, y=getCreaturePosition(getCreatureTarget(cid)).y+1, z=getCreaturePosition(getCreatureTarget(cid)).z}
local efepos2 = {x=getCreaturePosition(getCreatureTarget(cid)).x+2, y=getCreaturePosition(getCreatureTarget(cid)).y+1, z=getCreaturePosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, 899123, 1.0)
doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 122)
addEvent(doSendMagicEffect, 200, efepos, 319)
addEvent(doSendMagicEffect, 400, efepos1, 319)
addEvent(doSendMagicEffect, 600, efepos2, 319)
addEvent(onCastSpell1, 400, parameters)
return true
end