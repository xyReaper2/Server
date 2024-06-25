local texto = [[        Naruto Shinobi Online!!

Seja bem vindo ao Naruto Shinobi!
Site: www.ntoshinobi.com
Equipe Naruto Shinobi!
]]

function onLogin(cid)
if getPlayerStorageValue(cid, 12231) < 1 and getPlayerAccountManager(cid) == MANAGER_NONE then
doShowTextDialog(cid, 2175, texto)
setPlayerStorageValue(cid, 12231, 1)
end
return true
end