local config = { 
duration = 30, --- duração

effect = {
    [10] = {{2064, {0,0}}, {2064, {0,0}}, 2064},  ---Sasuke
    [100] = {{2069, {0,0}}, {2069, {0,0}}, 2069}, -- Itachi
    [140] = {{2065, {0,0}}, {2065, {0,0}}, 2065},   -- Madara
    [260] = {{2068, {0,0}}, {2068, {0,0}}, 2068}  -- Shisui
    },
	
status = {
    [1] = {skills = {{C_NINJUTSU, 10}, {C_SWORD, 10}}, health = 0, speed = 0, str = "Mangekyou Sharingan:Susanoo"},
    [2] = {skills = {{C_NINJUTSU, 18}, {C_SWORD, 18}}, health = 0, speed = 0, str = "Mangekyou Sharingan:Perfect Susanoo"}
	}


} 


local function addSusano(cid, num)
if isCreature(cid) then
local info = config.status[num]
local effects = config.effect[getPlayerVocation(cid)] or config.effect[10]
doSetAuraOutfit(cid, effects[3])
doCreatureSay(cid, info.str, TALKTYPE_MONSTER)
doCreatureAddBuff(cid, info.skills, info.health, info.speed, config.duration, 3)
addEvent(function()
	if isCreature(cid) then
		doSetAuraOutfit(cid, 0)
	end
end, config.duration * 2000 )
end
end


function onCastSpell(cid, var)
if isBuffID(cid, 3) then doPlayerSendCancel(cid, "desculpe-me, voce ja esta transformado.")return false end
addSusano(cid, 1)
addEvent(addSusano, config.duration * TIME_SECONDS, cid, 2)
-- return true
end