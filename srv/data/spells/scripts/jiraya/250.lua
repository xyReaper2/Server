local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---defesa nivel 250
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

arr = {
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+1, y=p.y-1, z=p.z},
[1] = {x=p.x+3, y=p.y+1, z=p.z},
[2] = {x=p.x+1, y=p.y+3, z=p.z},
[3] = {x=p.x-1, y=p.y+1, z=p.z}
}
local y = {
[0] = 795,
[1] = 793,
[2] = 796,
[3] = 794
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
exhaustion.set(cid, storage, waittime)
addEvent(doCombat,200,cid, combat, var)
return true
end