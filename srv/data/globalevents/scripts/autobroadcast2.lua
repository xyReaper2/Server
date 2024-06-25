function onThink(interval, lastExecution)

local cor = 22
local mensagem = {
[[Faça uma doação e ajude o servidor a se manter online, Acesse o site:www.ntoshinobi.com.br e faça uma doaçao!
]]
}

doBroadcastMessage(mensagem[math.random(1,table.maxn(mensagem))], cor)
return TRUE
end