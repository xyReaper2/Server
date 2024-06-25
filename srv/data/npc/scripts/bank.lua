local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local config = {
transferDisabledVocations = {0} -- disable non vocation characters
}

local talkState, count, transfer = {}, {}, {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end


--///////////////////////////START SCRIPT(bank)///////////////////////////--
if(not getPlayerBalance) then
	getPlayerBalance = function(cid)
	local result = db.getResult("SELECT `balance` FROM `players` WHERE `id` = " .. getPlayerGUID(cid))
	if(result:getID() == -1) then
	return false
	end

	local value = tonumber(result:getDataString("balance"))
	result:free()
	return value
	end

	doPlayerSetBalance = function(cid, balance)
	db.executeQuery("UPDATE `players` SET `balance` = " .. balance .. " WHERE `id` = " .. getPlayerGUID(cid))
	return true
	end

	doPlayerWithdrawMoney = function(cid, amount)
	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
	return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
	end

	doPlayerDepositMoney = function(cid, amount)
	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
	end

	doPlayerTransferMoneyTo = function(cid, target, amount)
	local balance = getPlayerBalance(cid)
	if(amount > balance) then
		return false
	end

	local tid = getPlayerByName(target)
	if(tid > 0) then
		doPlayerSetBalance(tid, getPlayerBalance(tid) + amount)
	else
	if(playerExists(target) == FALSE) then
		return false
	end

	db.executeQuery("UPDATE `player_storage` SET `value` = `value` + '" .. amount .. "' WHERE `player_id` = (SELECT `id` FROM `players` WHERE `name` = '" .. escapeString(player) .. "') AND `key` = '" .. balance_storage .. "'")
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) - amount)
	return true
	end
end

local function getPlayerVocationByName(name)
	local result = db.getResult("SELECT `vocation` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if(result:getID() == -1) then
	return false
	end

	local value = result:getDataString("vocation")
	result:free()
	return value
end

local function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967295)
end

local function getCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if(isValidMoney(money)) then
	return money
	end
	return -1
end

function greetCallback(cid)
	talkState[cid], count[cid], transfer[cid] = 0, nil, nil
	return true
end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

---------------------------- help ------------------------
	if msgcontains(msg, 'advanced') then
	if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
		selfSay("Once you are on the Tibian mainland, you can access new functions of your bank account, such as transferring money to other players safely or taking part in house auctions.", cid)
	else
		selfSay("Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you have enough money.", cid)
	end
	talkState[cid] = 0
	
	elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
		selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
		talkState[cid] = 0
		
	elseif msgcontains(msg, 'bank') then
		npcHandler:say("We can change money for you. You can also access your bank account.", cid)
		talkState[cid] = 0

	elseif msgcontains(msg, 'job') then
		npcHandler:say("I work in this bank. I can change money for you and help you with your bank account.", cid)
		talkState[cid] = 0
		
---------------------------- balance ---------------------
	elseif msgcontains(msg, 'balance') then
		if getPlayerBalance(cid) >= 1000000000 then
			npcHandler:say('SURREAL! Voce deve ser muito importante, um dos jogadores bilionarios deste mundo! O saldo da sua conta e incrível ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 100000000 then
			npcHandler:say('Acho que voce deve ser um dos habitantes mais ricos do mundo! O saldo da sua conta e' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 10000000 then
			npcHandler:say('Voce fez dez milhões e ainda cresce! O saldo da sua conta e ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 1000000 then
			npcHandler:say('Uau, voce atingiu o número magico de um milhão de gp!!! O saldo da sua conta e ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold!', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 100000 then
			npcHandler:say('Voce certamente fez um belo centavo. O saldo da sua conta e' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		else
			selfSay("Saldo da sua " .. doNumberFormat(getPlayerBalance(cid)) .. " gold.", cid)
			talkState[cid] = 0
		end
			
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		if getCount(msg) == 0 then
			selfSay("Claro, voce não quer nada, voce não recebe nada!'", cid)
			talkState[cid] = 0
			
		elseif getCount(msg) ~= -1 then
			if getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				
				if isValidMoney(count[cid]) then
					selfSay("Tem certeza de que deseja retirar" .. count[cid] .. " ouro da sua conta bancaria?", cid)
					talkState[cid] = 7
				else
					selfSay("Não ha ouro suficiente em sua conta.", cid)
					talkState[cid] = 0
				end
			else
				selfSay("Não ha ouro suficiente em sua conta.", cid)
				talkState[cid] = 0
			end
		else
			selfSay("Por favor, diga-me quanto ouro voce gostaria de retirar.", cid)
			talkState[cid] = 6
		end
			
		elseif talkState[cid] == 6 then
			if getCount(msg) == -1 then
				selfSay("Por favor, diga-me quanto ouro voce gostaria de retirar.", cid)
				talkState[cid] = 6
			else				
			if getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				
				if isValidMoney(count[cid]) then
					selfSay("Tem certeza de que deseja retirar " .. count[cid] .. "ouro da sua conta bancaria?", cid)
					talkState[cid] = 7
				end
			else
				selfSay("Não ha ouro suficiente em sua conta.", cid)
				talkState[cid] = 0
			end
			end
	
	elseif talkState[cid] == 7 then
	if msgcontains(msg, 'yes') then
	if not doPlayerWithdrawMoney(cid, count[cid]) then
		selfSay("Não ha ouro suficiente em sua conta. O saldo da sua conta e " .. getPlayerBalance(cid) .. ". Por favor, diga-me a quantidade de moedas de ouro que voce gostaria de retirar.", cid)
		talkState[cid] = 0
	else
		selfSay("Olha Voce aqui, " .. count[cid] .. " ouro. Por favor, deixe-me saber se ha algo mais que eu possa fazer por voce.", cid)
		talkState[cid] = 0
	end
	
	elseif msgcontains(msg, 'no') then
		selfSay("Como quiser. Ha mais alguma coisa que eu possa fazer por voce?", cid)
		talkState[cid] = 0
	end
	end
	return true
end
--///////////////////////////END SCRIPT(bank)///////////////////////////--

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())