local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	min = (maglevel * 80) +(level * 5) + 1000
	max = (maglevel * 80) +(level * 5) + 1000
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
local waittime = 1.0
local storage = 15431

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
	
end
