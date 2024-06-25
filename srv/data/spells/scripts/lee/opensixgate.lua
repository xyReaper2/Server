local config = { 
duration = 60, --- duração
effect = 577, -- efeito que sai ao falar a spell
skills = {{C_NINJUTSU, 20}, {C_GLOVE, 20}, {C_FIST, 20}}
} 


function onCastSpell(cid, var)
if isBuffID(cid, 3) then return false end

doCreatureAddBuff(cid, config.skills, config.health, config.speed, config.duration, 3)
createLoopEffectBuff(cid, tempo, effect, false, 600, true, 3)
return true
end