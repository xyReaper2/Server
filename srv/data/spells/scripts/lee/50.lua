local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---ataque nivel 50
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10, 1, -15, 1)


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9 -- Tempo de exhaustion
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 153)
return doCombat(cid, combat, var)
end