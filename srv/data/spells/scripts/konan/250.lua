local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, 32)	---defesa nivel 400
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}


addEvent(effect, 100, target, {0, 1}, 386)
addEvent(effect, 200, target, {0, 1}, 592)
addEvent(effect, 300, target, {0, 1}, 592)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 200, parameters)
return true
end 