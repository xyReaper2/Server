local bless = {1, 2, 3, 4, 5}

function blesstext(cid)
local pos = {x = getPlayerPosition(cid).x + 0, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z}
if isCreature(cid) then
        for i = 1, table.maxn(bless) do
        if(getPlayerBlessing(cid, bless[i])) then
        doSendAnimatedText(pos, "[bless]", 215)
        return true
        end
    end
end
end

function onThink(interval, lastExecution)
    for _, cid in ipairs(getPlayersOnline()) do
        if isPlayer(cid) then
        blesstext(cid)
    end
end
    return true    
end