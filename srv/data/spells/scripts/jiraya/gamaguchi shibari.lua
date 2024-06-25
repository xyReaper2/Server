local function kb1(cid)
    setPlayerStorageValue(cid,555010,0)
end

function onCastSpell(cid, var)
local waittime = 60 -- Tempo de exhaustion
local storage = 3030707
local pos1,pos2 = {x = 2119, y = 3495, z = 6},{x = 2150, y = 3516, z = 6} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos3,pos4 = {x = 2719, y = 2929, z = 5},{x = 2779, y = 2978, z = 5} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos5,pos6 = {x = 2043, y = 3556, z = 7},{x = 2052, y = 3563, z = 7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado

local Tile1 = {x = 2127, y = 3513, z = 6} -- onde o player sera teleportado
local Tile2 = {x = 2134, y = 3505, z = 6} -- onde o player target teleportado
local from1,to1 = {x = 2724, y = 2946, z = 5},{x = 2769, y = 2972, z = 5} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from3,to3 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from4,to4 = {x=1552, y=1254, z=7},{x=1561, y=1262, z=7} -- ponto 1 ao ponto 2 da area
local from5,to5 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from6,to6 = {x=1156, y=1192, z=7},{x=1172, y=1172, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from7,to7 = {x=664, y=1096, z=7},{x=685, y=1104, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from8,to8 = {x=1553, y=1254, z=7},{x=1562, y=1262, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from9,to9 = {x=1133, y=1039, z=12},{x=972, y=873, z=12} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from10,to10 = {x=1133, y=1039, z=11},{x=972, y=873, z=11} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from11,to11 = {x=1133, y=1039, z=10},{x=972, y=873, z=10} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from12,to12 = {x = 2119, y = 3495, z = 6},{x = 2150, y = 3516, z = 6} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos = getCreaturePosition(cid)
local time = 10 -- tempo para voltar em segundos

if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) or isInRange(pos, from12, to12) then
doPlayerSendCancel(cid, "Você nao pode usar o mundo aqui!")
return false
end

if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end

if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) then
doPlayerSendCancel(cid, "Você nao pode usar o mundo aqui!")
return false
end

if getTilePzInfo(getCreaturePosition(cid)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode utilizar esse jutsu em protection zone!")
	return false
end

local teleport = {
[1] = {x = 2129, y = 3510, z = 6},
[2] = {x = 2146, y = 3513, z = 6},
[3] = {x = 2130, y = 3500, z = 6}
}


local position = teleport[math.random(1, 3)]
-- doCreateSummonCount(cid, 2, "Vampire", 20)
local spectator = getSpectators(getCreaturePosition(cid), 3, 3, false)
	if spectator and #spectator > 0 then
		for k, v in ipairs(spectator) do
			 if getTilePzInfo(getCreaturePosition(v)) == false then 
				if isPlayer(v) then
					local pos1 = {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y + 0, z = getPlayerPosition(cid).z}
					doSendMagicEffect(pos1, 703)
					local positu = getCreaturePosition(v)
					addEvent(doTeleportThing, time*1000, v, positu)
					addEvent(doTeleportThing, 1000, v, position)
				end
			end
		end
	end
	exhaustion.set(cid, storage, waittime)
	return true
end
