function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local efepos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local time = 3 -- tempo paralyzado

if isPlayer(cid) and exhaustion.check(cid, 12000) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 12000) .. " segundos para usar novamente.")
return false
end
if not isPlayer(target) then doPlayerSendCancel(cid, "Use apenas em players.") return false end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 12000, 60) end

exhaustion.set(cid, 12000, 60)
doSendMagicEffect(efepos, 928)
Trap(target, time)
return true
end