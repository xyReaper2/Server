-- Criado por Thalles Vitor --
-- Receber a janela de dungeon ao abrir ela e enviar as informacoes --

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 44 then
        local param = buffer:explode("@")
        local type = tostring(param[1])
        sendDungeon(cid, type)
    end
    return true
end