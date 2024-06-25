DUNGEON_OPCODE_DESTROYINFO = 87 -- opcode que vai destruir as informacoes anteriores
DUNGEON_OPCODE_LEVEL = 88 -- opcode que vai enviar: leveis
DUNGEON_OPCODE_DIFFICULTY = 89 -- ocpode que vai enviar: dificuldade
DUNGEON_OPCODE_MISSIONS = 90 -- opcode que vai enviar: missoes disponiveis
DUNGEON_OPCODE_ITEMS = 91 -- opcode que vai enviar: items necessarios para a DG
DUNGEON_OPCODE_INVITE = 92 -- opcode que vai enviar: convite para o player
DUNGEON_OPCODE_PLAYERS_PARTY = 93 -- opcode que vai enviar: players da party.
DUNGEON_OPCODE_PLAYER_TIME_MODULE = 94 -- opcode que vai enviar: module de tempo
DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE = 95 -- opcode que vai enviar: ocultar o module de tempo
DUNGEON_OPCODE_CLOSEWINDOW = 96
-- DUNGEON_OPCODE_SENZU = 97 

DUNGEON_STORAGE_TIME = 92912 -- storage de tempo da storage
DUNGEON_STORAGE_NUMERATION = 92913 -- storage para guardar a numeration da dungeon pra no final ele kickar o player ou teleportar ele
DUNGEON_STORAGE_CATEGORY = 92914 -- storage para guardar a categoria da dungeon pra no final ele kickar o player ou teleportar ele
DUNGEON_STORAGE_KILLEDCREATURES = 92915 -- storage para guardar a quantidade de monstros que voce matou
DUNGEON_STORAGE_COUNTCREATURES_AREA = 92916 -- storage para guardar a quantidade de monstros na area
-- DUNGEON_STORAGE_SENZU = 92917
-- DUNGEON_STORAGE_SENZU_BLOCKED = 92918
-- DUNGEON_STORAGE_SENZU_COUNT = 92919

DUNGEON_LEVELS = {"200", "300", "400"}
DUNGEON_DIFFICULTYS = {"Akatsuki"}

-- name: vai ficar o nome da dungeon
-- players: quantidade de players da dungeon
-- image: nome da imagem
-- recompense_list: id das recompensas que vao mostrar no module (em forma de nome, claro, o id ï¿½ apenas para puxar o nome pelo id)
-- count: quantidade das recompensas
-- dungeon_time: tempo em minutos/horas para ficar na DG (em segundos)
-- dungeon_time_miliseconds: tempo em minutos/horas para ficar na DG (em milisegundos), ele precisa estar em MILISEGUNDOS, se nao nao funciona
-- storageGlobal: voce coloca alguma storage qualquer
-- isHour: se for uma dungeon que comeï¿½a em X horario voce deixa true, se nao, false
-- tox position = sala de recompensa

DUNGEONS_MISSIONCATEGORY = {
    ["Akatsuki"] =
    {
        [1] = {name = "Covil Akatsuki", players = 1, image = "Covil Akatsuki_off.png", recompense_list = {2160, 19431, 19436, 19437}, count = {50, 3, 3, 3}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8581, isHour = false, items = {17202}, count_req = {1}},
        [2] = {name = "Covil Akatsuki", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 19431, 19436, 19437}, count = {50, 3, 3, 3}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8582, isHour = false, items = {17203}, count_req = {1}},
        [3] = {name = "Covil Akatsuki", players = 3, image = "Covil Akatsuki_off.png", recompense_list = {2160, 19431, 19436, 19437}, count = {50, 3, 3, 3}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8583, isHour = false, items = {17203}, count_req = {1}},
        -- [4] = {name = "Covil Akatsuki", players = 4, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {12, 35}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8583, isHour = false, items = {5922}, count_req = {1}},
    },

    ["Talentoso"] =
    {
        [1] = {name = "Covil Akatsuki", players = 1, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {120, 125}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8581, isHour = false, items = {17202}, count_req = {1}},
        [2] = {name = "Covil Akatsuki", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {16, 11}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8582, isHour = false, items = {17202}, count_req = {1}},
        [3] = {name = "Covil Akatsuki", players = 3, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {12, 35}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8583, isHour = false, items = {17202}, count_req = {1}},
    },

    ["Intermediario"] =
    {
        [1] = {name = "Covil Akatsuki", players = 1, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {10, 15}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8581, isHour = false, items = {17202}, count_req = {1}},
        [2] = {name = "Covil Akatsuki", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {16, 11}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8582, isHour = false, items = {17202}, count_req = {1}},
        [3] = {name = "Covil Akatsuki", players = 3, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {12, 35}, dungeon_time = 601, dungeon_time_miliseconds = 600000, storageGlobal = 8583, isHour = false, items = {17202}, count_req = {1}},
    },

    ["Avancado"] =
    {
        [1] = {name = "Destruction", players = 1, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {10, 15}, dungeon_time = 30, dungeon_time_miliseconds = 30000, storageGlobal = 8581, isHour = false, items = {17202}, count_req = {1}},
        [2] = {name = "Attack Namek", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {16, 11}, dungeon_time = 30, dungeon_time_miliseconds = 30000, storageGlobal = 8582, isHour = false, items = {17202}, count_req = {1}},
        [3] = {name = "Torre Gélida", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {12, 35}, dungeon_time = 2400, dungeon_time_miliseconds = 2400000, storageGlobal = 8583, isHour = false, items = {17202}, count_req = {1}},
    },

    ["Experiente"] =
    {
        [1] = {name = "Destruction", players = 1, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {10, 15}, dungeon_time = 30, dungeon_time_miliseconds = 30000, storageGlobal = 8581, isHour = false, items = {5922}, count_req = {1}},
        [2] = {name = "Attack Namek", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {16, 11}, dungeon_time = 30, dungeon_time_miliseconds = 30000, storageGlobal = 8582, isHour = false, items = {5922}, count_req = {1}},
        [3] = {name = "Torre Gélida", players = 2, image = "Covil Akatsuki_off.png", recompense_list = {2160, 2152}, count = {12, 35}, dungeon_time = 2400, dungeon_time_miliseconds = 2400000, storageGlobal = 8583, isHour = false, items = {5922}, count_req = {1}},
    },
}

DUNGEONS_SALAS = {
    ["Akatsuki"] =
    {
        [1] =
        {
            pos = {
               {x = 1412, y = 2478, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1323, y = 2481, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1236, y = 2485, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
            },

            pos_areas_checkHasPlayer = { -- {x = 1183, y = 2452, z = 8} {x = 1250, y = 2507, z = 8}
                {fromx = 1364, fromy = 2448, fromz = 8, tox = 1419, toy = 2496, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1270, fromy = 2453, fromz = 8, tox = 1335, toy = 2501, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1183, fromy = 2452, fromz = 8, tox = 1250, toy = 2507, toz = 8}, -- checar toda a area da dungeon
            },

            chest_pos = { 
                {x = 1397, y = 2474, z = 8},
				{x = 1308, y = 2477, z = 8}, -- posiï¿½ï¿½o literalmente onde estï¿½ o baï¿½
                {x = 1221, y = 2481, z = 8},
            },

            arenaDungeon_pos = { 
                {fromx = 1364, fromy = 2448, fromz = 8, tox = 1419, toy = 2496, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1270, fromy = 2453, fromz = 8, tox = 1335, toy = 2501, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1183, fromy = 2452, fromz = 8, tox = 1250, toy = 2507, toz = 8}, -- checar toda a area da dungeon
            },

            monstersList = {
                {
                -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1398, y = 2487, z = 8}},
                    {"Akatsuki member", {x = 1378, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1398, y = 2463, z = 8}},
                    {"Akatsuki member", {x = 1403, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1398, y = 2485, z = 8}},
                    {"Akatsuki member", {x = 1385, y = 2484, z = 8}},
                    {"Akatsuki member", {x = 1382, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1397, y = 2461, z = 8}},
                    {"Akatsuki member", {x = 1403, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1379, y = 2461, z = 8}},
                    {"Akatsuki member", {x = 1378, y = 2469, z = 8}},
                    {"Akatsuki member", {x = 1384, y = 2479, z = 8}},
                    {"Akatsuki member", {x = 1385, y = 2488, z = 8}},
                    {"Akatsuki member", {x = 1401, y = 2462, z = 8}},
                    {"Akatsuki member", {x = 1391, y = 2456, z = 8}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1288, y = 2464, z = 8}},
                    {"Akatsuki member", {x = 1310, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1298, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1295, y = 2481, z = 8}},
                    {"Akatsuki member", {x = 1282, y = 2465, z = 8}},
                    {"Akatsuki member", {x = 1311, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1304, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1292, y = 2478, z = 8}},
                    {"Akatsuki member", {x = 1296, y = 2487, z = 8}},
                    {"Akatsuki member", {x = 1308, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1312, y = 2495, z = 8}},
                    {"Akatsuki member", {x = 1318, y = 2489, z = 8}},
                    {"Akatsuki member", {x = 1301, y = 2459, z = 8}},
                    {"Akatsuki member", {x = 1310, y = 2462, z = 8}},
                    {"Akatsuki member", {x = 1294, y = 2457, z = 8}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1223, y = 2483, z = 8}},
                    {"Akatsuki member", {x = 1232, y = 2485, z = 8}},
                    {"Akatsuki member", {x = 1233, y = 2482, z = 8}},
                    {"Akatsuki member", {x = 1225, y = 2488, z = 8}},
                    {"Akatsuki member", {x = 1232, y = 2489, z = 8}},
                    {"Akatsuki member", {x = 1231, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1228, y = 2493, z = 8}},
                    {"Akatsuki member", {x = 1222, y = 2496, z = 8}},
                    {"Akatsuki member", {x = 1212, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1208, y = 2490, z = 8}},
                    {"Akatsuki member", {x = 1205, y = 2483, z = 8}},
                    {"Akatsuki member", {x = 1224, y = 2470, z = 8}},
                    {"Akatsuki member", {x = 1217, y = 2465, z = 8}},
                    {"Akatsuki member", {x = 1206, y = 2464, z = 8}},
                    {"Akatsuki member", {x = 1200, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1205, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1204, y = 2473, z = 8}},
                    {"Akatsuki member", {x = 1199, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1213, y = 2483, z = 8}},
                },   
            },

            bossList = {
                {name = {"Akatsuki unknown"}, pos = {x = 1409, y = 2476, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Akatsuki guard"}, pos = {x = 1301, y = 2459, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Akatsuki big member"}, pos = {x = 1223, y = 2497, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
            },
        },
        [2] =
        {
            pos = {
               {x = 1412, y = 2478, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1323, y = 2481, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1236, y = 2485, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
            },

            pos_areas_checkHasPlayer = { -- {x = 1183, y = 2452, z = 8} {x = 1250, y = 2507, z = 8}
                {fromx = 1364, fromy = 2448, fromz = 8, tox = 1419, toy = 2496, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1270, fromy = 2453, fromz = 8, tox = 1335, toy = 2501, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1183, fromy = 2452, fromz = 8, tox = 1250, toy = 2507, toz = 8}, -- checar toda a area da dungeon
            },

            chest_pos = { 
                {x = 1397, y = 2474, z = 8},
				{x = 1308, y = 2477, z = 8}, -- posiï¿½ï¿½o literalmente onde estï¿½ o baï¿½
                {x = 1221, y = 2481, z = 8},
            },

            arenaDungeon_pos = { 
                {fromx = 1364, fromy = 2448, fromz = 8, tox = 1419, toy = 2496, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1270, fromy = 2453, fromz = 8, tox = 1335, toy = 2501, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1183, fromy = 2452, fromz = 8, tox = 1250, toy = 2507, toz = 8}, -- checar toda a area da dungeon
            },

            monstersList = {
                {
                -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1398, y = 2487, z = 8}},
                    {"Akatsuki member", {x = 1378, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1398, y = 2463, z = 8}},
                    {"Akatsuki member", {x = 1403, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1398, y = 2485, z = 8}},
                    {"Akatsuki member", {x = 1385, y = 2484, z = 8}},
                    {"Akatsuki member", {x = 1382, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1397, y = 2461, z = 8}},
                    {"Akatsuki member", {x = 1403, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1379, y = 2461, z = 8}},
                    {"Akatsuki member", {x = 1378, y = 2469, z = 8}},
                    {"Akatsuki member", {x = 1384, y = 2479, z = 8}},
                    {"Akatsuki member", {x = 1385, y = 2488, z = 8}},
                    {"Akatsuki member", {x = 1401, y = 2462, z = 8}},
                    {"Akatsuki member", {x = 1391, y = 2456, z = 8}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1288, y = 2464, z = 8}},
                    {"Akatsuki member", {x = 1310, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1298, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1295, y = 2481, z = 8}},
                    {"Akatsuki member", {x = 1282, y = 2465, z = 8}},
                    {"Akatsuki member", {x = 1311, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1304, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1292, y = 2478, z = 8}},
                    {"Akatsuki member", {x = 1296, y = 2487, z = 8}},
                    {"Akatsuki member", {x = 1308, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1312, y = 2495, z = 8}},
                    {"Akatsuki member", {x = 1318, y = 2489, z = 8}},
                    {"Akatsuki member", {x = 1301, y = 2459, z = 8}},
                    {"Akatsuki member", {x = 1310, y = 2462, z = 8}},
                    {"Akatsuki member", {x = 1294, y = 2457, z = 8}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1223, y = 2483, z = 8}},
                    {"Akatsuki member", {x = 1232, y = 2485, z = 8}},
                    {"Akatsuki member", {x = 1233, y = 2482, z = 8}},
                    {"Akatsuki member", {x = 1225, y = 2488, z = 8}},
                    {"Akatsuki member", {x = 1232, y = 2489, z = 8}},
                    {"Akatsuki member", {x = 1231, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1228, y = 2493, z = 8}},
                    {"Akatsuki member", {x = 1222, y = 2496, z = 8}},
                    {"Akatsuki member", {x = 1212, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1208, y = 2490, z = 8}},
                    {"Akatsuki member", {x = 1205, y = 2483, z = 8}},
                    {"Akatsuki member", {x = 1224, y = 2470, z = 8}},
                    {"Akatsuki member", {x = 1217, y = 2465, z = 8}},
                    {"Akatsuki member", {x = 1206, y = 2464, z = 8}},
                    {"Akatsuki member", {x = 1200, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1205, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1204, y = 2473, z = 8}},
                    {"Akatsuki member", {x = 1199, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1213, y = 2483, z = 8}},
                },   
            },

            bossList = {
                {name = {"Akatsuki unknown"}, pos = {x = 1409, y = 2476, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Akatsuki unknown"}, pos = {x = 1323, y = 2481, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Akatsuki unknown"}, pos = {x = 1236, y = 2485, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
            },
        },
        [3] =
        {
            pos = {
               {x = 1412, y = 2478, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1323, y = 2481, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1236, y = 2485, z = 8},  -- onde o jogador vai teleporta dentro da dungeon
            },

            pos_areas_checkHasPlayer = { -- {x = 1183, y = 2452, z = 8} {x = 1250, y = 2507, z = 8}
                {fromx = 1364, fromy = 2448, fromz = 8, tox = 1419, toy = 2496, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1270, fromy = 2453, fromz = 8, tox = 1335, toy = 2501, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1183, fromy = 2452, fromz = 8, tox = 1250, toy = 2507, toz = 8}, -- checar toda a area da dungeon
            },

            chest_pos = { 
                {x = 1397, y = 2474, z = 8},
				{x = 1308, y = 2477, z = 8}, -- posiï¿½ï¿½o literalmente onde estï¿½ o baï¿½
                {x = 1221, y = 2481, z = 8},
            },

            arenaDungeon_pos = { 
                {fromx = 1364, fromy = 2448, fromz = 8, tox = 1419, toy = 2496, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1270, fromy = 2453, fromz = 8, tox = 1335, toy = 2501, toz = 8}, -- checar toda a area da dungeon
                {fromx = 1183, fromy = 2452, fromz = 8, tox = 1250, toy = 2507, toz = 8}, -- checar toda a area da dungeon
            },

            monstersList = {
                {
                -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1398, y = 2487, z = 8}},
                    {"Akatsuki member", {x = 1378, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1398, y = 2463, z = 8}},
                    {"Akatsuki member", {x = 1403, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1398, y = 2485, z = 8}},
                    {"Akatsuki member", {x = 1385, y = 2484, z = 8}},
                    {"Akatsuki member", {x = 1382, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1397, y = 2461, z = 8}},
                    {"Akatsuki member", {x = 1403, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1379, y = 2461, z = 8}},
                    {"Akatsuki member", {x = 1378, y = 2469, z = 8}},
                    {"Akatsuki member", {x = 1384, y = 2479, z = 8}},
                    {"Akatsuki member", {x = 1385, y = 2488, z = 8}},
                    {"Akatsuki member", {x = 1401, y = 2462, z = 8}},
                    {"Akatsuki member", {x = 1391, y = 2456, z = 8}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1288, y = 2464, z = 8}},
                    {"Akatsuki member", {x = 1310, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1298, y = 2477, z = 8}},
                    {"Akatsuki member", {x = 1295, y = 2481, z = 8}},
                    {"Akatsuki member", {x = 1282, y = 2465, z = 8}},
                    {"Akatsuki member", {x = 1311, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1304, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1292, y = 2478, z = 8}},
                    {"Akatsuki member", {x = 1296, y = 2487, z = 8}},
                    {"Akatsuki member", {x = 1308, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1312, y = 2495, z = 8}},
                    {"Akatsuki member", {x = 1318, y = 2489, z = 8}},
                    {"Akatsuki member", {x = 1301, y = 2459, z = 8}},
                    {"Akatsuki member", {x = 1310, y = 2462, z = 8}},
                    {"Akatsuki member", {x = 1294, y = 2457, z = 8}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 1223, y = 2483, z = 8}},
                    {"Akatsuki member", {x = 1232, y = 2485, z = 8}},
                    {"Akatsuki member", {x = 1233, y = 2482, z = 8}},
                    {"Akatsuki member", {x = 1225, y = 2488, z = 8}},
                    {"Akatsuki member", {x = 1232, y = 2489, z = 8}},
                    {"Akatsuki member", {x = 1231, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1228, y = 2493, z = 8}},
                    {"Akatsuki member", {x = 1222, y = 2496, z = 8}},
                    {"Akatsuki member", {x = 1212, y = 2492, z = 8}},
                    {"Akatsuki member", {x = 1208, y = 2490, z = 8}},
                    {"Akatsuki member", {x = 1205, y = 2483, z = 8}},
                    {"Akatsuki member", {x = 1224, y = 2470, z = 8}},
                    {"Akatsuki member", {x = 1217, y = 2465, z = 8}},
                    {"Akatsuki member", {x = 1206, y = 2464, z = 8}},
                    {"Akatsuki member", {x = 1200, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1205, y = 2468, z = 8}},
                    {"Akatsuki member", {x = 1204, y = 2473, z = 8}},
                    {"Akatsuki member", {x = 1199, y = 2476, z = 8}},
                    {"Akatsuki member", {x = 1213, y = 2483, z = 8}},
                },   
            },

            bossList = {
                {name = {"Akatsuki unknown"}, pos = {x = 1409, y = 2476, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Akatsuki unknown"}, pos = {x = 1323, y = 2481, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Akatsuki unknown"}, pos = {x = 1236, y = 2485, z = 8}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
            },
        },

    },

    ["Talentoso"] =
    {
        [1] =
        {
            pos = {
               {x = 254, y = 62, z = 9},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 293, y = 62, z = 9},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 333, y = 61, z = 9},  -- onde o jogador vai teleporta dentro da dungeon
            },

            pos_areas_checkHasPlayer = {
                {fromx = 239, fromy = 49, fromz = 9, tox = 270, toy = 74, toz = 9}, -- checar toda a area da dungeon
                {fromx = 276, fromy = 50, fromz = 9, tox = 310, toy = 74, toz = 9}, -- checar toda a area da dungeon
                {fromx = 316, fromy = 50, fromz = 9, tox = 350, toy = 74, toz = 9}, -- checar toda a area da dungeon
            },

            chest_pos = {
                {x = 249, y = 29, z = 9},
                {x = 285, y = 26, z = 9}, -- posiï¿½ï¿½o literalmente onde estï¿½ o baï¿½
                {x = 336, y = 27, z = 9},
            },

            arenaDungeon_pos = { 
                {fromx = 239, fromy = 49, fromz = 9, tox = 270, toy = 74, toz = 9}, -- Checar quantos monstros tem na area
                {fromx = 276, fromy = 50, fromz = 9, tox = 310, toy = 74, toz = 9}, -- Checar quantos monstros tem na area
                {fromx = 316, fromy = 50, fromz = 9, tox = 350, toy = 74, toz = 9}, -- Checar quantos monstros tem na area
            },

            bossDungeon_pos = {
                {fromx = 193, fromy = 56, fromz = 9, tox = 206, toy = 69, toz = 9},  -- Checar se o boss esta vivo
                {fromx = 276, fromy = 50, fromz = 9, tox = 310, toy = 74, toz = 9},  -- Checar se o boss esta vivo
                {fromx = 316, fromy = 50, fromz = 9, tox = 350, toy = 74, toz = 9},  -- Checar se o boss esta vivo
                
            },

            checkBauChest = { -- posiï¿½ï¿½es norte esquerda e sul direita da sala
                {fromx = 246, fromy = 27, fromz = 9, tox = 253, toy = 31, toz = 9},  -- Checar se o jogador estï¿½ na sala
                {fromx = 282, fromy = 26, fromz = 9, tox = 289, toy = 30, toz = 9},
                {fromx = 332, fromy = 25, fromz = 9, tox = 339, toy = 29, toz = 9},  
                
            },

            reward_position = { -- centro da sala
                -- posiï¿½ï¿½o da sala do baï¿½
                {x = 249, y = 29, z = 9},
                {x = 285, y = 28, z = 9},
                {x = 336, y = 27, z = 9},
            },

            monstersList = {
                {
                -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 242, y = 51, z = 9}},
                    {"Akatsuki member", {x = 244, y = 64, z = 9}},
                    {"Akatsuki member", {x = 249, y = 70, z = 9}},
                    {"Akatsuki member", {x = 258, y = 70, z = 9}},
                    {"Akatsuki member", {x = 268, y = 61, z = 9}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 282, y = 54, z = 9}},
                    {"Akatsuki member", {x = 284, y = 66, z = 9}},
                    {"Akatsuki member", {x = 296, y = 67, z = 9}},
                    {"Akatsuki member", {x = 304, y = 60, z = 9}},
                    {"Akatsuki member", {x = 294, y = 55, z = 9}},
                },

                {
                    -- Nome do monstro e a posiï¿½ï¿½o de cada monstro dentro da posiï¿½ï¿½o da dungeon
                    {"Akatsuki member", {x = 324, y = 56, z = 9}},
                    {"Akatsuki member", {x = 325, y = 66, z = 9}},
                    {"Akatsuki member", {x = 333, y = 67, z = 9}},
                    {"Akatsuki member", {x = 344, y = 60, z = 9}},
                    {"Akatsuki member", {x = 332, y = 54, z = 9}},
                },   
            },

            bossList = {
                {name = {"Boss Yakon"}, pos = {x = 254, y = 62, z = 9}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Boss Yakon"}, pos = {x = 293, y = 62, z = 9}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
                {name = {"Boss Yakon"}, pos = {x = 334, y = 62, z = 9}}, -- Posiï¿½ï¿½o do boss dentro da dungeon
            },
        },
    },

    ["Intermediario"] =
    {
        [1] =
        {
            pos = {
                {x = 1062, y = 1519, z = 7}, 
                {x = 1049, y = 1519, z = 6},
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
            },

            chest_pos = {
                 {x = 1051, y = 1515,z = 5},
                 {x = 1051, y = 1515,z = 5},
            },

            arenaDungeon_pos = { -- Checar quantos monstros tem na area
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
            },

            bossDungeon_pos = { -- Checar se o boss esta vivo
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
            },

            monstersList = {
                {name = {"Wolf"}},
                {name = {"Wolf"}},
            },

            bossList = {
                {name = "Bear Thief"},
                {name = "Bear Thief"},
            },
        },
    },

    ["Avancado"] =
    {
        [1] =
        {
            pos = {
                {x = 1062, y = 1519, z = 7}, 
                {x = 1049, y = 1519, z = 6},
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
            },

            chest_pos = {
                 {x = 1051, y = 1515,z = 5},
                 {x = 1051, y = 1515,z = 5},
            },

            arenaDungeon_pos = { -- Checar quantos monstros tem na area
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
            },

            bossDungeon_pos = { -- Checar se o boss esta vivo
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
            },

            monstersList = {
                {name = {"Wolf"}},
                {name = {"Wolf"}},
            },

            bossList = {
                {name = "Bear Thief"},
                {name = "Bear Thief"},
            },
        },
    },

    ["Experiente"] =
    {
        [1] =
        {
            pos = {
                {x = 1062, y = 1519, z = 7}, 
                {x = 1049, y = 1519, z = 6},
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
            },

            chest_pos = {
                 {x = 1051, y = 1515,z = 5},
                 {x = 1051, y = 1515,z = 5},
            },

            arenaDungeon_pos = { -- Checar quantos monstros tem na area
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
            },

            bossDungeon_pos = { -- Checar se o boss esta vivo
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
            },

            monstersList = {
                {name = {"Wolf"}},
                {name = {"Wolf"}},
            },

            bossList = {
                {name = "Bear Thief"},
                {name = "Bear Thief"},
            },
        },
    },
}

-- Aqui voce coloca as dungeons que vao comeï¿½ar em x horario
DUNGEONS_START_HOUR = {
    ["16:24:00"] = -- horario de abrir
    {
        ["Akatsuki"] =
        {
            [1] = {
                message = "A dungeon: Embarcaï¿½ï¿½o dos Blastoises na Dificuldade: Iniciante iniciou!", 
                storageGlobal = 8584, 
                action = "open",
            }, -- embarcacao dos blastoises
        },
    },

    ["16:25:00"] = -- horario de fechar
    {
        ["Akatsuki"] =
        {
            [1] = {
                message = "A dungeon: Embarcaï¿½ï¿½o dos Blastoises na Dificuldade: Iniciante fechou!", 
                storageGlobal = 8584, 
                action = "close",
            }, -- embarcacao dos blastoises
        },
    },
}

function getPlayersInAreaDungeon(area)
    local players = {}
    for x = area.fromx,area.tox do
        for y = area.fromy,area.toy do
            for z = area.fromz,area.toz do
                local m = getTopCreature({x=x, y=y, z=z}).uid
                if m ~= 0 and isPlayer(m) then
                    table.insert(players, m)
                end
            end
        end
    end
    return players
end

function isPlayerInRewardRoom(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.checkBauChest) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, v in ipairs(tabela.reward_position) do
                if indice == k then
                    local specter = getSpectators({x = v.x, y = v.y, z = v.z}, 5, 5, false)
                    if specter then
                        for _, spec in pairs(specter) do
                            if isPlayer(spec) then
                                return true
                            end
                        end
                    end
                end
            end
        end
    end

    return false
end

function getMonstersInAreaDungeon(area)
	local monsters = {}
	local centerPos = {x = math.floor(area.fromx + (area.tox - area.fromx) / 2), y = math.floor(area.fromy + (area.toy - area.fromy) / 2), z = math.floor(area.fromz + (area.toz - area.fromz) / 2)}
	local rangex = area.tox - area.fromx
	local rangey = area.toy - area.fromy
	local spectators = getSpectators(centerPos, rangex, rangey, false)
    if spectators then
        for i, uid in pairs(spectators) do
            if uid then
                if isMonster(uid) then
                    table.insert(monsters, uid)
                end
            end
        end
    end
	return monsters
end

function isWalkable(pos, creature, proj, pz)
    if getTileThingByPos({x=pos.x,y=pos.y,z=pos.z,stackpos=0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end

function checkSalaDisponivel(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for k, v in ipairs(tabela.pos_areas_checkHasPlayer) do
        if #getPlayersInAreaDungeon(v) <= 0 then
            for kk, vv in ipairs(tabela.pos) do
                if k == kk then
                    return vv
                end
            end
        end
    end
    return nil
end

function checkSalaDisponivelSpawnMonster(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    local createdMonsters = {}
    for i, sala in ipairs(tabela.pos) do
        local posPlayer = getCreaturePosition(cid)
        local salaCreate = {x = sala.x, y = sala.y, z = sala.z}
        if posPlayer.x == salaCreate.x and posPlayer.y == salaCreate.y and posPlayer.z == salaCreate.z then
            for j, monsterData in ipairs(tabela.monstersList[i]) do
                local monsterName = monsterData[1]
                local monsterPos = monsterData[2]
                local pos = monsterPos.x .. "," .. monsterPos.y .. "," .. monsterPos.z
                if not createdMonsters[pos] then
                    createdMonsters[pos] = true
                    doCreateMonster(monsterName, monsterPos, false)
                end
            end
        end
    end
end

function removeMonstersInArea(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for i, sala in ipairs(tabela.pos) do
        local posPlayer = getCreaturePosition(cid)
        local salaCreate = {x = sala.x, y = sala.y, z = sala.z}
        if posPlayer.x == salaCreate.x and posPlayer.y == salaCreate.y and posPlayer.z == salaCreate.z then
            if tabela.arenaDungeon_pos then
                for k, v in ipairs(tabela.arenaDungeon_pos) do
                    if k == i then
                        local monsters = getMonstersInAreaDungeon(v)
                        if monsters then
                            for j = 1, #monsters do
                                doRemoveCreature(monsters[j])
                            end
                        end
                    end
                end
            end
        end
    end

    return true
end

function checkSalaDisponivelSpawnMonsterBoss(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.arenaDungeon_pos) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, v in ipairs(tabela.bossList) do
                if indice == k then
                    for i = 1, #v.name do
                        doCreateMonster(v.name[i], v.pos, 1)
                    end
                end
            end
        end
    end
    return nil
end

function isInAreadungeon(pos, area)
    return pos.x >= area.startX and pos.x <= area.endX and pos.y >= area.startY and pos.y <= area.endY and pos.z >= area.startZ and pos.z <= area.endZ
end

function checkSalaDisponivelParty(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    local pos_areas_checkHasPlayer = tabela.pos_areas_checkHasPlayer
    local partyMembers = getPartyMembers(cid)

    for i, pos in ipairs(tabela.pos) do
        local playersInArea = getPlayersInAreaDungeon(pos_areas_checkHasPlayer[i])
        if #playersInArea == 0 then
            -- doTeleportThing(leader, pos)
            for j, member in ipairs(partyMembers) do
                doTeleportThing(member, pos)
            end
            break
        end
    end
end

function getSalaDisponivelParty(category, numeration)
    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    local pos_areas_checkHasPlayer = tabela.pos_areas_checkHasPlayer

    for i, pos in ipairs(tabela.pos) do
        local playersInArea = getPlayersInAreaDungeon(pos_areas_checkHasPlayer[i])
        if #playersInArea == 0 then
            return false
        end
    end
    return true
end

function checkSalaDisponivelMonstros(cid, category, numeration)
    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return 0 end
    tabela = tabela[numeration]

    for k, sala in ipairs(tabela.arenaDungeon_pos) do
        local posPlayer = getCreaturePosition(cid)
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        if isInAreadungeon(posPlayer, salaCreate) then
            return #getMonstersInAreaDungeon(sala)
        end
    end

    return 0
end

function checkSalaDisponivelBau(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.arenaDungeon_pos) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, teleport in ipairs(tabela.chest_pos) do
                if indice == k then
                    doTeleportThing(cid, teleport)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Akatsuki")
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
                    -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU, -1)
                    -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU_BLOCKED, 0)
                    -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU_COUNT, 0)
                    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")
                end
            end
        end
    end
end

function checkSalaDisponivelBauParty(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.arenaDungeon_pos) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, teleport in ipairs(tabela.chest_pos) do
                if indice == k then
                    doTeleportThing(cid, teleport)
                    for z, v in ipairs(getPartyMembers(cid)) do
                        doTeleportThing(v, getCreaturePosition(cid))
                        setPlayerStorageValue(v, DUNGEON_STORAGE_TIME, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION, 1)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY, "Akatsuki")
                        setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
                        -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU, -1)
                        -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU_BLOCKED, 0)
                        -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU_COUNT, 0)
                        doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")
                    end
                end
            end
        end
    end
end

function getSalasDisponiveis(cid, category)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end

    return #tabela
end

-- Remover informacoes anteriores da janela
function destroyInfoDungeon(cid)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_levels".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_difficulty".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_missions".."@")
    -- doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_items".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")
    return true
end

-- Enviar as informacoes janela de dungeon
function sendDungeon(cid, category)
    if not isPlayer(cid) then
        return true
    end

    destroyInfoDungeon(cid) -- destruir infos antigas
    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end

    for i = 1, #DUNGEON_LEVELS do
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_LEVEL, DUNGEON_LEVELS[i].."@")
    end

    for i = 1, #DUNGEON_DIFFICULTYS do
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DIFFICULTY, DUNGEON_DIFFICULTYS[i].."@"..i.."@")
    end

    for i = 1, #tabela do
        for value = 1, #tabela[i].items do
          local item_id = tabela[i].items[value]
          local item_count = tabela[i].count_req[value]
          doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_MISSIONS, tabela[i].image.."@"..tabela[i].name.."@"..tabela[i].players.."@"..i.."@"..getItemInfo(item_id).clientId.."@"..item_count.."@")
        end
    end

    if getPartyMembers(cid) ~= false then
        for k, v in ipairs(getPartyMembers(cid)) do
            doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")

            for i = 1, #getPartyMembers(cid) do
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYERS_PARTY, getCreatureName(getPartyMembers(cid)[i]).."@"..getPlayerLevel(getPartyMembers(cid)[i]).."@"..math.floor(getCreatureHealth(getPartyMembers(cid)[i]) / getCreatureMaxHealth(getPartyMembers(cid)[i]) * 100).."@"..getCreatureOutfit(getPartyMembers(cid)[i]).lookType.."@"..getVocationInfo(getPlayerVocation(getPartyMembers(cid)[i])).name.."@")
            end
        end
    end
    return true
end

-- Trocar a categoria da dungeon
function changeDungeonCategory(cid, category)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_missions".."@")

    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end

    for i = 1, #tabela do
        for value = 1, #tabela[i].items do
          local item_id = tabela[i].items[value]
          local item_count = tabela[i].count_req[value]
          doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_MISSIONS, tabela[i].image.."@"..tabela[i].name.."@"..tabela[i].players.."@"..i.."@"..getItemInfo(item_id).clientId.."@"..item_count.."@")
        end
    end

    return true
end

-- Enviar recompensa para o player
function sendRecompenseToPlayer(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end

    tabela = tabela[numeration]
    if not tabela.recompense_list then print("Categoria: " .. category .. " não tem uma lista de recompensas.") return true end

    local recompensa = {}
    for i = 1, #tabela.recompense_list do
        table.insert(recompensa, getItemInfo(tabela.recompense_list[i]).name .. " (" .. tabela.count[i] .. "x)\n")
    end

    doPlayerPopupFYI(cid, "As seguintes recompensas da Dungeon "..tabela.name.." são:\n" ..table.concat(recompensa))
    return true
end

-- Enviar convite para o jogador
function sendInviteToPlayer(cid, name)
    if not isPlayer(cid) then
        return true
    end

    if name == getCreatureName(cid) then
        doPlayerPopupFYI(cid, "Você não pode convidar a si mesmo.")
        return true
    end

    local players = {}
    for k, v in ipairs(getPlayersOnline()) do
        if getCreatureName(v) == name then
            table.insert(players, v)
        end
    end

    if #players <= 0 then
        doPlayerPopupFYI(cid, "Um jogador com este nome não existe ou não está online.")
        return true
    end

    -- local inviterIp = getPlayerIp(cid)
    -- for i = 1, #players do
        -- local invitedIp = getPlayerIp(players[i])
        -- if invitedIp == inviterIp then
            -- doPlayerPopupFYI(cid, "Você não pode convidar um jogador do mesmo IP.")
            -- return true
        -- end
    -- end

    if #players > 0 then
        for i = 1, #players do
            doSendPlayerExtendedOpcode(players[i], DUNGEON_OPCODE_INVITE, getCreatureName(cid).."@"..name.."@")
            doPlayerInviteParty(players[i], cid)
        end

        doPlayerPopupFYI(cid, "Um convite foi enviado com sucesso para o jogador: " .. name .. ".")
    end
    return true
end

-- Aceitar o convite do jogador
function acceptPlayerDungeon(cid, name)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")

    local players = {}
    for k, v in ipairs(getPlayersOnline()) do
        if getCreatureName(v) == name then
            table.insert(players, v)
        end
    end

    if #players > 0 then
        for i = 1, #players do
            doPlayerPopupFYI(players[i], "O jogador: " .. getCreatureName(cid) .. " aceitou seu pedido de dungeon.")
            doPlayerJoinParty(cid, players[i])
        end
    end

    if getPartyMembers(cid) ~= false then
        for k, v in ipairs(getPartyMembers(cid)) do
            doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")

            for i = 1, #getPartyMembers(cid) do
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYERS_PARTY, getCreatureName(getPartyMembers(cid)[i]).."@"..getPlayerLevel(getPartyMembers(cid)[i]).."@"..math.floor(getCreatureHealth(getPartyMembers(cid)[i]) / getCreatureMaxHealth(getPartyMembers(cid)[i]) * 100).."@"..getCreatureOutfit(getPartyMembers(cid)[i]).lookType.."@"..getVocationInfo(getPlayerVocation(getPartyMembers(cid)[i])).name.."@")
            end
        end
    end
    return true
end

-- Negar o convite do jogador
function denyPlayerDungeon(cid, name)
    if not isPlayer(cid) then
        return true
    end

    local players = {}
    for k, v in ipairs(getPlayersOnline()) do
        if getCreatureName(v) == name then
            table.insert(players, v)
        end
    end

    if #players > 0 then
        for i = 1, #players do
            doPlayerPopupFYI(players[i], "O jogador: " .. getCreatureName(cid) .. " negou seu pedido de dungeon.")
        end
    end
    return true
end

function checkPartyMembersNearLeader(leader)
    local partyMembers = luaGetPartyMembers(leader)
    if not partyMembers or #partyMembers == 0 then
        return
    end

    for _, member in ipairs(partyMembers) do
        if not isPlayerNearLeader(member, leader) then
			doPlayerPopupFYI(cid, "Todos os jogadores precisam estar perto do lider da party.")
        end
    end
end

function isPlayerNearLeader(player, leader)
    -- Defina a distância máxima que os jogadores podem estar do líder
    local maxDistance = 5

    -- Verifique se o jogador é o líder da party
    if getPlayerParty(player) == player then
        return true
    end

    -- Verifique se o jogador está perto do líder
    local playerPos = getCreaturePosition(player)
    local leaderPos = getCreaturePosition(leader)
    if getDistanceBetween(playerPos, leaderPos) <= maxDistance then
        return true
    end

    -- Se o jogador não está perto do líder, retorne falso
    return false
end


-- Entrar na Dungeon
function enterDungeon(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end
	
	local config = {
		pz = true, -- players precisam estar em protection zone para usar? ("yes" or "no").
	}
	
	if(config.pz) and (getTilePzInfo(getCreaturePosition(cid)) == false) then
			doPlayerPopupFYI(cid,"Voce precisa esta em um local protection zone.")
		return true
	end

	-- local playersIPs = {}
	-- for _, pid in ipairs(getPartyMembers(cid)) do
		-- local playerIP = getPlayerIp(pid)
		-- if playersIPs[playerIP] then
			-- Se já houver um jogador no grupo com o mesmo IP, informe e retorne true.
			-- doPlayerPopupFYI(cid, "Há alguém com o mesmo IP no grupo.")
			-- return true
		-- else
			-- playersIPs[playerIP] = true
		-- end
	-- end

    if getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) - os.time() > 0 then
        doPlayerPopupFYI(cid, "Você já estão em uma dungeon.")
        return true
    end

    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    if tabela.isHour == true and getGlobalStorageValue(tabela.storageGlobal) <= 0 then
        doPlayerPopupFYI(cid, "A dungeon não começou ainda!")
        return true
    end

    if tabela.players > 1 then
        if getPartyMembers(cid) ~= false then
            if #getPartyMembers(cid) < tabela.players then
                doPlayerPopupFYI(cid, "Seu grupo não tem pessoas suficientes para esta dungeon, o número necessario de: " .. tabela.players .. " players.")
                return true
            end
			
			if #getPartyMembers(cid) > tabela.players then
                doPlayerPopupFYI(cid, "Seu grupo tem mais de " .. tabela.players .. " players, a dungeon é de " .. tabela.players .. "!")
                return true
            end

            if getPlayerParty(cid) ~= cid then
                doPlayerPopupFYI(cid, "Apenas o lider pode iniciar a dungeon.")
                return true
            end

            if getSalaDisponivelParty(category, numeration) == true then
                doPlayerPopupFYI(cid, "As salas estão lotadas.")
                return true
            end

			local players = getPartyMembers(cid)
			for _, player in ipairs(players) do
				if getTilePzInfo(getCreaturePosition(player)) == false then
					doPlayerPopupFYI(cid, "Todos os jogadores precisam estar em uma zona protegida.")
					return true
				end
			end

			-- Verifique se todos os jogadores estão perto do líder
			-- local leader = getPlayerParty(cid)
			-- for _, player in ipairs(players) do
				-- if not isPlayerNearLeader(player, leader) then
					-- doPlayerPopupFYI(cid, "Todos os jogadores precisam estar perto do líder.")
					-- return true
				-- end
			-- end

            local allMembersHaveItems = true
            for k, v in ipairs(getPartyMembers(cid)) do
                for i = 1, #tabela.items do
                    if getPlayerItemCount(v, tabela.items[i], -1) < tabela.count_req[i] then
                        allMembersHaveItems = false
                    end
                end
            end

            if allMembersHaveItems == false then
                doPlayerPopupFYI(cid, "Você ou seu parceiro não possuem os items da dungeon.")
                return true
            end

            checkSalaDisponivelParty(cid, category, numeration)
            removeMonstersInArea(cid, category, numeration)
            checkSalaDisponivelSpawnMonster(cid, category, numeration)
            for k, v in ipairs(getPartyMembers(cid)) do
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_CLOSEWINDOW, "hide".."@")
                doPlayerPopupFYI(v, "A dungeon de vocês começou, boa sorte!")
                registerCreatureEvent(v, "KillDungeonBoss")

				for i = 1, #tabela.items do
                    doPlayerRemoveItem(v, tabela.items[i], tabela.count_req[i])
                end

                -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU, tabela.senzu)
                -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU_COUNT, tabela.senzu)
                setPlayerStorageValue(v, DUNGEON_STORAGE_TIME, os.time() + tabela.dungeon_time)
                setPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION, numeration)
                setPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY, category)
                setPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA, checkSalaDisponivelMonstros(v, category, numeration))
                setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                addEvent(function()
                    if getPlayerStorageValue(v, DUNGEON_STORAGE_TIME) > os.time()  then
                        setPlayerStorageValue(v, DUNGEON_STORAGE_TIME, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION, 1)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY, "Akatsuki")
                        setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)

                        -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU, -1)
                        -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU_BLOCKED, 0)
                        -- setPlayerStorageValue(v, DUNGEON_STORAGE_SENZU_COUNT, 0)

                        doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")

                        doPlayerSendTextMessage(v, 25, "Tempo esgotado! Você foi kickado para fora da dungeon.")
                        doTeleportThing(v, getTownTemplePosition(getPlayerTown(v)))
                    end
                end, tabela.dungeon_time_miliseconds)

                local storage = getPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES) or 0
                if storage <= 0 then storage = 0 end

                local storage2 = getPlayerStorageValue(v, DUNGEON_STORAGE_TIME) or 0
                local monsters_killed = storage .. " / " ..getPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA)
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_TIME_MODULE, storage2.."@"..monsters_killed.."@")
                -- local storage_count = getPlayerStorageValue(v, DUNGEON_STORAGE_SENZU)
                -- doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_SENZU, getItemInfo(22926).clientId.."@"..storage_count.."@")
            end
        else
            doPlayerPopupFYI(cid, "Você precisa estar em um grupo de no minímo: " .. tabela.players .. " pessoas.")
        end
    else
        if getPartyMembers(cid) ~= false then
            if #getPartyMembers(cid) > tabela.players then
                doPlayerPopupFYI(cid, "Você não pode participar de uma dungeon de 1 player em uma party.")
                return true
            end
        end

        local boleano = false
        for i = 1, #tabela.items do
            if getPlayerItemCount(cid, tabela.items[i], -1) < tabela.count_req[i] then
                boleano = false
            else
                boleano = true
            end
        end

        if boleano == false then
            doPlayerPopupFYI(cid, "Você não possui os items necessários para entrar na dungeon.")
            return true
        end

        if checkSalaDisponivel(cid, category, numeration) == nil then
            doPlayerPopupFYI(cid, "As salas estão lotadas.")
            return true
        end

        
        doTeleportThing(cid, checkSalaDisponivel(cid, category, numeration))
        removeMonstersInArea(cid, category, numeration)
        checkSalaDisponivelSpawnMonster(cid, category, numeration)
        doPlayerPopupFYI(cid, "A sua dungeon começou, boa sorte!")
        registerCreatureEvent(cid, "KillDungeonBoss")

        for i = 1, #tabela.items do
            doPlayerRemoveItem(cid, tabela.items[i], tabela.count_req[i])
        end

        -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU, tabela.senzu)
        -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU_COUNT, tabela.senzu)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, os.time() + tabela.dungeon_time)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, numeration)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, category)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, checkSalaDisponivelMonstros(cid, category, numeration))
        setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
        addEvent(function()
            if getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) > os.time() then
                setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
                setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
                setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Akatsuki")
                setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)

                -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU, -1)
                -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU_BLOCKED, 0)
                -- setPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU_COUNT, 0)

                doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")

                doPlayerSendTextMessage(cid, 25, "Tempo esgotado! Você foi kickado para fora da dungeon.")
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
            end
        end, tabela.dungeon_time_miliseconds)

        local storage = getPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES) or 0
        if storage <= 0 then storage = 0 end

        local storage2 = getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) or 0
        local monsters_killed = storage .. " / " ..getPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA)
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_TIME_MODULE, storage2.."@"..monsters_killed.."@")
        -- local storage_count = getPlayerStorageValue(cid, DUNGEON_STORAGE_SENZU)
        -- doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_SENZU, getItemInfo(22926).clientId.."@"..storage_count.."@")
    end
    return true
end