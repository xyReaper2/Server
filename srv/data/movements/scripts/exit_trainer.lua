local cfg = {
	storage = 45860,

	pw_delay = 5000, -- ciclo em ms do power down
	pw_say = "Chakra down", -- texto ao usar
	pw_effect = {12, {x = 0, y = 0}} -- efeito ao usar
}

PWEvents = {}
local function executePW(cid)
	if (isCreature(cid)) then
		local mana = getCreatureMana(cid)
		doCreatureAddMana(cid, -mana)
		doPlayerAddSpentMana(cid, mana)

		doCreatureSay(cid, cfg.pw_say, TALKTYPE_MONSTER)

		local position = getThingPosition(cid)
		position.x = position.x + cfg.pw_effect[2].x
		position.y = position.y + cfg.pw_effect[2].y
		doSendMagicEffect(position, cfg.pw_effect[1])

		PWEvents[cid] = addEvent(executePW, cfg.pw_delay, cid)
	else
		PWEvents[cid] = nil
	end
end

local function stopPW(cid)
	if (PWEvents[cid]) then
		stopEvent(PWEvents[cid])
	end
	PWEvents[cid] = nil
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Agora voce esta treinando automaticamente!.")
	doCreatureSetStorage(cid, cfg.storage, 1)
	PWEvents[cid] = addEvent(executePW, cfg.pw_delay, cid)
	return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doCreatureSetStorage(cid, cfg.storage, nil)
	stopPW(cid)
	return true
end
