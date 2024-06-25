skillConfig = {skill = getConfigValue('rateSkill'), magiclevel = getConfigValue('rateMagic')}
skillStages = {}
skillStages[SKILL__MAGLEVEL] = {{0,10},{10,10},{20,6},{30,6},{40,6},{50,5},{55,5},{60,4},{70,4},{80,4},{90,3},{100,3},{110,2},{120,1},{130,1},{140,0}}
showInfoOnAdvance = false -- envia uma nova mensagem com a sua nova rate
showInfoOnLogin = false -- envia mensagem da rate ao jogador ao logar

function getPlayerSkillRatesText(cid)
local skillInfo = getPlayerRates(cid)
return "Rates Info: [ Ninjutsu: " .. skillInfo[SKILL__MAGLEVEL] * skillConfig.magiclevel .. "x]"
end