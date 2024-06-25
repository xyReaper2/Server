local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

function onGetFormulaValues(cid, level, skill, attack)
      local getSwordAttack = getPlayerSlotItem(cid, 6).itemid
      attack = getItemInfo(getSwordAttack).attack

      local min = 25 * skill + attack * 4.0 + (level*2) -- 2800 skill, 2000 attack, 2000 level
      local max = 40 * skill + attack * 4.5 + (level*3)
   
   return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onUseWeapon(cid, var)
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local pos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
doSendMagicEffect(pos1, 20)
doCombat(cid, combat, var)
end
