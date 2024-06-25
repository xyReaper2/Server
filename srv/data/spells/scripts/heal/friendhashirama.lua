local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	min = (maglevel * 80) +(level * 5) + 1000
	max = (maglevel * 80) +(level * 5) + 1000
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	local waittime = 1 -- Tempo de exhaustion
	local storage = 12026
	-- if getCreatureName(var.number) == getCreatureName(cid) then
		-- doPlayerSendCancel(cid, "Voce nao pode utilizar esta magia em si mesmo.")
	-- return false
	-- end
if exhaustion.check(cid, storage) then
	return false
end
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
doSendMagicEffect(position1, 312)
exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
