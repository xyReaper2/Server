local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)     ---defesa nivel 400
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -79, 1, -80, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 663563) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local efepos = {x=getCreaturePosition(getCreatureTarget(cid)).x+2, y=getCreaturePosition(getCreatureTarget(cid)).y, z=getCreaturePosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, 663563, 5.5)
doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 24)
addEvent(doSendMagicEffect, 200, efepos, 433)
addEvent(onCastSpell1, 200, parameters)
return true
end