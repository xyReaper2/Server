local config = { 
storage = 582301132,
duration = 15, --- duração
effect = 799, -- efeito que sai ao falar a spell
skills = {{C_GLOVE, 25}, {C_SHIELD, 25}, {C_FIST, 25}}
} 


function onCastSpell(cid, var)
if isBuffID(cid, 3) then return false end
if(isPlayer(cid) and getPlayerStorageValue(cid, config.storage) <= os.time()) then

doCreatureAddBuff(cid, config.skills, 0, 0, config.duration, 3)
createLoopEffectBuff(cid, config.duration, config.effect, false, 1000, true, 3)
    setPlayerStorageValue(cid, config.storage, os.time() + 30)
else
    doPlayerSendCancel(cid, "Cooldown[" ..getPlayerStorageValue(cid, config.storage) - os.time().."]")
return false
end
return true
end