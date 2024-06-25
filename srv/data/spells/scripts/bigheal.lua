local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)

function onGetFormulaValues(cid, level, maglevel)
	min = (maglevel * 75) +(level * 5) + 800
	max = (maglevel * 75) +(level * 5) + 800
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
local waittime = 0.9
local storage = 1543231

if isPlayer(cid) and exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
	return false
end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
