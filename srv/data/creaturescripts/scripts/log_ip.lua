function onLogin(cid)
local tmp = {playerName = getPlayerName(cid), ip = getPlayerIp(cid)}
db.query("UPDATE `players` SET `ip` = '" .. doConvertIntegerToIp(tmp.ip) .. "' WHERE name = '"..tmp.playerName.."';")
return true
end

--ALTER TABLE players ADD ip VARCHAR( 255 ) NOT NULL