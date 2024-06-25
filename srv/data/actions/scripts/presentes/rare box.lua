local rewards = {
    {itemid = 19431, chance = 100, count = 25}, 
    {itemid = 19436, chance = 100, count = 25}, 
    {itemid = 19437, chance = 100, count = 25}, 
    {itemid = 19450, chance = 100, count = 25}, 
    {itemid = 19449, chance = 100, count = 25}, 
    {itemid = 19452, chance = 100, count = 25}, 
    {itemid = 17203, chance = 100, count = 1}, 
    {itemid = 17202, chance = 100, count = 1}, 
}

local function sorteiaPremio(rewardlist)
    local possible = {}
    for i, v in pairs(rewardlist) do
        local sort = math.random(1, 10000)
        if v.chance*100 >= sort then
            possible[#possible + 1] = v
        end
    end
    local reward = rewardlist[1]
    if #possible > 0 then
        reward = possible[math.random(1, #possible)]
    end 
    return reward
end

function onUse(cid, item)
    local reward = sorteiaPremio(rewards)
    local count = reward.count or 1
    doPlayerAddItem(cid, reward.itemid, count)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Parabéns! Você ganhou " .. count .. "x " .. getItemNameById(reward.itemid) .. "!")
    doSendMagicEffect(getCreaturePosition(cid), 10)
    doRemoveItem(item.uid)
    return true
end