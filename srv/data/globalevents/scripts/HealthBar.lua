local effects = {
    [1] = {bar = 2, storage = 7128140},
    [2] = {bar = 3, storage = 7128141},
    [3] = {bar = 4, storage = 7128142},
    [4] = {bar = 5, storage = 7128143},
    [5] = {bar = 6, storage = 7128144},    
    [6] = {bar = 7, storage = 7128145},
    [7] = {bar = 8, storage = 7128146},
    [8] = {bar = 9, storage = 7128147},
    [9] = {bar = 10, storage = 7128148},
    [10] = {bar = 11, storage = 7128149},
}

local lastAura = 0

local function UpdateBar(cid)
    if isCreature(cid) then
        for i = 1, #effects do
            local Healthb = effects[i]
            if getPlayerStorageValue(cid, 712813) == Healthb.bar then
                doSetHealthBackgroundOutfit(cid, Healthb.bar)
                return true
            end
        end
    end
end

function onThink(interval, lastExecution)
    for _, cid in ipairs(getPlayersOnline()) do
        if isPlayer(cid) then
            UpdateBar(cid)
        end
    end
    return true
end