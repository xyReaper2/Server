local SKILL_ID = 5 -- id da skill de shield
local DEFENSE_PER_10_SKILL = 2500 -- quantidade de defesa adicionada a cada 10 pontos de skill
local MAX_SKILL = 10 -- máximo de pontos de skill possível
local TIME_INTERVAL = 1-- intervalo de tempo em segundos para executar o loop

local validShieldIDs = {12292, 12635, 12636, 11105, 16479, 11100, 11057, 7428} -- tabela de IDs de escudos válidos

local lastCheckTime = 0

function onThink(interval, lastExecution)
    
    local currentTime = os.time()
    
    if currentTime - lastCheckTime >= TIME_INTERVAL then
        lastCheckTime = currentTime
        
        for _, player in ipairs(getPlayersOnline()) do
            if isPlayer(player) then
                local cid = player
                local shield = getPlayerSlotItem(cid, CONST_SLOT_RIGHT)
                
                if isInArray(validShieldIDs, shield.itemid) then
                    local skill = getPlayerSkillLevel(cid, SKILL_ID)
                    local defense = math.floor(skill / MAX_SKILL) * DEFENSE_PER_10_SKILL

                    if defense > 0 then
                        doPlayerSetDefense(cid, defense)
                    end
                else
                    doPlayerSetDefense(cid, 0) -- remove todos os pontos de defesa do jogador
                end
            end
        end
    end
    
    return true
end