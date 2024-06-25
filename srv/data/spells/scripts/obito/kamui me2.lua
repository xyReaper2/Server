local positions=	{
{x = 1960, y = 687, z = 6},
{x = 1960, y = 689, z = 5},
{x = 1962, y = 700, z = 5},
{x = 1960, y = 719, z = 5},
{x = 1988, y = 699, z = 5},
{x = 2017, y = 701, z = 6},
{x = 1994, y = 701, z = 6},
{x = 1956, y = 719, z = 6},
{x = 1974, y = 670, z = 6},
{x = 1956, y = 700, z = 6},
{x = 1950, y = 656, z = 7},
{x = 1943, y = 674, z = 7},
{x = 1981, y = 671, z = 7},
{x = 1998, y = 673, z = 7},
{x = 1947, y = 717, z = 7},
{x = 1973, y = 726, z = 7},
{x = 2008, y = 701, z = 7},
{x = 2020, y = 720, z = 7},
{x = 1962, y = 728, z = 7}
}

function removeTeleport(pos)
tp = getTileItemById(pos, 1387).uid
if tp > 0 then
doRemoveItem(tp, 1)
doSendMagicEffect(pos, 2)
end
end

function onCastSpell(cid, var) if isSelado(cid) then return false end
local from1,to1 = {x=1509, y=1259, z=7},{x=1509, y=1255, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from3,to3 = {x=1514, y=1262, z=7},{x=1504, y=1253, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
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
if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) or isInRange(pos, from12, to12) then
doPlayerSendCancel(cid, "Você nao pode usar o Kamui aqui!")
return false
end

local waittime = 90
local storage = 5571
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

if getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_GGN) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Você nao pode usar o Kamui Me aqui!!")
return false
end

if exhaustion.check(cid, storage) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
return false
end

if getCreatureIn(cid, AREA_KAMUI) then
doPlayerSendCancel(cid, "Você ja esta dentro do Kamui Me!!")
return false
end


local pos_select = positions[math.random(1, #positions)]
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
exhaustion.set(cid, 5570, 20)
doSendMagicEffect(pos_select, 196)
savePos(cid, 5020)
doCreateTeleport(1387, positions[math.random(1, #positions)], pos)
local tp = getTileItemById(pos, 1387).uid
doItemSetAttribute(tp, "aid", 5561)
doTeleportThing(cid, pos_select)
if target and isPlayer(target) then
savePos(target, 5020)
exhaustion.set(target, 5570, 30)
doTeleportThing(target, pos_select)
end
addEvent(removeTeleport, 10000, pos)
return true
end
