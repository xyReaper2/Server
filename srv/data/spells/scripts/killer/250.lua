local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)		---balanço nivel 350
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -47, 1, -50, 1)


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 95)
return doCombat(cid, combat, var)
end