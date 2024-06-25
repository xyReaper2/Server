function onLogin(cid)
    registerCreatureEvent(cid, "Damage_combat")
    return true
end

local monsters = {"Akatsuki unknown", "Akatsuki guard", "Akatsuki big member"}

function onCombat(cid, target)
    if isPlayer(cid) and isMonster(target) then
        local targetName = getCreatureName(target)
        for i = 1, #monsters do
            if targetName:lower() == monsters[i]:lower() and #getCreatureSummons(target) ~= 0 then
                doCreatureSetNoMove(target, true)
                return false
            end
        end
    end 
    return true 
end

function onThink(cid, interval)
local monsters = {"Akatsuki unknown", "Akatsuki guard", "Akatsuki big member"}
    if isMonster(cid) then
        for i = 1, #monsters do
            if getCreatureName(cid):lower() == monsters[i]:lower() and #getCreatureSummons(cid) == 0 and getCreatureNoMove(cid) == true then
                doCreatureSetNoMove(cid, false)
				doCreatureSay(cid, "Você é fraco lute ate a morte!!")
            end
        end
    end 
    return true
end
