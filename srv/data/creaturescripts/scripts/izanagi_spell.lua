--[[
	<event type="login" name="IzaSpell_login" script="izanagi_spell.lua"/>
	<event type="combat" name="IzaSpell_combat" script="izanagi_spell.lua"/>
	<event type="statschange" name="IzaSpell_statschange" script="izanagi_spell.lua"/>
]]

local cfg = {
	storages = {
		duration = 597450, -- storage da duração
		charges = 597451 -- storage das cargas
	},

	inv_duration = 3, -- duração em segundos que fica invisível
	sub_id = 440 -- sub id do invisible
}

local inv_condition = createConditionObject(CONDITION_INVISIBLE, cfg.inv_duration * 1000, false, cfg.sub_id)

function onLogin(cid)
	doCreatureSetStorage(cid, cfg.storages.duration, 0)
	doCreatureSetStorage(cid, cfg.storages.charges, 0)

	registerCreatureEvent(cid, "IzaSpell_combat")
	registerCreatureEvent(cid, "IzaSpell_statschange")
	return true
end

function onCombat(cid, target)
	if (hasCreatureCondition(cid, CONDITION_INVISIBLE, cfg.sub_id)) then
		return false
	end

	if (isPlayer(target) and hasCreatureCondition(target, CONDITION_INVISIBLE, cfg.sub_id)) then
		return false
	end
	return true
end

function onStatsChange(cid, attacker, changeType, combat, value)
	if (changeType == STATSCHANGE_HEALTHLOSS) then
		if (hasCreatureCondition(cid, CONDITION_INVISIBLE, cfg.sub_id)) then
			return false
		end

		if (value < getCreatureHealth(cid)) then
			return true
		end

		local remainingTime = tonumber(getCreatureStorage(cid, cfg.storages.duration))
		if (not remainingTime or remainingTime <= os.time()) then
			return true
		end

		local charges = tonumber(getCreatureStorage(cid, cfg.storages.charges)) or 0
		if (charges > 0) then
			doCreatureSetStorage(cid, cfg.storages.charges, charges - 1)

			doCreatureChangeHealth(cid, getCreatureMaxHealth(cid))
			doCreatureExecuteTalkAction(cid, "/ghost", true)
			doPlayerRemoveTarget(cid)
			addEvent(function()
				doCreatureExecuteTalkAction(cid, "/ghost", true)
			end, 3000)
			doCreatureSay(cid, "Izanagi!", TALKTYPE_MONSTER)
			return false
		end
	end
	return true
end
