function onThink(interval, lastExecution)

local cor = 22
local mensagem = {
[[Fa�a uma doa��o e ajude o servidor a se manter online, Acesse o site:www.ntoshinobi.com.br e fa�a uma doa�ao!
]]
}

doBroadcastMessage(mensagem[math.random(1,table.maxn(mensagem))], cor)
return TRUE
end