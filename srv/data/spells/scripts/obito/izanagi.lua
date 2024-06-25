--[[
	<instant name="Izanagi Spell" words="izanagi spell" lvl="1" mana="0" aggressive="false" exhaustion="1000" script="izanagi_spell.lua"/>
]]

local cfg = {
	cooldown_time = 120, -- cooldown em segundos
	cooldown_storage = 13130, -- storage do cooldown

	storages = {
		duration = 597450, -- storage da duração
		charges = 597451 -- storage das cargas
	},

	duration = 20, -- duração em segundos
	charges = 2, -- cargas

	sub_id = 440, -- sub id do invisible (mesmo do creaturescripts)

	cycle_effect = {10, {x = 0, y = 0}, 1000} -- efeito, offset e delay enquanto durar o izanagi
}

local function isActive(cid)
	local remainingTime = tonumber(getCreatureStorage(cid, cfg.storages.duration))
	if (remainingTime and remainingTime > os.time()) then
		local charges = tonumber(getCreatureStorage(cid, cfg.storages.charges)) or 0
		return charges > 0
	end
	return false
end

local function startEffectCycle(cid, t)
	if (t <= 0 or not isCreature(cid) or not isActive(cid)) then
		return
	end

	local position = getThingPosition(cid)
	position.x = position.x + cfg.cycle_effect[2].x
	position.y = position.y + cfg.cycle_effect[2].y
	if (hasCreatureCondition(cid, CONDITION_INVISIBLE, cfg.sub_id)) then
		doSendMagicEffect(position, cfg.cycle_effect[1], cid)
	else
		doSendMagicEffect(position, cfg.cycle_effect[1])
	end

	local delay = cfg.cycle_effect[3]
	addEvent(startEffectCycle, delay, cid, t - delay)
end

function onCastSpell(cid, var)
local from1,to1 = {x=1964, y=731, z=7},{x=1976, y=742, z=7} -- tsukuyomi world
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=1241, y=723, z=6},{x=1257, y=738, z=6} -- kamui

if getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Voce Nao Pode Usar Esta Spell Aqui!")
return false
end

if getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Voce nao pode usar o Izanagi aqui.")
return false
end

	if (isActive(cid)) then
		doPlayerSendCancel(cid, "O Izanagi já está ativo.")
		doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
		return false
	end

	local timeNow = os.time()
	if (cfg.cooldown_time > 0) then
		local CDTime = (tonumber(getCreatureStorage(cid, cfg.cooldown_storage)) or 0) - timeNow
		if (CDTime > 0) then
			doPlayerSendCancel(cid, "Aguarde o cooldown [" .. CDTime .. "s].")
			doSendMagicEffect(getThingPosition(cid), CONST_ME_POFF)
			return false
		end

		doCreatureSetStorage(cid, cfg.cooldown_storage, timeNow + cfg.cooldown_time)
	end

	doCreatureSetStorage(cid, cfg.storages.duration, timeNow + cfg.duration)
	doCreatureSetStorage(cid, cfg.storages.charges, cfg.charges)
	startEffectCycle(cid, cfg.duration * 1000)
	return true
end
