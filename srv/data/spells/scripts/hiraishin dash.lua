-- Edited Dash by Night Wolf
local distance = 8 -- distancia que anda (em sqm)
local speed = 10 -- milisegundos entre cada passo (qnt menor = mais rapido)
local pzprotect = true -- nao deixa entrar em pz com a spell

local invisible = createConditionObject(CONDITION_GAMEMASTER, (speed * distance) + 50, false, GAMEMASTER_INVISIBLE) -- nao mexa
local outfit = createConditionObject(CONDITION_INVISIBLE, (speed * distance) + 50, false) -- nao mexa

function isWalkable(pos, creature, proj, pz)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end  

local function onWalk(cid)
local position127 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
local poslook = getCreatureLookPosition(cid)
poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	if isWalkable(poslook, false, false, pzprotect) then
		if not isCreature(getThingfromPos(poslook).uid) then
			-- doCreatureExecuteTalkAction(cid, "/ghost", true)
			doMoveCreature(cid, getPlayerLookDirection(cid))
			doSendMagicEffect(position127, 31)
		return true
		end
	end
end


function onCastSpell(cid, var)
if exhaustion.check(cid, 61590) == false then
exhaustion.set(cid, 61590, 10)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hiraishingiri dash está em cooldown, será possível usá-lo novamente em ["..exhaustion.get(cid, 61590).."] segundos")
return false
end
for i = 0, distance do
addEvent(onWalk, speed * i,cid)
end
return true
end
