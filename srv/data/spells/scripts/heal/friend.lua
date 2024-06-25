local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(cid, level, maglevel)
	min = (maglevel * 80) +(level * 5) + 1000
	max = (maglevel * 80) +(level * 5) + 1000
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 12026
	if getCreatureName(var.number) == getCreatureName(cid) then
		doPlayerSendCancel(cid, "Voce nao pode utilizar esta magia em si mesmo.")
	return false
	end
if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end
local position1 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position1, 13)
exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
