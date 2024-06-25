local positions = {
	[1] = {pos = {x = 1920, y = 3354, z = 7}},
	[2] = {pos = {x = 1946, y = 3354, z = 7}},
	[3] = {pos = {x = 1975, y = 3354, z = 7}},
	[4] = {pos = {x = 2001, y = 3354, z = 7}},
	[5] = {pos = {x = 1920, y = 3378, z = 7}},
	[6] = {pos = {x = 1946, y = 3378, z = 7}},
	[7] = {pos = {x = 1975, y = 3378, z = 7}},
	[8] = {pos = {x = 2001, y = 3378, z = 7}},
	[9] = {pos = {x = 1920, y = 3401, z = 7}},
	[10] = {pos = {x = 1946, y = 3401, z = 7}},
	[11] = {pos = {x = 1975, y = 3401, z = 7}},
	[12] = {pos = {x = 2001, y = 3401, z = 7}},
	[13] = {pos = {x = 1920, y = 3425, z = 7}},
	[14] = {pos = {x = 1946, y = 3425, z = 7}},
	[15] = {pos = {x = 1975, y = 3425, z = 7}},
	[16] = {pos = {x = 2001, y = 3425, z = 7}},
	[17] = {pos = {x = 1920, y = 3448, z = 7}},
	[18] = {pos = {x = 1946, y = 3448, z = 7}},
	[19] = {pos = {x = 1975, y = 3448, z = 7}},
	[20] = {pos = {x = 2001, y = 3448, z = 7}},
	[21] = {pos = {x = 2027, y = 3448, z = 7}},
	[22] = {pos = {x = 2027, y = 3448, z = 7}},
	[23] = {pos = {x = 2056, y = 3448, z = 7}},
	[24] = {pos = {x = 2082, y = 3448, z = 7}},
	[25] = {pos = {x = 1920, y = 3472, z = 7}},
	[26] = {pos = {x = 1946, y = 3472, z = 7}},
	[27] = {pos = {x = 1975, y = 3472, z = 7}},
	[28] = {pos = {x = 2001, y = 3472, z = 7}},
	[29] = {pos = {x = 2027, y = 3472, z = 7}},
	[30] = {pos = {x = 2056, y = 3472, z = 7}},
	[31] = {pos = {x = 2082, y = 3472, z = 7}},
	[32] = {pos = {x = 1920, y = 3495, z = 7}},
	[33] = {pos = {x = 1946, y = 3495, z = 7}},
	[34] = {pos = {x = 1975, y = 3495, z = 7}},
	[35] = {pos = {x = 2001, y = 3495, z = 7}},
	[36] = {pos = {x = 2027, y = 3495, z = 7}},
	[37] = {pos = {x = 2056, y = 3495, z = 7}},
	[38] = {pos = {x = 2082, y = 3495, z = 7}},
}
function onStepIn(cid, item, position, fromPosition)
    local trainer = math.random(#positions)
    local targetPos = positions[trainer].pos
    if getTopCreature(targetPos).uid > 0 then
        doPlayerSendCancel(cid, "Já tem alguém aí. Por favor, tente uma sala diferente.")
        doTeleportThing(cid, fromPosition, true)
        return false
    end
    doTeleportThing(cid, targetPos, true)
    return true	
end