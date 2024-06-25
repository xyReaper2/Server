function onSay(cid, words, param, channel)
    local shield = getPlayerSlotItem(cid, CONST_SLOT_LEFT) -- Verifica se o jogador está com um escudo equipado no slot esquerdo
    if not shield then -- Se não estiver equipado ou não for um escudo, exibe mensagem de erro
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa estar com um escudo equipado para utilizar este comando.")
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF) -- Efeito visual de explosão na posição do jogador
        return false
    end
    
    local defense = doPlayerGetDefense(cid) -- Obtém a defesa atual do jogador
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua defesa é de " .. defense .. ".") -- Exibe a defesa atual
    return true
	-- doPlayerSetDefense(cid, param)
	-- print(doPlayerGetDefense(cid))
end