-- Criado por Thalles Vitor --
-- Receber Passe de Batalha --
local passReceiveInfos_OPCODE = 216 -- opcode do pass (receber informacoes do cliente)
local passMonsters_OPCODE = 217 -- opcode de missoes do pass (receber informacao do cliente)
local passSendCollect_OPCODE = 218 -- opcode para resgatar as recompensas
local passBuyLevel_OPCODE = 219 -- opcode do pass (enviar comprar de level)
local passBuyPass_OPCODE = 220 -- opcode do pass (enviar a compra de pass)
local passSendPass_PLAYER = 221 -- opcode do pass (enviar passe de presente)

function onExtendedOpcode(cid, opcode, buffer)
	if opcode == passReceiveInfos_OPCODE then
		sendOpenPassWindow(cid)
	end

	if opcode == passMonsters_OPCODE then
		sendPassMonsters(cid)
	end

	if opcode == passSendCollect_OPCODE then
		collectRecompensePass(cid)
	end

	if opcode == passBuyLevel_OPCODE then
		buyPassLevel(cid)
	end

	if opcode == passBuyPass_OPCODE then
		buyPassElite(cid)
	end

	if opcode == passSendPass_PLAYER then
		local param = buffer:split("@")
		local name = tostring(param[1])

		buyPassPresent(cid, name)
	end
	return true
end