local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -36, 1, -41, 1)
local directions = {
        [0] = {
		       [1] = {{0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}},
			   [2] = {{0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, -1}}
			  },
        [1] = {
		       [1] = {{-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}},
			   [2] = {{-1, 0}, {-1, -1}, {0, -1}, {1, -1}, {1, 0}}
			  },
		[2] = {
		       [1] = {{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}},
			   [2] = {{0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 1}}
			  },
		[3] = {
		       [1] = {{1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}},
			   [2] = {{1, 0}, {1, -1}, {0, -1}, {-1, -1}, {-1, 0}}
			  },
}


local function onCastGudou(cid, target, lastPos, num, dir, parameters)
if isCreature(cid) and isCreature(target) then
if #directions[dir][1] >= num then
X1,Y1 = directions[dir][1][num][1],directions[dir][1][num][2]
X2,Y2 = directions[dir][2][num][1],directions[dir][2][num][2]
newPos1 = {x=lastPos[1].x+X1, y=lastPos[1].y+Y1, z=lastPos[1].z}
newPos2 = {x=lastPos[2].x+X2, y=lastPos[2].y+Y2, z=lastPos[2].z}
doSendDistanceShoot(lastPos[1], newPos1, 93)
doSendDistanceShoot(lastPos[2], newPos2, 93)
lastPos = {newPos1,newPos2}
addEvent(onCastGudou, 30, cid, target, lastPos, num+1, dir, parameters)
else
tPos = getCreaturePosition(target)
doSendDistanceShoot(lastPos[1], tPos, 93)
doSendDistanceShoot(lastPos[2], tPos, 93)
effect(target,{2,1},373)
doCombat(parameters.cid, combat, parameters.var)
end
end
end


function onCastSpell(cid, var)
if isSelado(cid) then return false end

local waittime = 1.5
local storage = 665778

local target = getCreatureTarget(cid)
if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
onCastGudou(cid, target, {pos,pos}, 1, getCreatureLookDirection(cid), {cid = cid, var = var})
exhaustion.set(cid, storage, waittime)
return true
end