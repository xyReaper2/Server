local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, 32)	---defesa nivel 250
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 592)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, 32)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 592)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, 32)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 592)
setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, false)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, 32)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 592)
setCombatParam(combat4, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat4, COMBAT_PARAM_BLOCKARMOR, false)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, 32)
setCombatParam(combat5, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat5, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -65, 1, -70, 1)

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 2, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 2, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 2, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 2, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0
local storage = 963563


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell3, 300, parameters)
addEvent(onCastSpell4, 400, parameters)
addEvent(onCastSpell5, 700, parameters)
return true
end 