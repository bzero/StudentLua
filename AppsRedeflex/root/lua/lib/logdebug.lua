I_LOGDEBUG_TIPO_ERRORN = 1
I_LOGDEBUG_TIPO_ESTADOS = 2
I_LOGDEBUG_TIPO_CONEXAO_GERAL = 3
I_LOGDEBUG_TIPO_CONEXAO_DETALHES = 4
I_LOGDEBUG_TIPO_UI = 5
I_LOGDEBUG_TIPO_BC = 6
I_LOGDEBUG_TIPO_MSGISO = 7

function LogDebug(msg, severidade, tipo)
	
	--printer.print(msg)
	
	tLogs = {}
	tLogs[I_LOGDEBUG_TIPO_ERRORN] = true
	tLogs[I_LOGDEBUG_TIPO_ESTADOS] = false
	tLogs[I_LOGDEBUG_TIPO_CONEXAO_GERAL] = true
	tLogs[I_LOGDEBUG_TIPO_CONEXAO_DETALHES] = true
	tLogs[I_LOGDEBUG_TIPO_UI] = false
	tLogs[I_LOGDEBUG_TIPO_BC] = false
	tLogs[I_LOGDEBUG_TIPO_MSGISO] = false

	if msg == nil then
		msg = "nil"
	end

	if tLogs[tipo] then
		log.logburst(msg, severidade)
		--printer.print(msg)
	end
end