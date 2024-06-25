local config = {
    effect = 906,          --Efeito.
    time = 5,              --Duração da parede.
    cooldown = 120,  
    storage = 9576,
	hitpercent = 1,
	delay_effect_again = 15
}


function loopEffect(enemy, delay, count, cid)
if isCreature(enemy) then
    if isCreature(cid) and count > 0 and getPlayerModes(cid).secure == 1 then  
    doCreatureAddHealth(enemy, - getCreatureMaxHealth(enemy)/100*config.hitpercent)
    doSendMagicEffect(getThingPos(enemy), 809)
    addEvent(loopEffect, delay, enemy, delay, count -1, cid)
    else
	doCreatureSetNoMove(enemy, false)
    end
end
return true
end

local function validPosistion(cid)
local pos = getCreaturePosition(cid)
    if not isWalkable(pos, true) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) or getTileInfo(getThingPos(cid)).nopvp then
	return false
	end
return true
end

function onCastSpell(cid)

if getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) or getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Você nao pode usar o jutsu aqui!!")
return false
end

if getPlayerStorageValue(cid, config.storage) > os.time() then
doPlayerSendCancel(cid, "Wait "..getPlayerStorageValue(cid, config.storage) - os.time().." second(s).")
return false
end


local cPos = getCreaturePosition(cid)
local players = getAllPlayersInArea({x= cPos.x-6, y = cPos.y-5, z = cPos.z}, {x= cPos.x+6, y = cPos.y+5, z = cPos.z})
doSendMagicEffect({x=cPos.x-3, y=cPos.y-2, z=cPos.z}, config.effect)
doSendMagicEffect({x=cPos.x+4, y=cPos.y+4, z=cPos.z},953)
setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown)
setCreatureBattleLockTime(cid, 1)
local specter = getSpectators(getCreaturePosition(cid), 4, 4)
	for _, spec in pairs(specter) do
			if isPlayer(spec) then
			  if cid ~= uid and validPosistion(uid)  then   
				if not isLimboProtection(cid, spec) then
					if not isProtectSpellCodition(cid, 1) then
						loopEffect(spec, 500, config.time*2, cid)
						doPlayerAddProtection(spec, 1, config.delay_effect_again)
						doSendMagicEffect(getCreaturePosition(spec), 809)
						doCreatureSetNoMove(spec, true)
						addEvent(function()
						doCreatureSetNoMove(spec, false)
						end, 5000)
					end
				end
			end
		end
	end
    return true
end
