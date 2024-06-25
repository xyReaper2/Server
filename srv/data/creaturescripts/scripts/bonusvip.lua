local config = {
		welvip = "You are a VIP member, so you have an extra 30% EXP Bonus.",
		not_vip = "Be Premium, VIP Players have a better EXP Bonus than Free's.",
		welakat = "You are an akatsuki member or anbu squad, so you have an extra 10% EXP Bonus.",
		not_akat = "Become an akatsuki member or anbu squad and get 10% more xp.",
		guilddomain = "Your guild is the dominant and has 10% exp bonus.",
		notguilddomain = "Dominate the castle with your guild to get 10% extra exp.",
		notguild = "Join a guild and be dominant to get 10% extra exp.",
}

local function xpCasttle(cid)
    if getPlayerGuildId(cid) > 0 then
        if (getGlobalStorageValue(GGN_STATUS) == getPlayerGuildName(cid)) then
        doPlayerSendTextMessage(cid, 27, config.guilddomain)
		return 0.1
		else
		doPlayerSendTextMessage(cid, 27, config.notguilddomain)
        end
    else
    doPlayerSendTextMessage(cid, 27, config.notguild)
    end
return 0
end

local function xpAkatsuki(cid)
    if getPlayerStorageValue(cid, 89745) > 0 or getPlayerStorageValue(cid, 89746) > 0 then
    doPlayerSendTextMessage(cid, 27, config.welakat)
    return 0.1
    else
    doPlayerSendTextMessage(cid, 27, config.not_akat)
    end
return 0
end


function onLogin(cid)
    doPlayerSendTextMessage(cid, 27, (isPremium(cid) and config.welvip or config.not_vip))
    local xp = 1.0 + xpAkatsuki(cid) + xpCasttle(cid)
	doPlayerSetExperienceRate(cid, xp)
	return true
end
