local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 134)
function onGetFormulaValues(cid, level, skill, attack)
      local getSwordAttack = getPlayerSlotItem(cid, 6).itemid
      attack = getItemInfo(getSwordAttack).attack

      local min = 25 * skill + attack * 4.0 + (level*2) -- 2800 skill, 2000 attack, 2000 level
      local max = 40 * skill + attack * 4.5 + (level*3)
   return -min, -max
end


setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onUseWeapon(cid, var)

local mpmin = 3000
local mpmax = 4000

	if doPlayerAddMana(cid, math.random(mpmin, mpmax)) == LUA_ERROR then
		return FALSE
	end
	return doCombat(cid, combat, var)
end

