function isInteger(n)
return math.floor(n) == n and true or false
end

function onAdvance(cid, skill, oldLevel, newLevel)
if isInteger(newLevel/100) then
broadcastMessage("O jogador "..getCreatureName(cid).." atingiu o level "..newLevel.."e Agora � top rank")
end
return true
end