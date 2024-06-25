local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)	---ataque nivel 400
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -79, 1, -80, 1)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 3, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
setCombatArea(combat2, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 5.5
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}


addEvent(effect, 100, target, {3, 1}, 1000)
addEvent(effect, 100, target, {2, 1}, 1001)
addEvent(effect, 300, target, {0, 0}, 876)
addEvent(effect, 400, target, {0, -1}, 876)
addEvent(effect, 300, target, {1, 1}, 877)
addEvent(effect, 400, target, {1, 0}, 877)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x, y = pos.y, z = pos.z}, 0)
return true
end 