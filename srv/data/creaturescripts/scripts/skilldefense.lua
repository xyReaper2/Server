local SKILL_ID = 5 -- id da skill de shield

local DEFENSE_PER_10_SKILL = 1 -- quantidade de defesa adicionada a cada 10 pontos de skill
local MAX_SKILL = 100 -- máximo de pontos de skill possível

function onStatsChange(cid, attacker, type, combat, value)
    if not isPlayer(cid) or type ~= STATSCHANGE_SKILL or value ~= SKILL_ID then
        return true
    end

    local skill = getPlayerSkillLevel(cid, SKILL_ID)
    local defense = math.floor(skill / 10) * DEFENSE_PER_10_SKILL

    if defense > 0 then
        doPlayerSetDefense(cid, defense)
    end

    return true
end