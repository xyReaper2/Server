-- function onCastSpell(cid, var)
-- if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_SAGA) then
-- doPlayerSendCancel(cid, "Voc� nao pode usar o Summon aqui")
-- return false
-- end

-- local c_Pos = getPlayerPosition(cid)
-- if #getCreatureSummons(cid) < 1 then -- no summons
-- local summon = doCreateMonster("kuchyose kazekage", c_Pos)
-- if summon then
-- doConvinceCreature(cid, summon)
-- doSendMagicEffect({x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}, 152)
-- doSendMagicEffect(c_Pos, 111)
-- end
-- return true
-- end
-- end


function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_SAGA) then
doPlayerSendCancel(cid, "Voc� nao pode usar o Summon aqui")
return false
end

local c_Pos = getPlayerPosition(cid)
if #getCreatureSummons(cid) < 3 then -- no summons
local summon = doCreateMonster("kuchyose kazekage", c_Pos)
local summon2 = doCreateMonster("kuchyose kazekage", c_Pos)
local summon3 = doCreateMonster("kuchyose kazekage", c_Pos)
if summon then
doConvinceCreature(cid, summon)
end
if summon2 then
doConvinceCreature(cid, summon2)
end
if summon3 then
doConvinceCreature(cid, summon3)
end
doSendMagicEffect({x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}, 152)
doSendMagicEffect(c_Pos, 111)
end
return true
end