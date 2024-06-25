function onSay(cid, words, param, channel)
    local shield = getPlayerSlotItem(cid, CONST_SLOT_LEFT) -- Verifica se o jogador est� com um escudo equipado no slot esquerdo
    if not shield then -- Se n�o estiver equipado ou n�o for um escudo, exibe mensagem de erro
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� precisa estar com um escudo equipado para utilizar este comando.")
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF) -- Efeito visual de explos�o na posi��o do jogador
        return false
    end
    
    local defense = doPlayerGetDefense(cid) -- Obt�m a defesa atual do jogador
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua defesa � de " .. defense .. ".") -- Exibe a defesa atual
    return true
	-- doPlayerSetDefense(cid, param)
	-- print(doPlayerGetDefense(cid))
end