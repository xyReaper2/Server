local function isEqualItems(bau)
local itemScan = getContainerItem(bau, 0).itemid
    for i = 1, getContainerSize(bau)-1, 1 do
        if itemScan ~= getContainerItem(bau, i).itemid then	
        return false
        end
    end
return true
end

local function fundir(cid, item, name, bau, effect)
local file = "data/logs/FundirSystem.txt"
local text = io.open(file, "a+")
    for i = getContainerSize(bau)-1, 0, -1 do
	doRemoveItem(getContainerItem(bau, i).uid)
    end
    
	local result = item
	for i = 1, #RaridadeTable[name], 1 do
		if item == RaridadeTable[name][i] then
	    result = RaridadeTable[name][i+1]
		end
	end
	
	local sucess = doCreateItemEx(result)
	doAddContainerItemEx(bau, sucess)
	text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).." ["..getPlayerLevel(cid).."] criou um "..getItemNameById(result)..".\n")
	text:close()
	doSendMagicEffect(getThingPos(cid), 743)
end 

local COOLDOWN_TIME = 5 -- tempo de cooldown em segundos
local COOLDOWN_EFFECT = 10 -- efeito a ser exibido durante o cooldown

local function getCooldownStorageValue(cid)
    return getPlayerStorageValue(cid, COOLDOWN_STORAGE)
end

local function setCooldownStorageValue(cid, value)
    setPlayerStorageValue(cid, COOLDOWN_STORAGE, value)
end

local function getRemainingCooldownTime(cid)
    local now = os.time()
    local cooldownStart = getCooldownStorageValue(cid)
    if cooldownStart == -1 then
        return 0
    else
        local remainingTime = COOLDOWN_TIME - (now - cooldownStart)
        if remainingTime < 0 then
            remainingTime = 0
        end
        return remainingTime
    end
end

local function startCooldown(cid)
    setCooldownStorageValue(cid, os.time())
end

local function isCooldownActive(cid)
    return getRemainingCooldownTime(cid) > 0
end

local function onCooldown(cid)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa esperar " .. getRemainingCooldownTime(cid) .. " segundos antes de melhorar outro item.")
    doSendMagicEffect(getThingPos(cid), COOLDOWN_EFFECT)
end

local function notifyPlayerAboutFusionTime(cid, timeLeft, effect)
    if timeLeft == 0 then
        doPlayerPopupFYI(cid, "As melhorias foram concluída!")
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "calma estamos melhorando seu item sera possivel tirar do forno em: " .. timeLeft .. " segundos.")
        doSendMagicEffect(getCreaturePosition(cid), effect)
		Trap(cid, timeLeft)
        addEvent(notifyPlayerAboutFusionTime, 1000, cid, timeLeft - 1, effect)
    end
end

local REQUIRED_ITEMS = {
    ["[N]"] = {
        {itemId = 18149, count = 25},
        {itemId = 19431, count = 50},
        {itemId = 19450, count = 300},
        -- Adicione os requisitos da primeira fusão aqui
    },
    ["[R]"] = {
        {itemId = 18149, count = 50},
        {itemId = 19436, count = 50},
        {itemId = 19449, count = 300},
        -- Adicione os requisitos da segunda fusão aqui
    },
    ["[E]"] = {
        {itemId = 18149, count = 100},
        {itemId = 19437, count = 50},
        {itemId = 19452, count = 300},
        -- Adicione os requisitos da segunda fusão aqui
    },
    -- Adicione os requisitos das fusões seguintes aqui
}

local function checkAndRemoveRequiredItems(cid, requirements)
    local missingItems = {}
    for i = 1, #requirements do
        local itemId = requirements[i].itemId
        local count = requirements[i].count
        if getPlayerItemCount(cid, itemId) < count then
            table.insert(missingItems, getItemNameById(itemId) .. " (" .. count .. ")")
        end
    end

    if #missingItems > 0 then
        local message = "Você não tem os seguintes itens necessários para melhorar este item: " .. table.concat(missingItems, ", ")
        doPlayerPopupFYI(cid, message)
        return false
    else
        for i = 1, #requirements do
            local itemId = requirements[i].itemId
            local count = requirements[i].count
            doPlayerRemoveItem(cid, itemId, count)
        end
    end

    return true
end

local function checkContainerBau(cid, pos)
    local timeLeft = 5
    pos.x = pos.x + 1
    local bau = getTileItemById(pos, 14139).uid
    if bau <= 0 then return false end
    if getContainerSize(bau) ~= 1 then return doPlayerSendTextMessage(cid, 22, "Coloque 1 item para que possa ser melhorado dentro do baú") end
    if not isEqualItems(bau) then return doPlayerSendTextMessage(cid, 22, "Não foi possivel.é necessario ter pelomenos uma unidade no bau") end

    local item = getContainerItem(bau, 0)
    if not item then return doPlayerSendTextMessage(cid, 22, "O baú está vazio.") end
    local itemId = item.itemid
    local itemName = getItemNameById(itemId)

    local name = string.sub(itemName, 4 , 30)
    local rarity = string.sub(itemName, 1, 3)
    if not RaridadeTable[name] or rarity == "[L]" then return doPlayerSendTextMessage(cid, 22, "Melhorias para este item não estão disponíveis.") end
    
    local fusionCount = getPlayerStorageValue(cid, 828)
    if fusionCount < 0 then fusionCount = 0 end
    
    if isCooldownActive(cid) then
        onCooldown(cid)
        return true
    end
    
    local requirements = REQUIRED_ITEMS[rarity]
    if not requirements then return false end
    
    if not checkAndRemoveRequiredItems(cid, requirements) then
        doPlayerSendTextMessage(cid, 22, "Você não tem os itens necessários para melhorar este item.")
        return true
    end
    
    startCooldown(cid)
    notifyPlayerAboutFusionTime(cid, timeLeft, 828)
    fundir(cid, itemId, name, bau, effect)
    doPlayerSendTextMessage(cid, 22, "Você acabou de melhorar o seu seguinte item: " .. itemName .. " Ora parece que o seu novo item esta com uma qualidade muito melhor! Parabéns!!!")
end

function onUse(cid, item, frompos, item2, topos)
checkContainerBau(cid, frompos, 743)
return true
end