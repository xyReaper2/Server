local monster = 'Akatsuki unknown'

function onCombat(cid, target)
    if (isPlayer(cid)) then
        if (isMonster(target) and (getCreatureName(target) == monster)) then 
            if getCreatureNoMove(target) == true then
                    if getCreatureLookDirection(target) == EAST then
                        for i = 1, 5 do
                            if getCreaturePosition(cid).x == getCreaturePosition(target).x-i then
                                 return true
                            end
                        end
                    elseif getCreatureLookDirection(target) == WEST then
                        for i = 1, 5 do
                            if getCreaturePosition(cid).x == getCreaturePosition(target).x+i then
                                return true
                            end
                        end
                    elseif getCreatureLookDirection(target) == SOUTH then
                        for i = 1, 5 do
                            if getCreaturePosition(cid).y == getCreaturePosition(target).y-i then
                                return true
                            end
                        end
                    elseif getCreatureLookDirection(target) == NORTH then
                        for i = 1, 5 do
                            if getCreaturePosition(cid).y == getCreaturePosition(target).y+i then
                                return true
                            end
                        end
                    end                
            end    
                         doSendAnimatedText(getThingPosition(target), "Miss!", 130)
                return false
            end
        end
    return true
end