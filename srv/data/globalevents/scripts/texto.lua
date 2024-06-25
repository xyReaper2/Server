 local config = {

    positions = {
        ["Sword"] = {x = 818, y = 831, z = 7},
        ["Shuriken"] = {x = 820, y = 831, z = 7},
        ["Glover"] = {x = 822, y = 831, z = 7},
		["Konoha"] = {x = 546, y = 120, z = 5},
		["Suna"] = {x = 553, y = 120, z = 5},
		["Mist"] = {x = 822, y = 831, z = 7},
		["Amegakure"] = {x = 559, y = 120, z = 6},
		["Yu no kuni"] = {x = 540, y = 120, z = 6},
		["west desert"] = {x = 546, y = 140, z = 5},
		["Itachi Furie"] = {x = 546, y = 134, z = 5},
		["Hoshigakure"] = {x = 540, y = 115, z = 6},
		["Gedou Dog"] = {x = 559, y = 134, z = 6},
		["Dino"] = {x = 540, y = 140, z = 6},
		["Supreme Sand"] = {x = 559, y = 140, z = 6},
		["Black Death"] = {x = 540, y = 134, z = 6},
		["Jya Boss"] = {x = 553, y = 140, z = 5},
		["Scorpion"] = {x = 553, y = 134, z = 5},
		["Missões"] = {x = 1023, y = 907, z = 8},
		["GUILD"] = {x = 1024, y = 903, z = 7},
		["CASTLE"] = {x = 1025, y = 903, z = 7},
		["WAR"] = {x = 1026, y = 903, z = 7},
		["Eventos"] = {x = 2384, y = 3166, z = 7},
		["Cassino"] = {x = 2369, y = 3166, z = 7},
		["ARENA-PVP"] = {x = 2374, y = 3111, z = 7},
		["UPGRADE"] = {x = 2375, y = 3151, z = 7},
   }
}
 
function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(30, 60))
    end
    
    return true
end  