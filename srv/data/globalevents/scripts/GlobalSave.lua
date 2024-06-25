function prepareShutdown(minutes)
        if(minutes <= 0) then
                doSetGameState(GAMESTATE_SHUTDOWN)
                return false
        end

        if(minutes == 1) then
			doBroadcastMessage("Servidor sera reiniciado em " .. minutes .. " minutos, Porfavor Relogue!")
		elseif(minutes <= 3) then
			doBroadcastMessage("Servidor sera reiniciado em " .. minutes .. " minutos, Porfavor Relogue!.")
		else
			doBroadcastMessage("Servidor sera reiniciado em " .. minutes .. " minutos.")
		end

        shutdownEvent = addEvent(prepareShutdown, 60000, minutes - 1)
        return true
end

function onTime()
    return prepareShutdown(5) -- Quantos minutos pra executar o ServeSave. 
end