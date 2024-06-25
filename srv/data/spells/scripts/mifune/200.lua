local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---defesa nivel 400
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)

 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}


addEvent(effect, 100, target, {1, 1}, 696)
addEvent(effect, 200, target, {1, 0}, 696)
addEvent(effect, 300, target, {1, 1}, 696)
addEvent(effect, 400, target, {1, -1}, 696)
addEvent(effect, 500, target, {1, 1}, 696)
addEvent(effect, 600, target, {1, 0}, 696)
addEvent(effect, 700, target, {1, 2}, 696)
addEvent(effect, 600, target, {0, 1}, 1171)
addEvent(effect, 600, target, {2, 1}, 1171)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 300, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x, y = pos.y+1, z = pos.z}, 1142)
addEvent(doSendMagicEffect, 2, {x = pos.x+1, y = pos.y+1, z = pos.z}, 1142)
return true
end 
