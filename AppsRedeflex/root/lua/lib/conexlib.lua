I_ERRO_SOCKET_TCP 			= 1
I_ERRO_SOCKET_CONNECT 		= 2
I_ERRO_SOCKET_SEND 			= 3
I_ERRO_SOCKET_CLOSE			= 4
I_ERRO_SOCKET_SEM_RESPOSTA 	= 5

local I_CONEXAO_GSM_CSD = 1
local I_CONEXAO_GSM_GPRS = 2
local I_CONEXAO_ETHERNET = 3

local iTipoConexao = nil

local socket = require("socket.core")
require("hutil")

-- variável pra guardar o tipo de conexão setado
local iTipoConexao = nil

-- tipos de conexões
tConex = {
	[I_CONEXAO_GSM_CSD] = {
		sNomeConexao = "GSM/CSD",
		fModem = true,

		fPegarStatus = function ()
			local status, lastError, interation = gsm.csd_status()
			LogDebug("fPegarStatus:", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("status - "..tostring(status), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("lastError - "..tostring(lastError), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("interation - "..tostring(interation), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("\n", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			return status
		end,

		fLigarModem = function()

			local res, err = gsm.csd_up()
			if res == nil then
				LogDebug("Error in gsm.csd_up: ".. err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return nil
			end

			return true
		end,

		fDesligarModem = function()
			if (iGuiMode ~= S_GUI_MODE_WIN) then
				gsm.csd_down()
			end
			return true
		end,

		fConectar = function (tParams)

			if not tParams then
				return false
			end

			local sTelefone = tParams.sTelefone
			if not sTelefone then
				return false
			end

			if (conexlibDebugAll) then
				LogDebug("Tentativa de conexão", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("Telefone: " .. tostring(sTelefone), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			end

			local res, err = gsm.csd_connect(sTelefone, tParams.iTempoEsperaConx or 30, tParams.iNumTentativas or 10)
			if res == nil then
				LogDebug("Error in gsm.csd_connect: ".. err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return nil, err, I_ERRO_SOCKET_CONNECT
			end

			local status, err, iter = gsm.csd_status()
			while status == "connecting" do
				management.sleep(500)
				status, err, iter = gsm.csd_status()
			end

			if status ~= "connected" then
				LogDebug("Error in gsm.csd_connect: ".. err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return nil, err, I_ERRO_SOCKET_CONNECT
			end

			LogDebug("gsm.csd_connect: true", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			return true
		end,

		fDesconectar = function()
			gsm.csd_disconnect()
			return true
		end,

		fConectado = function ()
			local status, err, iter = gsm.csd_status()
			return status == "connected"
		end,

		fEnviarMensagem = function(tParams, sMsg)	

			if not sMsg then
				LogDebug("msg nula", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return nil, nil, I_ERRO_SOCKET_SEND
			end

			-- retira os bytes do tamanho da msg iso
			sMsg = sMsg:sub(3)

			LogDebug("trying to send: " .. #sMsg .. " bytes", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

			local res, err = gsm.csd_send(sMsg)
			if res == nil then
				LogDebug("Error in gsm.csd_send: ".. err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return nil, err, I_ERRO_SOCKET_SEND
			end

			LogDebug("send success: " .. #sMsg .. " bytes", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

			local buffer, err = gsm.csd_recv(1000, tParams.iTempoResposta or 30)
			if err ~= nil then
				LogDebug("Error in gsm.csd_recv: ".. err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return nil, err, I_ERRO_SOCKET_SEM_RESPOSTA
			end

			LogDebug("buffer: "..tostring(buffer), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug(hutil.hextostr(buffer),1,I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

			return buffer
		end,
	},
	[I_CONEXAO_GSM_GPRS] = {
		fUsaSocket = true,
		sNomeConexao = "GSM/GPRS",
		fModem = true,

		fPegarStatus = function ()
			local status, internalStatus, internalError = gsm.gprs_status()	
			LogDebug("fPegarStatus:", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("status - "..tostring(status), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("internalStatus - "..tostring(internalStatus), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("internalError - "..tostring(internalError), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug("\n", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			return status
		end,

		fLigarModem = function(tParams)
			if not tParams then
				return false
			end

			local apn = tParams.sAPN
			if not apn then
				return false
			end

			local login = tParams.sLogin or ""
			local password = tParams.sPassword or ""

			local gprsconfig = { apn = apn, login = login, password = password }

			if conexlibDebugAll then
				LogDebug("LigaGPRS - gprsconfig:", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("APN: " .. tostring(apn), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("login: " .. tostring(login), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("password: " .. tostring(password), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			end			
			
			local res, msg, err = gsm.gprs_config(gprsconfig)
			if not res then
				LogDebug("Erro gsm.gprs_config", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug(msg, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return res, msg, err
			end
				
			res, msg, err = gsm.gprs_up()
			if not res then
				LogDebug("Erro gsm.gprs_up", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug(msg, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				return res, msg, err
			end
			
			return true
		end,

		fDesligarModem = function()
			if (iGuiMode ~= S_GUI_MODE_WIN) then
				local result, err = gsm.gprs_down()
				LogDebug("fDesligarModem:", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("result - "..tostring(result), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("err - "..tostring(err), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
				LogDebug("\n", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			end

			return true
		end,
	},
	[I_CONEXAO_ETHERNET] = {
		fUsaSocket = true,
		sNomeConexao = "ETHERNET",
		fModem = false,
	}
}

-- para as conexões que usam socket
-- use os mesmos métodos
tSocket = {
	sock = nil,

	fConectado = function()	
		if conexlibDebugAll then
			LogDebug("Socket: fConectado", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
		end

		if tSocket.sock then
			if conexlibDebugAll then
				LogDebug("Socket não é nulo.", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			end

			tSocket.sock:settimeout(0)
			local s, status = tSocket.sock:receive(2)			
			return status ~= "closed"
		else
			if conexlibDebugAll then
				LogDebug("Socket é nulo.", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			end

			return false
		end
	end,

	fConectar = function (tParams)
		if not tParams then
			return false
		end

		local sIP = tParams.sIP
		local sPorta = tParams.sPorta

		if (not sIP) or (not sPorta) then
			return false
		end			

		LogDebug("-------------------------------", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("Tentativa de conexão", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("Endereço: " .. sIP, 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("Porta: " .. sPorta, 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("-------------------------------", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		
		if not socket._VERSION then
			return false, "socket._VERSION undefined."
		end
		
		LogDebug("socket._VERSION OK", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
		
		tSocket.sock, err = socket.tcp()
		if not tConex[I_CONEXAO_ETHERNET].sock then
			LogDebug("Error in socket.tcp()..", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug(err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

			return false, err, I_ERRO_SOCKET_TCP			
		end

		LogDebug("socket.tcp OK", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

		tSocket.sock:settimeout(tParams.iTempoEsperaConx or 30)
		local res, err = tSocket.sock:connect(sIP, tonumber(sPorta))
		if not res then
			LogDebug("Error in socket.connect()", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			LogDebug(err, 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

			return false, err, I_ERRO_SOCKET_CONNECT
		end

		LogDebug("socket.connect OK", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)

		return true
	end,

	fDesconectar = function()
		local res, err = tSocket.sock:close()
		if not res then
			--LogDebug("Error in socket.close()", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			return nil, err, I_ERRO_SOCKET_CLOSE
		end

		return true
	end,

	fEnviarMensagem = function(tParams, sMsg)

		if not sMsg then
			LogDebug("Msg nula", 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
			
			return false, nil, I_ERRO_SOCKET_SEND
		end

		LogDebug("Msg enviada para o servidor:", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug(hutil.hextostr(sMsg), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
		LogDebug(hutil.hextoascii(sMsg), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("-------------------------------", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		
		local res, err = tSocket.sock:send(sMsg)
		if not res then
			--LogDebug("Error in socket.send()")
			return nil, err, I_ERRO_SOCKET_SEND
		end

		local data = ""

		tSocket.sock:settimeout(tParams.iTempoResposta or 30)
		local s, status, partial = tSocket.sock:receive(2)		
		if (s == nil) then
			return nil, "resposta vazia", I_ERRO_SOCKET_SEM_RESPOSTA  
		end

		local size = s:byte(1) * 256 + s:byte(2)
		local s2, status, partial = tSocket.sock:receive(size)
		if (s2 == nil) then
			return nil, "resposta vazia", I_ERRO_SOCKET_SEM_RESPOSTA  
		end

		for iI = 1, size, 1 do
			local byte = s2:byte(iI)
		end
		data = s .. s2

		LogDebug("-------------------------------", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("Msg de resposta do servidor:", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug(hutil.hextostr(data), 1, I_LOGDEBUG_TIPO_CONEXAO_DETALHES)
		LogDebug(hutil.hextoascii(data), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		LogDebug("-------------------------------", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		return data
	end,
}
tMetatableSocket = {
	__index = function(tabela, sChaveBusca) 
	  	if(sChaveBusca ~= nil) then   
	  		return tSocket[sChaveBusca]
	  	else
	  		return nil
		end
	end
}
for iTipoConexao, tPropriedades in pairs(tConex) do
	if tPropriedades.fUsaSocket then
		setmetatable(tConex[iTipoConexao], tMetatableSocket)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------
-- INTERFACE CONEXLIB
------------------------------------------------------------------------------------------------------------------------------------------------
conexLib = {}

function conexLib.fVerificaTipoConexao(tParams)
	
	LogDebug("fVerificaTipoConexao - "..tostring(tParams.iTipoConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	if tConex[tParams.iTipoConexao] then

		iTipoConexao = tParams.iTipoConexao
		LogDebug("Conexão escolhida: " .. tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		
		return true
	else
		iTipoConexao = nil
		LogDebug("Tipo de conexão " .. tostring(tParams.iTipoConexao) .. " não suportada!!", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		return false
	end
end

function conexLib.fLigarModem(tParams)
	LogDebug("fLigarModem - "..tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	-- se o tipo de conexão não usa modem, então ignora
	if not tConex[iTipoConexao].fModem then
		return true
	end

	-- verifica como está o modem
	local status = tConex[iTipoConexao].fPegarStatus()
	LogDebug("Status Modem: " .. status, 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	

	-- se está UP já retorna ok.
	if status == "up" then
		return true
	-- se não força o down e liga.
	else
		if status ~= "down" then
			conexLib.fDesligarModem()
		end

		if status == "down" then
			return tConex[iTipoConexao].fLigarModem(tParams)
		else
			return false
		end
	end
end

function conexLib.fAguardaModem(tParams)
	LogDebug("fAguardaModem - "..tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	-- verifica como está o modem
	local status = tConex[iTipoConexao].fPegarStatus()
	LogDebug("Aguarda Modem: " .. status, 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	-- se está UP já retorna ok
	if status == "up" then
		return true

	-- se não está se conectando, força o religamento
	elseif status ~= "connecting" then		
		conexLib.fLigarModem(tParams)
		return conexLib.fAguardaModem(tParams)
	end

	-- enquanto estiver tentando se conectar, espera uma mudança no status
	while status == "connecting" do
		management.sleep(500)
		status = tConex[iTipoConexao].fPegarStatus()		
	end
	
	LogDebug("Aguarda Modem: " .. status, 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	-- se mesmo após tentar se conectar não funcionou, aborta
	if status ~= "up" then
		if status ~= "down" then
			tConex[iTipoConexao].fDesligarModem()
		end
		return false
	else
		return true
	end
end

function conexLib.fConectar(tParams)
	LogDebug("fConectar - "..tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	if tConex[iTipoConexao].fConectado() then
		LogDebug("Já estava conectado", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
		return true
	else
		if not tConex[iTipoConexao].fModem or conexLib.fAguardaModem(tParams) then
			return tConex[iTipoConexao].fConectar(tParams)
		else
			LogDebug("Erro no modem!!", 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
			return false, nil, I_ERRO_SOCKET_CONNECT
		end
	end
end

function conexLib.fEnviarMensagem(tParams, sMsg)
	LogDebug("fEnviarMensagem - "..tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	local conectado, erro, codErro = conexLib.fConectar(tParams)
	if conectado then
		return tConex[iTipoConexao].fEnviarMensagem(tParams, sMsg)
	else
		return nil, erro, codErro
	end
end

function conexLib.fDesconectar()
	LogDebug("fDesconectar - "..tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)
	
	return tConex[iTipoConexao].fDesconectar()
end

function conexLib.fDesligarModem()
	LogDebug("fDesligarModem - "..tostring(tConex[iTipoConexao].sNomeConexao), 1, I_LOGDEBUG_TIPO_CONEXAO_GERAL)

	-- se o tipo de conexão não usa modem, então ignora
	if not tConex[iTipoConexao].fModem then
		return true
	end

	tConex[iTipoConexao].fDesligarModem()
end

function conexLib.fDesligarTudo()
	tConex[I_CONEXAO_GSM_GPRS].fDesligarModem()
	tConex[I_CONEXAO_GSM_CSD].fDesligarModem()
end

function conexLib.fGSM()
	return iTipoConexao == I_CONEXAO_GSM_CSD
end

function conexLib.fETHERNET()
	return iTipoConexao == I_CONEXAO_ETHERNET
end