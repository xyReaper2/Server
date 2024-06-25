function onSay(cid, words, param, channel)
    local guild = getPlayerGuildId(cid)
    if(not guild or getPlayerGuildLevel(cid) < GUILDLEVEL_LEADER) then
        doPlayerSendChannelMessage(cid, "", "Voce não pode executar este talkaction.", TALKTYPE_CHANNEL_W, 0)
        return true
    end
    local t = string.explode(param, ",")
    if(not t[2]) then
        doPlayerSendChannelMessage(cid, "", "Nenhum parâmetro.", TALKTYPE_CHANNEL_W, 0)
        return true
    end
    local enemy = getGuildId(t[2])
    if(not enemy) then
        doPlayerSendChannelMessage(cid, "", "A guild \"" .. t[2] .. "\" não existe.", TALKTYPE_CHANNEL_W, 0)
        return true
    end
    if(enemy == guild) then
        doPlayerSendChannelMessage(cid, "", "Você não pode declarar war com sua própria guild.", TALKTYPE_CHANNEL_W, 0)
        return true
    end
    local enemyName, tmp = "", db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. enemy)
    if(tmp:getID() ~= -1) then
        enemyName = tmp:getDataString("name")
        tmp:free()
    end
    if(isInArray({"accept", "reject", "cancel"}, t[1])) then
        local query = "`guild_id` = " .. enemy .. " AND `enemy_id` = " .. guild
        if(t[1] == "cancel") then
            query = "`guild_id` = " .. guild .. " AND `enemy_id` = " .. enemy
        end
        tmp = db.getResult("SELECT `id`, `begin`, `end`, `payment` FROM `guild_wars` WHERE " .. query .. " AND `status` = 0")
        if(tmp:getID() == -1) then
            doPlayerSendChannelMessage(cid, "", "Atualmente não há nenhum convite pendente para uma war com " .. enemyName .. ".", TALKTYPE_CHANNEL_W, 0)
            return true
        end
        if(t[1] == "accept") then
            local _tmp = db.getResult("SELECT `balance` FROM `guilds` WHERE `id` = " .. guild)
            local state = _tmp:getID() < 0 or _tmp:getDataInt("balance") < tmp:getDataInt("payment")
            _tmp:free()
            if(state) then
                doPlayerSendChannelMessage(cid, "", "O saldo da sua guild é muito baixo para aceitar este convite.", TALKTYPE_CHANNEL_W, 0)
                return true
            end
            db.query("UPDATE `guilds` SET `balance` = `balance` - " .. tmp:getDataInt("payment") .. " WHERE `id` = " .. guild)
        end
        query = "UPDATE `guild_wars` SET "
        local msg = "aceitou a guild " .. enemyName .. " para a war."
        if(t[1] == "reject") then
            query = query .. "`end` = " .. os.time() .. ", `status` = 2"
            msg = "rejeitou a guild " .. enemyName .. " para a war."
        elseif(t[1] == "cancel") then
            query = query .. "`end` = " .. os.time() .. ", `status` = 3"
            msg = "cancelou a war com a guild " .. enemyName .. "."
        else
            query = query .. "`begin` = " .. os.time() .. ", `end` = " .. (tmp:getDataInt("end") > 0 and (os.time() + ((tmp:getDataInt("begin") - tmp:getDataInt("end")) / 86400)) or 0) .. ", `status` = 1"
        end
        query = query .. " WHERE `id` = " .. tmp:getDataInt("id")
        if(t[1] == "accept") then
            doGuildAddEnemy(guild, enemy, tmp:getDataInt("id"), WAR_GUILD)
            doGuildAddEnemy(enemy, guild, tmp:getDataInt("id"), WAR_ENEMY)
        end
 
        tmp:free()
        db.query(query)
        doBroadcastMessage(getPlayerGuildName(cid) .. " " .. msg, MESSAGE_EVENT_ADVANCE)
        return true
    end
 
    if(t[1] == "invite") then
        local str = ""
        tmp = db.getResult("SELECT `guild_id`, `status` FROM `guild_wars` WHERE `guild_id` IN (" .. guild .. "," .. enemy .. ") AND `enemy_id` IN (" .. enemy .. "," .. guild .. ") AND `status` IN (0, 1)")
        if(tmp:getID() ~= -1) then
            if(tmp:getDataInt("status") == 0) then
                if(tmp:getDataInt("guild_id") == guild) then
                    str = "Voce já invitou a guild " .. enemyName .. " para a war."
                else
                    str = enemyName .. " já invitou voce para a war."
                end
            else
                str = "Voce já está em guerra com a guild " .. enemyName .. "."
            end
            tmp:free()
        end
 
        if(str ~= "") then
            doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_W, 0)
            return true
        end
 
        local frags = tonumber(t[3])
        if(frags ~= nil) then
            frags = math.max(10, math.min(1000, frags))
        else
            frags = 100
        end
 
        local payment = tonumber(t[4])
        if(payment ~= nil) then
            payment = math.max(100000, math.min(1000000000, payment))
            tmp = db.getResult("SELECT `balance` FROM `guilds` WHERE `id` = " .. guild)
 
            local state = tmp:getID() < 0 or tmp:getDataInt("balance") < payment
            tmp:free()
            if(state) then
                doPlayerSendChannelMessage(cid, "", "O saldo da sua guild é muito baixo para tal pagamento.", TALKTYPE_CHANNEL_W, 0)
                return true
            end
 
            db.query("UPDATE `guilds` SET `balance` = `balance` - " .. payment .. " WHERE `id` = " .. guild)
        else
            payment = 0
        end
 
        local begining, ending = os.time(), tonumber(t[5])
        if(ending ~= nil and ending ~= 0) then
            ending = begining + (ending * 86400)
        else
            ending = 0
        end
 
        db.query("INSERT INTO `guild_wars` (`guild_id`, `enemy_id`, `begin`, `end`, `frags`, `payment`) VALUES (" .. guild .. ", " .. enemy .. ", " .. begining .. ", " .. ending .. ", " .. frags .. ", " .. payment .. ");")
        doBroadcastMessage(getPlayerGuildName(cid) .. " has invited " .. enemyName .. " to war till " .. frags .. " frags.", MESSAGE_EVENT_ADVANCE)
        return true
    end
 
    if(not isInArray({"end", "finish"}, t[1])) then
        return false
    end
 
    local status = (t[1] == "end" and 1 or 4)
    tmp = db.getResult("SELECT `id` FROM `guild_wars` WHERE `guild_id` = " .. guild .. " AND `enemy_id` = " .. enemy .. " AND `status` = " .. status)
    if(tmp:getID() ~= -1) then
        local query = "UPDATE `guild_wars` SET `end` = " .. os.time() .. ", `status` = 5 WHERE `id` = " .. tmp:getDataInt("id")
        tmp:free()
        doGuildRemoveEnemy(guild, enemy)
        doGuildRemoveEnemy(enemy, guild)
 
        db.query(query)
        doBroadcastMessage(getPlayerGuildName(cid) .. " has " .. (status == 4 and "mend fences" or "ended up a war") .. " with " .. enemyName .. ".", MESSAGE_EVENT_ADVANCE)
        return true
    end
 
    if(status == 4) then
        doPlayerSendChannelMessage(cid, "", "Atualmente não há trégua de guerra pendente da guild " .. enemyName .. ".", TALKTYPE_CHANNEL_W, 0)
        return true
    end
 
    tmp = db.getResult("SELECT `id`, `end` FROM `guild_wars` WHERE `guild_id` = " .. enemy .. " AND `enemy_id` = " .. guild .. " AND `status` = 1")
    if(tmp:getID() ~= -1) then
        if(tmp:getDataInt("end") > 0) then
            tmp:free()
            doPlayerSendChannelMessage(cid, "", "Você não pode acabar com a war com " .. enemyName .. ".", TALKTYPE_CHANNEL_W, 0)
            return true
        end
 
        local query = "UPDATE `guild_wars` SET `status` = 4, `end` = " .. os.time() .. " WHERE `id` = " .. tmp:getDataInt("id")
        tmp:free()
    
        db.query(query)
        doBroadcastMessage(getPlayerGuildName(cid) .. " has signed an armstice declaration on a war with " .. enemyName .. ".", MESSAGE_EVENT_ADVANCE)
        return true
    end
    doPlayerSendChannelMessage(cid, "", "Atualmente não há nenhuma guerra ativa com a guild " .. enemyName .. ".", TALKTYPE_CHANNEL_W, 0)
    return true
end