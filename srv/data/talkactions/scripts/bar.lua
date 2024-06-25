local effects = {
	["fogos"] = {bar = 2, storage = 7128140},
	["escuro"] = {bar = 3, storage = 7128141},
	["rainbow"] = {bar = 4, storage = 7128142},
	["ghost"] = {bar = 5, storage = 7128143},
	["bow"] = {bar = 6, storage = 7128144},	
	["hokage"] = {bar = 7, storage = 7128145},
	["raikage"] = {bar = 8, storage = 7128146},
	["mizukage"] = {bar = 9, storage = 7128147},
	["kazekage"] = {bar = 10, storage = 7128148},
	["tsuchikage"] = {bar = 11, storage = 7128149},
}

local config = {
	storageRunning = 712813,
}

local function runAura(cid, bar)
	if isCreature(cid) then
		doSetHealthBackgroundOutfit(cid, bar)
		else
		return false
	end
	return true
end

local function deactivateAura(cid)
    setPlayerStorageValue(cid, config.storageRunning, 0)
    runAura(cid, 0)
end


function onSay(cid, words, param)
    local t = string.explode(param, ",")
    if not t[1] then
        local bars = ""
        for k, v in pairs(effects) do
            if getPlayerStorageValue(cid, v.storage) >= 1 then
                bars = bars .. k .. ", "
            end
        end

        if bars ~= "" then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Suas barras disponíveis são: " .. string.sub(bars, 1, -3) .. ".")
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não possui nenhuma aura disponível.")
        end
        return true
    end

    local bar = effects[t[1]]

    if bar then
        if getPlayerStorageValue(cid, bar.storage) >= 1 then
            local currentBar = getPlayerStorageValue(cid, config.storageRunning)
            if currentBar == bar.bar then
                deactivateAura(cid) -- Deactivate if the same bar is selected
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Barra desativada.")
            else
                setPlayerStorageValue(cid, config.storageRunning, bar.bar)
                runAura(cid, bar.bar)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Barra ativada.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não possui essa barra. Para adquiri-la, acesse a loja.")
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando inválido.")
    end
    return true
end