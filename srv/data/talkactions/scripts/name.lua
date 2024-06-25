function onSay(cid, words, param)
    local t = string.explode(param, ",")
    local pid = getPlayerByNameWildcard(t[1])
    if not t[1] then
        return doPlayerSendTextMessage(cid, 27, "Digite o nome do jogador.")

    elseif not pid then
        return doPlayerSendTextMessage(cid, 27, "O jogador nao existe ou esta offline.")

    elseif not t[2] or t[2] == "" then
        return doPlayerSendTextMessage(cid, 27, "Digite o novo nome que quer dar.")
    end
    doPlayerSendTextMessage(cid, 27, ""..getPlayerNameByGUID(getPlayerGUIDByName(t[1])).." mudou o nome para "..t[2]..".")
    db.query("UPDATE players SET name = '"..t[2].."' WHERE id = "..getPlayerGUIDByName(t[1]))
    doRemoveCreature(pid)
    return true
end