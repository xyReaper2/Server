dofile(getDataDir() .. "creaturescripts/scripts/skills/stagesconfig.lua")

function onAdvance(cid, skill, oldLevel, newLevel)
    if(skillStages[skill] ~= nil) then
        local skillRate = 1
        local oldRates = getPlayerRates(cid)
        for i, skillRateInfo in pairs(skillStages[skill]) do
            if(newLevel >= skillRateInfo[1]) then
                skillRate = skillRateInfo[2]
            else
                break
            end
        end
        doPlayerSetRate(cid, skill, skillRate)
        if(showInfoOnAdvance and skillRate ~= oldRates[skill]) then
            if(skill >= 0 and skill <= 6) then
                configRate = skillConfig.skill
            else
                configRate = skillConfig.magiclevel
            end
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, SKILL_NAMES[skill] .. " rate alterado de " .. oldRates[skill] * configRate .. "x para " .. skillRate * configRate .. "x. " .. getPlayerSkillRatesText(cid))
        end
    end
  return true
end