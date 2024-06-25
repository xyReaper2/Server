-- Criado por Thalles Vitor --
-- Sistema de Passe de BATALHA --

PASS_OPENWINDOW_OPCODE = 230 -- enviar para o cliente que ele deve abrir o passe
PASS_COLLECT_OPCODE = 231 -- enviar para o cliente que ele pode resgatar uma recompensa
PASS_MONSTERSPASS_OPCODE = 240 -- enviar para o cliente a lista de monstros do passe
PASS_DESTROYINFO = 241 -- enviar para o cliente que ele deve destruir alguma informacao antiga
PASS_ITEMS = {
	-- todos os meses aqui: 01, 02, 03, 04 assim por diante, aqui são todos os meses q vc pode configurar
	[01] =
	{
		items = {2160, 2152}, -- lista de items (lista de items que vai ganhar a cada nivel desblloqueado)
		count = {10, 15}, -- quantidade de items (quantidade respectivas dos items, 2160 --> 10, 2152 --> 15)
		level = {1, 2}, -- nivel necessario para resgatar (nivel do passe requerido para resgatar cada recompensa, 2160 -> 1, 2152 --> 2)

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa (passe necessarios para desbloquear a recompensa: 2160 --> Basico, 2152 --> Elite)
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item (storages para sinalizar que desbloqueou o item, 2160 --> 4922, 2152 --> 4923)
	},

	[02] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[03] =
	{
		items = {19450, 17202, 19449, 17202, 19431, 17202, 19436, 17202, 19452, 17202, 19437, 17090, 17202, 17090, 17202, 17090, 17202, 16641, 17090, 19453, -- 20 Elite
				 19450, 18149, 19449, 18149, 19431, 18149, 19436, 18149, 19452, 18149, 19437, 18149, 18149, 17202, 18149, 17090, 17202, 16641, 17090, 19454, -- 20 Basic
		
		}, -- lista de items
		count = {100, 1, 100, 1, 30, 1, 30, 1, 100, 1, 50, 1, 1, 1, 1, 1, 1, 1, 1, 1, -- 20 Elite
		         100, 2, 100, 3, 30, 4, 30, 5, 100, 5, 50, 5, 5, 1, 5, 5, 1, 1, 1, 1 -- 20 Basic
		}, -- quantidade de items
		
		level = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, -- 20 Elite
				 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 -- 20 Basic
		}, -- nivel necessario para resgatar

		types = {"Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", -- 20 Elite
				 "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic" -- 20 Basic
		}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923, 4924, 4925, 4926, 4927, 4928, 4929, 4930, 4931, 4932, 4933, 4934, 4935, 4936, 4937, 4938, 4939, 4940, 4941, -- 20
						  4942, 4943, 4944, 4945, 4946, 4947, 4948, 4949, 4950, 4951, 4952, 4953, 4954, 4955, 4956, 4957, 4958, 4959, 4960, 4961
		}, -- storages usadas para desbloquear o item
	},

	[04] =
	{
		items = {19450, 17202, 19449, 17202, 19431, 17202, 19436, 17202, 19452, 17202, 19437, 17090, 17202, 17090, 17202, 17090, 17202, 16641, 17090, 19453, -- 20 Elite
				 19450, 18149, 19449, 18149, 19431, 18149, 19436, 18149, 19452, 18149, 19437, 18149, 18149, 17202, 18149, 17090, 17202, 16641, 17090, 19454, -- 20 Basic
		
		}, -- lista de items
		count = {100, 1, 100, 1, 30, 1, 30, 1, 100, 1, 50, 1, 1, 1, 1, 1, 1, 1, 1, 1, -- 20 Elite
		         100, 2, 100, 3, 30, 4, 30, 5, 100, 5, 50, 5, 5, 1, 5, 5, 1, 1, 1, 1 -- 20 Basic
		}, -- quantidade de items
		
		level = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, -- 20 Elite
				 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 -- 20 Basic
		}, -- nivel necessario para resgatar

		types = {"Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", "Elite", -- 20 Elite
				 "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic", "Basic" -- 20 Basic
		}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923, 4924, 4925, 4926, 4927, 4928, 4929, 4930, 4931, 4932, 4933, 4934, 4935, 4936, 4937, 4938, 4939, 4940, 4941, -- 20
						  4942, 4943, 4944, 4945, 4946, 4947, 4948, 4949, 4950, 4951, 4952, 4953, 4954, 4955, 4956, 4957, 4958, 4959, 4960, 4961
		}, -- storages usadas para desbloquear o item
	},
	
	[05] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[06] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[07] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[08] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[09] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[10] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},

	[11] =
	{
		items = {2160, 13088, 2148, 2152, 13088}, -- lista de items
		count = {10, 5, 45, 15, 1}, -- quantidade de items
		level = {1, 1, 2, 2, 1}, -- nivel necessario para resgatar

		types = {"Basic", "Elite", "Basic", "Basic", "Basic"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {6000, 6001, 6002, 6003, 6004}, -- storages usadas para desbloquear o item
	},

	[12] =
	{
		items = {2160, 2152}, -- lista de items
		count = {10, 15}, -- quantidade de items
		level = {1, 2}, -- nivel necessario para resgatar

		types = {"Basic", "Elite"}, -- ranking necessario para desbloquear a recompensa
		storagesUnlock = {4922, 4923}, -- storages usadas para desbloquear o item
	},
}

PASS_MONSTERS = { -- aqui sao os monstros das missoe, voce pode configurar os nomes deles aqui, a storage sempre aumentando 1, a completed storage aumentando 1 tbm
-- points sao os pontos que a missao vai dar, e em imagem é a imagem do monstro que fica la no client, e em texto fica o texto que vai ficar embaixo do monstro la no client
-- lembrando que as missões não resetam, então você tem que adicionar muitas, ou até mesmo ficar mudando a storage.
	[1] = {name = "Mouse", type = "kill", storage = 8894, completed_storage = 9998, count = 50, points = 50, image = 798, text = "Derrote 50 Mouse"},
	[2] = {name = "Mouse", type = "kill", storage = 8895, completed_storage = 9999, count = 100, points = 50, image = 798, text = "Derrote 100 Mouse"},
	[3] = {name = "Mouse", type = "kill", storage = 8896, completed_storage = 10000, count = 150, points = 50, image = 798, text = "Derrote 150 Mouse"},
	[4] = {name = "Farmer", type = "kill", storage = 8897, completed_storage = 10001, count = 300, points = 50, image = 521, text = "Derrote 300 Farmer"},
	[5] = {name = "Farmer", type = "kill", storage = 8898, completed_storage = 10002, count = 500, points = 50, image = 521, text = "Derrote 500 Farmer"},
	[6] = {name = "Farmer", type = "kill", storage = 8899, completed_storage = 10003, count = 1000, points = 50, image = 521, text = "Derrote 1000 Farmer"},
	[7] = {name = "Nukenin", type = "kill", storage = 8900, completed_storage = 10004, count = 1000, points = 50, image = 622, text = "Derrote 1000 Nukenin"},
	[8] = {name = "Nukenin", type = "kill", storage = 8901, completed_storage = 10005, count = 1500, points = 50, image = 622, text = "Derrote 1500 Nukenin"},
	[9] = {name = "Nukenin", type = "kill", storage = 8902, completed_storage = 10006, count = 2000, points = 50, image = 622, text = "Derrote 2000 Nukenin"},
	[10] = {name = "Spy Akatsuki", type = "kill", storage = 8903, completed_storage = 10007, count = 2500, points = 50, image = 141, text = "Derrote 2500 Akatsuki"},
	[11] = {name = "Spy Akatsuki", type = "kill", storage = 8904, completed_storage = 10008, count = 3000, points = 50, image = 141, text = "Derrote 3000 Akatsuki"},
	[12] = {name = "Spy Akatsuki", type = "kill", storage = 8905, completed_storage = 10009, count = 3500, points = 50, image = 141, text = "Derrote 3500 Akatsuki"},
	[13] = {name = "Strong Anbu", type = "kill", storage = 8906, completed_storage = 10010, count = 2500, points = 50, image = 8, text = "Derrote 2500 Anbu"},
	[14] = {name = "Strong Anbu", type = "kill", storage = 8907, completed_storage = 10011, count = 3000, points = 50, image = 8, text = "Derrote 3000 Anbu"},
	[15] = {name = "Strong Anbu", type = "kill", storage = 8908, completed_storage = 10012, count = 3500, points = 50, image = 8, text = "Derrote 3500 Anbu"},
	[16] = {name = "Akatsuki guard", type = "kill", storage = 8909, completed_storage = 10013, count = 1, points = 50, image = 141, text = "Derrote 1 Guard"},
	[17] = {name = "Akatsuki unknown", type = "kill", storage = 8910, completed_storage = 10014, count = 1, points = 50, image = 141, text = "Derrote 1 Unknown"},
	[18] = {name = "Akatsuki big member", type = "kill", storage = 8911, completed_storage = 10015, count = 1, points = 50, image = 141, text = "Derrote 1 Big member"},
	[19] = {name = "Spectro", type = "kill", storage = 8912, completed_storage = 10016, count = 2500, points = 50, image = 1188, text = "Derrote 2500 Spectro"},
	[20] = {name = "Spectro", type = "kill", storage = 8913, completed_storage = 10017, count = 3000, points = 50, image = 1188, text = "Derrote 3000 Spectro"},
	[21] = {name = "Spectro", type = "kill", storage = 8914, completed_storage = 10018, count = 3500, points = 50, image = 1188, text = "Derrote 3500 Spectro"},
	[22] = {name = "Devil", type = "kill", storage = 8912, completed_storage = 10019, count = 2500, points = 50, image = 572, text = "Derrote 2500 Devil"},
	[23] = {name = "Devil", type = "kill", storage = 8913, completed_storage = 10020, count = 3000, points = 50, image = 572, text = "Derrote 3000 Devil"},
	[24] = {name = "Devil", type = "kill", storage = 8914, completed_storage = 10021, count = 3500, points = 50, image = 572, text = "Derrote 3500 Devil"},
}

PASS_STARTDAY = 1 -- dia que vai começar o pass -- aqui é o dia q começa
PASS_STARTWEEK = 9 -- mes que vai começar o pass -- mes que começa
PASS_STARTYEAR = 2023 -- ano que vai começar o pass -- ano que começa e ano que acaba

PASS_ENDDAY = 2 -- dia que vai acabar o pass -- dia que acaba o passe
PASS_ENDWEEK = 10 -- mes que vai acabar o pass -- mes que acaba o passe
PASS_FINISH = "Acaba em: " .. PASS_ENDDAY .. "/" .. PASS_ENDWEEK .. "/" .. PASS_STARTYEAR -- lembrando que as datas precisam colidir com o mes, por exemplo: começa no dia 01/02/2023 e acaba no dia 31/02/2023, se voce deixar por exemplo: 31/01/2023 pra começar e acabar em: 31/02/2023 não vai dar certo pq os meses são diferentes.

PASS_BUYCOIN = 2160 -- moeda usada no passe (atualizar passe, dar de presente, comprar level)
PASS_BUYLEVELPRICE = 5 -- quantidade de item que vai precisar pra comprar 1 nivel (diamond, sei la, a moeda que voce configurou acima)
PASS_BUYMAXLEVEL = 5 -- maximo de niveis que posso comprar
PASS_BUYPASSPRICE = 30 -- quantidade de item que vai precisar pra comprar o passe de elite (se for mexer aqui, mexe no texto do cliente tambem, pq lá ta 35)

-- Storages
PASS_TYPE = 93929 -- storage para sinalizar se o passe é Basico ou Elite
PASS_POINTS = 93930 -- storage para sinalizar quantos pontos eu tenho no passe (exp)
PASS_LEVEL = 93931 -- storage para sinalizar que nivel é o meu passe

-- quer configurar o script para voce  testar os dois e me retornar ? deixa comigo atualmente vou termina o shop ainda ah certo, eu vou comer aqui, qualquer coisa voce me chama? dmr!! obg :) tmj
function getPlayerPass(cid)
	if not isPlayer(cid) then
		return true
	end

	local storage = getPlayerStorageValue(cid, PASS_TYPE)
	if storage == nil or storage == -1 then
		setPlayerStorageValue(cid, PASS_TYPE, "Basic")
	end
	
	return tostring(getPlayerStorageValue(cid, PASS_TYPE)) or "Basic"
end

function setPlayerPass(cid, pass)
	if not isPlayer(cid) then
		return true
	end

	setPlayerStorageValue(cid, PASS_TYPE, pass)
	return true
end

function addPlayerPassPoints(cid, points)
	if not isPlayer(cid) then
		return true
	end

	local storage = getPlayerStorageValue(cid, PASS_POINTS)
	setPlayerStorageValue(cid, PASS_POINTS, storage+points)
	return true
end

function setPlayerPassPoints(cid, points)
	if not isPlayer(cid) then
		return true
	end

	setPlayerStorageValue(cid, PASS_POINTS, points)
	return true
end

function getPlayerPassPoints(cid)
	if not isPlayer(cid) then
		return true
	end

	local storage = getPlayerStorageValue(cid, PASS_POINTS)
	if storage == nil or storage <= 0 then
		setPlayerStorageValue(cid, PASS_POINTS, 0)
	end

	return tonumber(getPlayerStorageValue(cid, PASS_POINTS)) or 0
end

function setPlayerPassLevel(cid, level)
	if not isPlayer(cid) then
		return true
	end

	local storage = getPlayerStorageValue(cid, PASS_LEVEL)
	setPlayerStorageValue(cid, PASS_LEVEL, level)
	return true
end

function addPlayerPassLevel(cid, level)
	if not isPlayer(cid) then
		return true
	end

	local storage = getPlayerStorageValue(cid, PASS_LEVEL)
	setPlayerStorageValue(cid, PASS_LEVEL, storage+level)
	return true
end

function getPlayerPassLevel(cid)
	if not isPlayer(cid) then
		return true
	end

	local storage = getPlayerStorageValue(cid, PASS_LEVEL)
	if storage == nil or storage <= 0 then
		setPlayerStorageValue(cid, PASS_LEVEL, 0)
	end

	return tonumber(getPlayerStorageValue(cid, PASS_LEVEL)) or 0
end

function sendOpenPassWindow(cid)
	if not isPlayer(cid) then
		return true
	end

	local day = tonumber(os.date("%d"))
	local week = tonumber(os.date("%m"))
	local year = tonumber(os.date("%Y"))
	if day >= PASS_STARTDAY and week == PASS_STARTWEEK and year == PASS_STARTYEAR and day ~= PASS_ENDDAY and week ~= PASS_ENDWEEK then
		local tabela = PASS_ITEMS[week]
		if tabela then
			doSendPlayerExtendedOpcode(cid, PASS_DESTROYINFO, "rewards".."@")
			for i = 1, #tabela.items do -- sobre o tempo: enviar um g_game.getProtocolGame():sendExtendedOpcode do cliente para setar uma storage global com o tempo atual para nao ficar resetando
				if getPlayerStorageValue(cid, tabela.storagesUnlock[i]) == nil or getPlayerStorageValue(cid, tabela.storagesUnlock[i]) == -1 then
					setPlayerStorageValue(cid, tabela.storagesUnlock[i], 0)
				end
				
				if getPlayerStorageValue(cid, tabela.storagesUnlock[i]) >= 1 then
					doSendPlayerExtendedOpcode(cid, PASS_OPENWINDOW_OPCODE, getItemInfo(tabela.items[i]).clientId.."@"..tabela.count[i].."@"..PASS_FINISH.."@".."unlocked".."@"..getPlayerPassPoints(cid).."@"..getPlayerPassLevel(cid).."@"..getPlayerPass(cid).."@"..tabela.types[i].."@"..getItemNameById(tabela.items[i]).."@")
				else
					doSendPlayerExtendedOpcode(cid, PASS_OPENWINDOW_OPCODE, getItemInfo(tabela.items[i]).clientId.."@"..tabela.count[i].."@"..PASS_FINISH.."@".."locked".."@"..getPlayerPassPoints(cid).."@"..getPlayerPassLevel(cid).."@"..getPlayerPass(cid).."@"..tabela.types[i].."@"..getItemNameById(tabela.items[i]).."@")
				end

				if getPlayerStorageValue(cid, tabela.storagesUnlock[i]) <= 0 and getPlayerPassLevel(cid) >= tabela.level[i] and getPlayerPass(cid) == tabela.types[i] then
					doSendPlayerExtendedOpcode(cid, PASS_COLLECT_OPCODE, "collect".."@")
				end
			end
		else
			doPlayerPopupFYI(cid, "Não existem meses para o passe de batalha.")
		end
	else
		doPlayerPopupFYI(cid, "Você ainda não pode fazer o passe por quê ele não começou ou já acabou.")
	end
	return true
end

function sendPassMonsters(cid)
	if not isPlayer(cid) then
		return true
	end

	doSendPlayerExtendedOpcode(cid, PASS_DESTROYINFO, "monsters".."@")
	for i = 1, #PASS_MONSTERS do
		if getPlayerStorageValue(cid, PASS_MONSTERS[i].storage) == -1 then
			setPlayerStorageValue(cid, PASS_MONSTERS[i].storage, 0)
		end

		if getPlayerStorageValue(cid, PASS_MONSTERS[i].storage) >= PASS_MONSTERS[i].count then
			doSendPlayerExtendedOpcode(cid, PASS_MONSTERSPASS_OPCODE, PASS_MONSTERS[i].name.."@"..PASS_MONSTERS[i].count.."@"..getPlayerStorageValue(cid, PASS_MONSTERS[i].storage).."@".."done".."@"..PASS_MONSTERS[i].image.."@"..PASS_MONSTERS[i].text.."@"..PASS_MONSTERS[i].points.."@")
		else
			doSendPlayerExtendedOpcode(cid, PASS_MONSTERSPASS_OPCODE, PASS_MONSTERS[i].name.."@"..PASS_MONSTERS[i].count.."@"..getPlayerStorageValue(cid, PASS_MONSTERS[i].storage).."@".."notdone".."@"..PASS_MONSTERS[i].image.."@"..PASS_MONSTERS[i].text.."@"..PASS_MONSTERS[i].points.."@")
		end
	end
	return true
end

function collectRecompensePass(cid)
	if not isPlayer(cid) then
		return true
	end

	local week = tonumber(os.date("%m"))
	local tabela = PASS_ITEMS[week]
	if tabela then
		doSendPlayerExtendedOpcode(cid, PASS_DESTROYINFO, "hideAll".."@")
		for i = 1, #tabela.items do
			if getPlayerStorageValue(cid, tabela.storagesUnlock[i]) <= 0 and getPlayerPassLevel(cid) >= tabela.level[i] and tabela.types[i] == "Basic" and getPlayerPass(cid) == "Basic" then
				if getItemInfo(tabela.items[i]).stackable then
					doPlayerAddItem(cid, tabela.items[i], tabela.count[i])
				else
					for it = 1, tabela.count[i] do
						doPlayerAddItem(cid, tabela.items[i], tabela.count[i])
					end
				end

				doPlayerPopupFYI(cid, "Você resgatou suas recompensas!")
				doPlayerAddEloPoints(cid, 2)
				setPlayerStorageValue(cid, tabela.storagesUnlock[i], 1)

				doSendPlayerExtendedOpcode(cid, PASS_COLLECT_OPCODE, "notcollect".."@")
				sendOpenPassWindow(cid)
			end

			if getPlayerStorageValue(cid, tabela.storagesUnlock[i]) <= 0 and getPlayerPassLevel(cid) >= tabela.level[i] and getPlayerPass(cid) == "Elite" then
				if getItemInfo(tabela.items[i]).stackable then
					doPlayerAddItem(cid, tabela.items[i], tabela.count[i])
				else
					for it = 1, tabela.count[i] do
						doPlayerAddItem(cid, tabela.items[i], tabela.count[i])
					end
				end

				doPlayerPopupFYI(cid, "Você resgatou suas recompensas!")
				doPlayerAddEloPoints(cid, 2)
				setPlayerStorageValue(cid, tabela.storagesUnlock[i], 1)

				doSendPlayerExtendedOpcode(cid, PASS_COLLECT_OPCODE, "notcollect".."@")
				sendOpenPassWindow(cid)
			end
		end
	end
	return true
end

function resetPass(cid)
	if not isPlayer(cid) then
		return true
	end
	
	local day = tonumber(os.date("%d"))
	local week = tonumber(os.date("%m"))
	local year = tonumber(os.date("%Y"))
	if day >= PASS_ENDDAY and week >= PASS_ENDWEEK and year == PASS_ENDYEAR then
		for i = 1, 12 do
			local tabela = PASS_ITEMS[i]
			if tabela then
				for it = 1, #tabela.storagesUnlock do
					setPlayerStorageValue(cid, tabela.storagesUnlock[it], 0)
				end
			end
		end

		for i = 1, #PASS_MONSTERS do
			setPlayerStorageValue(cid, PASS_MONSTERS[i].storage, 0)
			setPlayerStorageValue(cid, PASS_MONSTERS[i].completed_storage, 0)
		end

		doPlayerSendTextMessage(cid, 25, "O passe de batalha foi resetado!")
		setPlayerPassLevel(cid, 0)
		setPlayerPassPoints(cid, 0)
	end
	return true
end

function buyPassLevel(cid)
	if not isPlayer(cid) then
		return false
	end

	if getPlayerPassLevel(cid) >= PASS_BUYMAXLEVEL then
		doPlayerPopupFYI(cid, "Você atingiu o nível máximo de níveis que pode comprar.")
		return false
	end

	if getZnotePoints(cid, PASS_BUYCOIN, -1) < PASS_BUYLEVELPRICE then
		doPlayerPopupFYI(cid, "Você não tem dinheiro suficiente para comprar nível de passe.")
		return false
	end

	doSendPlayerExtendedOpcode(cid, PASS_DESTROYINFO, "hideAll".."@")
	doPlayerPopupFYI(cid, "Você comprou 1 nível de passe!")
	removeZnotePoints(cid, PASS_BUYLEVELPRICE)

	addPlayerPassLevel(cid, 1)
	setPlayerPassPoints(cid, 0)
	sendOpenPassWindow(cid)
	return true
end


function buyPassElite(cid)
	if not isPlayer(cid) then
		return true
	end

	if getPlayerPass(cid) == "Elite" then
		doPlayerPopupFYI(cid, "Você já tem o passe de elite.")
		return true
	end

    if getZnotePoints(cid, PASS_BUYCOIN, -1) < PASS_BUYPASSPRICE then
		doPlayerPopupFYI(cid, "Você não tem dinheiro suficiente para comprar o passe.")
		return true
	end

	doSendPlayerExtendedOpcode(cid, PASS_DESTROYINFO, "hideAll".."@")
	doPlayerPopupFYI(cid, "Você comprou o passe de elite!")
	removeZnotePoints(cid, PASS_BUYPASSPRICE)

	-- Caso queira que reseta o level e a exp so desmarcar as linhas
	-- addPlayerPassLevel(cid, 1)
	-- setPlayerPassPoints(cid, 0)

	setPlayerPass(cid, "Elite")
	sendOpenPassWindow(cid)
	return true
end

function buyPassPresent(cid, name)
	if not isPlayer(cid) then
		return true
	end

	if name == getCreatureName(cid) then
		sendOpenPassWindow(cid)
		doPlayerPopupFYI(cid, "Você não pode dar o passe para si mesmo.")
		return true
	end

	if getZnotePoints(cid, PASS_BUYCOIN, -1) < PASS_BUYPASSPRICE then
		doPlayerPopupFYI(cid, "Você não tem dinheiro suficiente para comprar o passe de elite.")
		return true
	end

	for k, v in ipairs(getPlayersOnline()) do
		if string.lower(getCreatureName(v)) == string.lower(name) then
			if getPlayerPass(v) == "Elite" then
				doPlayerPopupFYI(cid, "Este jogador já tem o passe de elite.")
				return true
			end

			doPlayerPopupFYI(v, "Você ganhou o passe de elite de presente de: " .. getCreatureName(cid) .. ".")
			setPlayerPass(v, "Elite")
			sendOpenPassWindow(v)
		end
	end

	if not removeZnotePoints(cid, PASS_BUYPASSPRICE) then
		doPlayerPopupFYI(cid, "Ocorreu um erro ao comprar o passe de elite.")
		return true
	end

	doSendPlayerExtendedOpcode(cid, PASS_DESTROYINFO, "hideAll".."@")
	doPlayerPopupFYI(cid, "Você comprou o passe de elite para: " .. name .. ".")
	return true
end