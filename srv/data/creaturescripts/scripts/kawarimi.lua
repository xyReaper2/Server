local config = { 
    storage = 2482108,
    storage_cooldown = 2482109,
    text = "Kawarimi",
    cooldown = 10, -- cooldown em segundos
    chance = 10, -- chance de acontecer o kawarimi
    chance_inv = 10, -- chance de acontecer o invisivel
	duration = 4,
    charges = 3, -- quantidade de miss 
    effect1 = 1119, --- efeito que sai ao dar reflect
    min = 1, -- minimo de sorteio
    max = 100 -- máximo de sorteio
} 
  
local cfg = {
	inv_duration = 3, -- duração em segundos que fica invisível
	sub_id = 440 -- sub id do invisible
}  

local inv_condition = createConditionObject(CONDITION_INVISIBLE, cfg.inv_duration * 1000, false, cfg.sub_id)
	
function onStatsChange(cid, attacker, type, combat, value)
        local playerPercent = 100/(getCreatureMaxHealth(cid)/getCreatureHealth(cid))
        if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS)) and playerPercent <= 50 then
            local rand = math.random(config.min, config.max)
            if getPlayerStorageValue(cid, config.storage_cooldown) < os.time() and getPlayerStorageValue(cid, config.storage) <= 0 and isCreature(cid) and rand >= 6 and rand <= config.chance then
                setPlayerStorageValue(cid, config.storage, config.charges)
                setPlayerStorageValue(cid, config.storage_cooldown, os.time() + config.cooldown)
			elseif rand <= config.chance_inv and getPlayerStorageValue(cid, config.storage_cooldown) < os.time() then
				doAddCondition(cid, inv_condition)
				print("passou")
				doCreatureSay(cid, "Kawarimi!", TALKTYPE_MONSTER)
                setPlayerStorageValue(cid, config.storage_cooldown, os.time() + config.cooldown)				
            end
            if getPlayerStorageValue(cid, config.storage) >= 1 and isCreature(attacker) then
                doSendAnimatedText(getCreaturePosition(cid), config.text, COLOR_TEAL)
                local Pos_player = {x = getCreaturePosition(cid).x, y = getCreaturePosition(cid).y, z = getCreaturePosition(cid).z}
                doSendMagicEffect(Pos_player, config.effect1)
                setPlayerStorageValue(cid,config.storage, getPlayerStorageValue(cid,config.storage) - 1)
                return false
            end
        end
    return true
end