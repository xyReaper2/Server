-- Criado por Thalles Vitor --
-- Matar Monstro - Passe de Batalha --

function onKill(cid, target)
	if not isCreature(cid) then
		return true
	end

	if not isCreature(target) then
		return true
	end

	for i = 1, #PASS_MONSTERS do
		local tabela = PASS_MONSTERS[i]
		if tabela.name == getCreatureName(target) and tabela.type == "kill" and getPlayerStorageValue(cid, tabela.completed_storage) <= 0 then
			if getPlayerStorageValue(cid, tabela.storage) == nil or getPlayerStorageValue(cid, tabela.storage) == -1 or getPlayerStorageValue(cid, tabela.storage) <= 0 then
			  setPlayerStorageValue(cid, tabela.storage, 0)
			end

			if getPlayerStorageValue(cid, tabela.storage) < tabela.count then
				doPlayerSendTextMessage(cid, 22, "Continue matando para completar a missão do passe!")
				setPlayerStorageValue(cid, tabela.storage, getPlayerStorageValue(cid, tabela.storage)+1)
			end

			if getPlayerStorageValue(cid, tabela.storage) >= tabela.count then
				if getPlayerPassPoints(cid)+tabela.points >= 100 then
					setPlayerPassPoints(cid, 0)
					addPlayerPassLevel(cid, 1)
				else
					addPlayerPassPoints(cid, tabela.points)
				end
				
				doPlayerPopupFYI(cid, "Você terminou a missão do passe! Abra para verificar se já pode retirar uma recompensa.")
				setPlayerStorageValue(cid, tabela.completed_storage, 1)
				return true
			end
		end
	end
	return true
end