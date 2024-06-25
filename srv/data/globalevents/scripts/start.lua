function onStartup()
    -- doSetGameState(GAMESTATE_CLOSED)
	db.query("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	return true
end
