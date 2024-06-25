local combat_lv1 = createCombatObject()
setCombatParam(combat_lv1, COMBAT_PARAM_EFFECT, 197)
setCombatParam(combat_lv1, COMBAT_PARAM_CREATEITEM, 14466)

local area_lv1 = createCombatArea({
{0, 0, 0, 0, 0, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 0, 0, 0, 1, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 1, 1, 2, 1, 1, 0}
})

setCombatArea(combat_lv1, area_lv1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat_lv1, parameters.var)
end

local spell_storage = 42552
local from,to = {x=901, y=701, z=7},{x=931, y=733, z=7} -- come�o e final do mapa
function onCastSpell(cid, var)
if isInRange(getCreaturePosition(cid), from, to) then
doPlayerSendCancel(cid, "Voc� n�o pode usar esse jutsu nessa area!") return false
end

if(isPlayer(cid) and getPlayerStorageValue(cid, 5823018) <= os.time()) then

local parameters = { cid = cid, var = var}

if getPlayerStorageValue(cid, spell_storage) < 50000 then
addEvent(onCastSpell1, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
end
    setPlayerStorageValue(cid, 5823018, os.time() + 20)
else
    doPlayerSendCancel(cid, "Cooldown[" ..getPlayerStorageValue(cid, 5823018) - os.time().."]")
return false
end
return true
end