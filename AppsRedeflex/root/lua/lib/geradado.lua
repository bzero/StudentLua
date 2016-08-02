
local I_QUANTITADE_REGISTROS_LOTE = 100
--local I_MES = GerarNumeroAleatorio(1, 12, false)

function gerarDados()
	LogDebug("INICIANDO A GERACAO DE DADOS", 1, I_LOGDEBUG_TIPO_ESTADOS)

	--Geracao de Arquivos
	gerarArquivoLote()

	LogDebug("FINALIZANDO A GERACAO DE DADOS", 1, I_LOGDEBUG_TIPO_ESTADOS)
end

--Geradores
function gerarArquivoLote()
	LogDebug(" -GERANDO: Arquivo de Lote", 1, I_LOGDEBUG_TIPO_ESTADOS)

	if (gtLote ~= nil) and (#gtLote > 0) then
		LogDebug("  Apagando antigo Arquivo de Lote", 1, I_LOGDEBUG_TIPO_ESTADOS)
		LogDebug("    Tamanho antigo Arquivo de Lote: "  .. #gtLote, 1, I_LOGDEBUG_TIPO_ESTADOS)
		LogDebug("    Data da ultima transacao: "  .. gtLote[#gtLote].sData, 1, I_LOGDEBUG_TIPO_ESTADOS)
		ioLib.removerArquivo(mapaDado.Lote.arquivo)
	end

	local iDia = GerarNumeroAleatorio(10, 23, false)
	local iMes = GerarNumeroAleatorio(1, 12, false)
	local iAno = GerarNumeroAleatorio(10, 14, false)

	local iPorcentagem = 0

	for i=1, I_QUANTITADE_REGISTROS_LOTE do
		iPorcentagem = ImprimirPorcentagem(iPorcentagem, i, I_QUANTITADE_REGISTROS_LOTE)

		local sNumeroCartao = GerarNumeroAleatorioComQuantideCaracteres(16)
		panCript = tCriptografia.CriptNumeroCartao(sNumeroCartao)

		if (string.len(panCript) ~= 255) then
			--printer.print("Erro ao gerar panCript: " .. string.len(panCript) .. " " .. panCript)
		end

		iData, iDia = GerarData(iDia, iMes, iAno, i, I_QUANTITADE_REGISTROS_LOTE)

		Lote = {
			sPANCript = panCript,
			sData = iData,
			sValor = GerarNumeroAleatorio(10, 10000, true),
			sNSU = GerarNumeroAleatorioComQuantideCaracteres(12),
			sAppCryptogram = GerarNumeroAleatorioComQuantideCaracteres(8),
			sIssuerAppData = GerarNumeroAleatorioComQuantideCaracteres(32),
			sUnpredictable = GerarNumeroAleatorioComQuantideCaracteres(4),
			sTVR = GerarNumeroAleatorioComQuantideCaracteres(5),
			sCryptInfoData = GerarNumeroAleatorioComQuantideCaracteres(1),
			sISR = GerarNumeroAleatorioComQuantideCaracteres(15)
		}

		ioLib.escreverArquivo(mapaDado.Lote, Lote, false)
	end

	LogDebug(" -FINALIZANDO: Arquivo de Lote ", 1, I_LOGDEBUG_TIPO_ESTADOS)
end

--Funções Auxiliares
function ImprimirPorcentagem(iPorcentagem, iQuantidadeGerada, iQuantidadeRegistros)
	local iNovaPorcentagem = math.ceil(iQuantidadeGerada * 100 / iQuantidadeRegistros)

	if (iNovaPorcentagem > iPorcentagem and iNovaPorcentagem % 10 == 0) then
		printer.print("  PORCENTAGEM: " .. iNovaPorcentagem .. "%")
	end

	return iNovaPorcentagem
end

function GerarNumeroAleatorioComQuantideCaracteres(iQuantidadeCaracteres)
	local sNumeroAleatorio = ""

	for i=1, iQuantidadeCaracteres do
		sNumeroAleatorio = sNumeroAleatorio .. tostring(GerarNumeroAleatorio(1, 9, true))
	end

	if (string.len(sNumeroAleatorio) ~= iQuantidadeCaracteres) then
		printer.print("Erro ao gerar: " .. iQuantidadeCaracteres)
	end

	return sNumeroAleatorio
end

function GerarData(iDia, iMes, iAno, iQuantidadeGerada, iQuantidadeRegistros)
	local iTercoQuantidade = math.ceil(iQuantidadeRegistros/3)
	local iData = 0

	if (iTercoQuantidade == iQuantidadeGerada or (iTercoQuantidade * 2) == iQuantidadeGerada) then
		iDia = iDia + 1
	end

	iData = tonumber(string.format("%.2d%.2d%d", iDia, iMes, iAno))

	if (string.len(tostring(iData)) ~= 6) then
		printer.print("Erro ao gerar data: " .. iData)
	end

	return iData, iDia
end

function GerarNumeroAleatorio(iRangeInicial, iRangeFinal, fRetornaString)
	local iNumeroAleatorio = math.floor(math.random(iRangeInicial, iRangeFinal) + 0.5)

	if fRetornaString then
		return tostring(iNumeroAleatorio)
	end

	return iNumeroAleatorio
end