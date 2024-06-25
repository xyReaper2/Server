local config = { 
storage = 6425223,
exausted = 42522,
cooldown = 60,  --- tempo entre um uso e outro
duration = 7, --- duração
effect1 = 56, -- efeito que sai ao falar a spell
c_Posistion = {x = 2047, y = 3562, z = 7}, -- onde o player sera teleportado
t_Posistion = {x = 2047, y = 3559, z = 7}-- onde o player target teleportado
} 

local pos1,pos2 = {x = 2119, y = 3495, z = 6},{x = 2150, y = 3516, z = 6} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos3,pos4 = {x = 2719, y = 2929, z = 5},{x = 2779, y = 2978, z = 5} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos5,pos6 = {x = 2043, y = 3556, z = 7},{x = 2052, y = 3563, z = 7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado

function returnGenjutsu(uid, ghost)
if isCreature(uid) then
if ghost then
doCreatureExecuteTalkAction(uid, "/ghost", true)
end
doTeleportThing(uid, getPos(uid, 14501))
end
end


function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

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
local c_Pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)

if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) or isInRange(pos, from12, to12) then
doPlayerSendCancel(cid, "Você nao pode usar o mundo aqui!")
return false
end

if isInRange(c_Pos, pos1, pos2) or isInRange(c_Pos, pos3, pos4) or isInRange(c_Pos, pos5, pos6) then
doPlayerSendCancel(cid, "Você nao pode usar esta spell aqui!")
return false
end

if exhaustion.check(cid, config.exausted) then
local seetime = exhaustion.get(cid, config.exausted)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente o Kamui Muzan!")
return false
end
if not isPlayer(target) then doPlayerSendCancel(cid, "Use somente em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, config.exausted, config.cooldown) end

local eff_Pos = {x=c_Pos.x+2, y=c_Pos.y, z=c_Pos.z}
doSendMagicEffect(eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 2000, eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 4000, eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 6000, eff_Pos, config.effect1)
addEvent(doSendMagicEffect, 7000, eff_Pos, config.effect1)
exhaustion.set(cid, config.exausted, config.cooldown)
savePos(cid, 14501)
savePos(target, 14501)
doTeleportThing(cid, config.c_Posistion)
doTeleportThing(target, config.t_Posistion)
doCreatureExecuteTalkAction(cid, "/ghost", true)
addEvent(returnGenjutsu, config.duration* TIME_SECONDS, cid, true)
addEvent(returnGenjutsu, config.duration* TIME_SECONDS, target, false)
return true
end 
