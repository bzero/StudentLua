-------------------------------------------------------------------------------------------------
-- INTERFACE ISOLIB
-------------------------------------------------------------------------------------------------
isoLib = {}

function isoLib.criaBuffer(tMsg, tParams)

	-- valida parametros
	local tHeader = tMsg.tHeader
	local sIdMsg = tMsg.sIdMsg
	local tBits = tMsg.tBits

	-- faz os ajustes pra essa configuração
	tHeader, tBits = isoLib.substituiNII(tParams.iNII, tHeader, tBits)

	-- monta o buffer
	local buffer = isoLib.montaBuffer(tHeader, sIdMsg, tBits)

	if (buffer) then
		LogDebug(hutil.hextostr(buffer),1,I_LOGDEBUG_TIPO_MSGISO)
	else
		LogDebug("buffer nil",1,I_LOGDEBUG_TIPO_MSGISO)
	end
	return buffer
end

function isoLib.substituiNII(iNII, tHeader, tBits)

	if iNII then
		tHeader.destiny = hutil.completarTexto(iNII,"0",4,true)
		if tBits[ISO_BIT_024] then
			tBits[ISO_BIT_024].sValor = iNII
		end
	end

	return tHeader, tBits
end

function isoLib.montaBuffer(tHeader, sIdMsg, tBits)
	local hIso, err = isoLib.criaIso()	   
    hIso:typeid(sIdMsg)
    for iBit, tOpcoes in pairs(tBits) do		
    	if(tOpcoes.fBinario) then
    		hIso:binaryfield(iBit, tOpcoes.sValor, tOpcoes.fIgnorarFormatacao)			
    	elseif(tOpcoes.fData) then
    		hIso:datefield(iBit,tOpcoes.sValor)
    	end
	end
	
	return hIso:assemble(tHeader)
end

function isoLib.criaIso()
	--Montando a mensagem ISO: Bitmap
    local hIso, err = iso.create()
    -- if ( hIso == nil ) then
    -- 	printer.print(err)
    -- end

	return hIso, err
end
