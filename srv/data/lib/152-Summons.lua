function isPlayerSummon(cid, monster)
return getCreatureMaster(monster) == cid
end

function isSummon(sid)
return isCreature(sid) and getCreatureMaster(sid) ~= sid and isPlayer(getCreatureMaster(sid))   --alterado v2.9
end

function removeSummons(cid)
for _, summon in pairs(getCreatureSummons(cid)) do
doRemoveCreature(summon)
end
end


function canSummonMonsterName(cid, name, limite)
local canSummon = limite
for _, summon in pairs(getCreatureSummons(cid)) do
    if getCreatureName(summon) == name then
    canSummon = canSummon - 1
    end
end
return canSummon
end