---
--Fuções de Leitura e Escrita de Arquivos 
--@author Danilo Oliveira
--@release Versão inicial 1.0
--@copyright CESAR

ioLib = {

	---
	--Função responsável remover arquivo
	--@author adc
	--@param sCaminhoArquivo - Caminho do arquivo
	--@return xRemovido
	removerArquivo = function (sCaminhoArquivo)
		local xRemovido = os.remove(sCaminhoArquivo)	
		return xRemovido
	end,

	---
	--Função responsável recuperar o tamanho do Arquivo
	--@author adc
	--@param sCaminhoArquivo - Caminho do arquivo
	--@return xtamanhoArquivo
	recuperaTamanhoArquivo = function (sCaminhoArquivo)
		local xArquivo = nil
		local xtamanhoArquivo = nil
		
		--Verifica o parametro
		if(	type(sCaminhoArquivo) == "string") then		
			xArquivo = io.open(sCaminhoArquivo, "r")
		end
		
		if(xArquivo ~= nil) then
			xtamanhoArquivo = xArquivo:seek("end")
			xArquivo:close()
		end
		
		return xtamanhoArquivo
	end,




	---
	--Função responsável por montar uma tabela com as linhas do arquivo
	--@author Danilo Oliveira
	--@param sCaminhoArquivo - Caminho do arquivo
	--@return Tabela com as linhas do arquivo
	lerArquivo = function (sCaminhoArquivo)
		local xArquivo = nil
		local tLinhas = nil
		local xTabela = nil
		
		--Verifica o parametro
		if(	type(sCaminhoArquivo) == "string") then		
			xArquivo = io.open(sCaminhoArquivo, "r")
		end
		
		--Carrega o arquivo em tabela
		if(xArquivo ~= nil) then						
			xTabela = {}
			tLinhas = xArquivo:lines()		
			
			for sTexto in tLinhas do
				table.insert(xTabela, sTexto)
			end 
			
			xArquivo:close()			
		end
		

		--io.close()				
		return xTabela		
	end,
	
	---
	--Remove os espaços em branco das extremidades do texto
	--@author Danilo Oliveira
	--@param sTexto - Texto para remover os espaços em branco das extremidades
	--@return Texto sem os espações em banco das extremidades
	trim = function (sTexto)
		return sTexto:find'^%s*$' and '' or sTexto:match'^%s*(.*%S)'
	end,
	
	---
	--Formata o texto de acordo com o tamanho informando
	--@author Danilo Oliveira
	--@param sTexto - Texto que será formatado
	--@param iTamanhoTotal - Tamanho total do texto
	--@return Texto formatado de acordo o tamanho informado
	formatarTexto = function (sTexto, iTamanhoTotal)
		local sComplemento = " "
		local iTamanhoTexto = 0

		if(sTexto ~= nil) then	
			if (type(sTexto) == "boolean") then
				if sTexto then
					sTexto = "S"
				else
					sTexto = "N"
				end
			else
				iTamanhoTexto = string.len(sTexto)
				
				if(iTamanhoTexto < iTamanhoTotal) then								
					sTexto = sTexto .. string.rep(sComplemento, (iTamanhoTotal - iTamanhoTexto))
				end		
			end
		else
			sTexto = string.rep(sComplemento, iTamanhoTotal)
		end		
		
		return sTexto
	end,
	
	---
	--Remove a linha selecionada do arquivo
	--@param sArquivo - Arquivo que será lido
	--@param iLinha   - Linha a ser removida
	removerLinha = function (sArquivo, iLinha)
		local tTabela = ioLib.lerArquivo(sArquivo)
		local sNovoArquivo = ""

		table.remove(tTabela, iLinha)
		for iI = 1, #tTabela-1, 1 do
			sNovoArquivo = sNovoArquivo .. tTabela[iI] .. '\n'
		end
		if(#tTabela > 0) then
			sNovoArquivo = sNovoArquivo .. tTabela[#tTabela]

			-- for iI = 1, iLinha -1, 1 do
			-- 	sNovoArquivo = sNovoArquivo .. tTabela[iI] .. '\n'
			-- end
			-- for iI = iLinha, #tTabela - 1, 1 do
			-- 	sNovoArquivo = sNovoArquivo .. tTabela[iI + 1] .. '\n'
			-- 	--tTabela[iI] = tTabela[iI + 1]
			-- end
			local xArquivo = nil
			
			--Verifica o parametro
			if(	type(sArquivo) == "string") then
				os.remove(sArquivo)		
				xArquivo = io.open(sArquivo, "rw")
			end
			
			--Carrega o arquivo em tabela
			if(xArquivo ~= nil) then						
				xArquivo:write(sNovoArquivo)			
				xArquivo:close()			
			end			
		else
			os.remove(sArquivo)
		end
	end,

	---
	--Carrega a tabela de acordo com o arquivo e o mapeamento.
	--@author Danilo Oliveira
	--@param tTabelaMapa - Tabela com o caminho e o mapeamento do arquivo que será carregado na tabela
	--@return Tabela carregada de acordo com o arquivo
	carregarTabela = function (tTabelaMapa)	

		local sPropriedade = ""
		local iTamanho = 0
		local iIndiceInicial = 1
		local iIndiceFinal = 1
		local sValor = ""
		local xTabelaLinha = nil
		local xTabelaResultado = {}

		local tLinhas = ioLib.lerArquivo(tTabelaMapa.arquivo)
		
		if(tLinhas ~= nil and tTabelaMapa.mapa ~= nil) then	

			for iIndiceLinha, sLinha in pairs(tLinhas) do
				xTabelaLinha   = {}
				iIndiceInicial = 1

				for iIncidePropriedade, propriedade in pairs(tTabelaMapa.mapa) do
					sPropriedade = propriedade[1]
					iTamanho     = propriedade[2]
					sTipo = propriedade[3]
					iBase = propriedade[4]

					iIndiceFinal = iIndiceInicial + iTamanho - 1
					sValor		 = string.sub(sLinha, iIndiceInicial, iIndiceFinal)						
					iIndiceInicial = iIndiceFinal + 1	

					xTabelaLinha[sPropriedade] = ioLib.ConverterAtributo(ioLib.trim(sValor), sTipo, iBase)

				end

				table.insert(xTabelaResultado, xTabelaLinha)
			end
			
		end
		
		return 	xTabelaResultado
	end,

	

	---
	--Salva uma tabela global em um .tbl
	--@author Reuel Jonathan
	--@param tTabelaMapa - Tabela com o caminho e o mapeamento do arquivo onde será salvo a tabela
	--@param tTabela - Tabela do tipo global (gtLote, gtEmissores...) que possui várias linhas, que também são tabelas
	--@return
	salvarTabela = function (tTabelaMapa, tTabela, fAtualizar, iLinha)
		local xArquivo = nil
		
		if(not fAtualizar) then 
			os.remove(tTabelaMapa.arquivo)		
		end

		xArquivo = io.open(tTabelaMapa.arquivo, "rw")

		--Carrega o arquivo em tabela
		if(xArquivo ~= nil and tTabelaMapa ~= nil and tTabela ~= nil) then						

			local iInicio = 1
			local iFim = #tTabela

			if(fAtualizar) then
				
				if(iLinha == nil) then
					iLinha = #tTabela
				end
				iInicio, iFim = iLinha, iLinha

				-- if(iLinha == #tTabela) then
				-- 	xArquivo:seek("end")
				-- else

				local iTamanhoLinha = 0
				for iIndiceProp, prop in pairs(tTabelaMapa.mapa) do
					iTamanhoLinha = iTamanhoLinha + prop[2]
				end

				xArquivo:seek("set", (iTamanhoLinha+1)*(iLinha-1))
				-- end
			end

			for iI = iInicio, iFim, 1 do

				for iIndiceProp, prop in pairs(tTabelaMapa.mapa) do
					sPropriedade = prop[1]
					iTamanho     = prop[2]
					sTipo = prop[3]


					local valor = ""
					if ( sTipo == "i" or sTipo == "s") then
						valor = tTabela[iI][sPropriedade] or ""
						if tostring(valor):len() > iTamanho then
							valor = tostring(valor):sub(1,iTamanho)
						end

						if ( sTipo == "i") then
							xArquivo:write( hutil.completarTexto(valor, "0", iTamanho, true) )
						elseif ( sTipo == "s" ) then
							xArquivo:write( hutil.completarTexto(valor, " ", iTamanho, true) )
						end
					elseif ( sTipo == "h" ) then
						if(tTabela[iI][sPropriedade] ~= nil) then
							local hex = hutil.hextostr(tTabela[iI][sPropriedade])
							if hex:len() > iTamanho then
								hex = hex:sub(1,iTamanho)
							end
							xArquivo:write( hutil.completarTexto(hex," ",iTamanho,true))
						else
							xArquivo:write( hutil.completarTexto(""," ",iTamanho,true))
						end
					else -- é do tipo "f"
						if ( tTabela[iI][sPropriedade] ) then
							xArquivo:write("S")
						else
							xArquivo:write("N")
						end
					end

				end

				xArquivo:write("\n")
			end
			
			xArquivo:close()			
		else
			return "Erro em ioLib.salvarTabela()"
		end
	end,

	---
	--Escreve uma nova linha no arquivo, de acordo com a tabela informado por parametro
	--@author Danilo Oliveira
	--@param tTabelaMapa   - Tabela com o caminho e o mapeamento do arquivo que será carregado na tabela
	--@param tTabela 	   - Linha que será adicionada ao arquivo
	--@param fSobrescrever - Determina se o arquivo será apagado ou deve apenas adicionar uma nova linha
	escreverArquivo = function (tTabelaMapa, tTabela, fSobrescrever)		

		local sLinha = ""
		local sPropriedade = ""
		local sValor = ""
		local sArquivoAtual = ""
		local sQuebraLinha = "\r\n"
		local sErro = nil
		
		--Validação dos parametros
		if(tTabelaMapa == nil or tTabela == nil or fSobrescrever == nil) then
			return
		end
		
		if (fSobrescrever == true) then
			os.remove(tTabelaMapa.arquivo)
			sQuebraLinha = ""
		end			
		
		xArquivo, sErro = io.open(tTabelaMapa.arquivo, "rw")
		
		if xArquivo then

			for iIndicePropriedade, propriedade in pairs(tTabelaMapa.mapa) do
				sPropriedade = propriedade[1]
				iTamanho     = propriedade[2]		
				sValor 		 = ioLib.formatarTexto(tTabela[sPropriedade], iTamanho)
				sLinha = sLinha .. sValor	
			end
			
			xArquivo:seek("end")
			xArquivo:write(sQuebraLinha .. sLinha)

			xArquivo:close()
		end

		return sErro
	end,

	---
	-- Faz parse do conteúdo da string para seu respectivo tipo.
	-- @author Aleff Henrique	 
	-- @Editor Rodrigo Perazzo
	-- @param sValor: Contém o  valor ao qual se deseja converter
	-- @param sTipo: Tipo ao qual o valor deve ser convertido. Há três tipos mapeados, "i" para valores numéricos, "f" para booleanos e "s" para strings.
	-- @param iBase: Em caso de valores númericos, é possível passar a base de conversão.
	-- @return O valor convertido.	
	ConverterAtributo = function(sValor, sTipo, iBase)
		if (sTipo == "f") then 
			if (sValor == "S") then 
				return true
			else
				return false
			end 
		elseif (sTipo == "i") then 
			if(iBase ~= nil) then
				return tonumber(sValor, iBase)
			else
				return tonumber(sValor)
			end
		elseif(sTipo == "h") then

			local sHex = sValor
			if(sHex:len() > 0) then
				for i=1,sHex:len() do
					if(" " == sHex:sub(i,i)) then
						sHex = sHex:sub(1,i-1) .. sHex:sub(i+1)
					end
				end
				return util.asciintohex(sHex)
			else
				return ""
			end
		else
			return sValor
		end
	end,

	LerMensagem = function(sCaminhoArquivo)
		local xArquivo = io.open(sCaminhoArquivo, "r")

		local sTexto = nil
		if(xArquivo ~= nil) then						
			sTexto = xArquivo:read("*all")
			xArquivo:close()
		end

		return sTexto
	end,

	SalvarMensagem = function (sCaminhoArquivo, msg)

		xArquivo = io.open(sCaminhoArquivo, "rw")		
		xArquivo:seek("end")
		xArquivo:write(msg)
		xArquivo:close()

	end,

	fCargaTardia = function(tTabelaMapa)
	  
		-- OBS: o arquivo precisa ter o mesmo numero de colunas por linha
		-- le o tamanho da linha para possibilitar a leitura por linha
		local sArquivo = tTabelaMapa.arquivo
		local xArquivo = io.open(sArquivo)
		local tamanhoLinha = 0

		if (xArquivo) then
			local sLinha = xArquivo:read() or ""
			tamanhoLinha = sLinha:len()
		end
		
		  
		-- caso queira guardar as ultimas 3 linhas lidas
		local tCache, tIndices, tTamanhoMaximo = {}, {}, 3
		  
		return function( xArgs )    
		    local tArgs = { xArgs }
		    local xArquivo, xRetorno
		    


		    if(#tArgs > 0) then
		    	
	        	-- retorna uma linha especifica do arquivo
		        if (type(tArgs[1]) == "number") then
		          
		          	-- se a linha ja estiver em cache
			        if(tCache[tostring(tArgs[1])]) then            
			            xRetorno = tCache[tostring(tArgs[1])]
			            
			            -- atualiza a ordem de prioridade
			            for iI, iIndices in ipairs(tIndices) do
			              if(iIndices == tArgs[1]) then                
			                table.insert(tIndices, table.remove(tIndices, iI))
			              end
			            end
			          
			          -- se nao, precisa buscar
			        else            
			            xArquivo = io.open (sArquivo, "r")
			            xArquivo:seek("set", tamanhoLinha*(tArgs[1]-1))
			            xRetorno = xArquivo:read("*l")  
			            xArquivo:close()
			          
			            -- atualiza o cache
			            tCache[tostring(tArgs[1])] = xRetorno
			            tIndices[#tIndices+1] = tArgs[1]
			          
			            -- caso ultrapasse o tamanho da cache
			            -- retira o indice menos usado
			            if(#tIndices > tTamanhoMaximo) then
			                tCache[tostring(tIndices[1])] = nil
			            end
			            
			          end    
			      
			          return xRetorno
		          
		        elseif(type(tArgs[1]) == "table") then
		        	local tParams = tArgs[1]
		          	xRetorno = {}
		          
		          	xArquivo = io.open (sArquivo, "r")	

		          	if (xArquivo) then	

		            	for linha in xArquivo:lines() do	

		              		local tLinha = {}
		              		local sPropriedade = ""
		              		local iTamanho, iIndiceInicial, iIndiceFinal = 0, 1, 1
		              		local fResultadoProcurado = true	

		              		for _, tPropriedade in pairs(tTabelaMapa.mapa) do
		                		sPropriedade = tPropriedade[1]
		                		iTamanho     = tPropriedade[2]
		                		sTipo = tPropriedade[3]
		                		iBase = tPropriedade[4]
		                
		                		iIndiceFinal = iIndiceInicial + iTamanho - 1
		                		sValor     = string.sub(linha, iIndiceInicial, iIndiceFinal)           
		                		iIndiceInicial = iIndiceFinal + 1 
		                
		                		tLinha[sPropriedade] = ioLib.ConverterAtributo(ioLib.trim(sValor), sTipo, iBase)
		              		end              	

		              		for xChave in pairs(tParams.tModelo) do
		                		if(tParams.tModelo[xChave] ~= tLinha[xChave] ) then
		                  			fResultadoProcurado = false
		                  			break
		                		end
		              		end	

		              		if (fResultadoProcurado) then
		                		fResultadoProcurado = false
		                
		                		if tParams.tSaida then
		                
		                  			local tNovaLinha = {}
		                  			tNovaLinha.iIndiceArquivo = hutil.Arredondar(xArquivo:seek()/tamanhoLinha)	

		                  			for iI, sValorChave in pairs(tParams.tSaida) do
		                    			tNovaLinha[sValorChave] = tLinha[sValorChave]
		                  			end
		                  			table.insert(xRetorno, tNovaLinha)
		                
		                		else
		                  			table.insert(xRetorno, hutil.Arredondar(xArquivo:seek()/tamanhoLinha))
		                		end
		              		end
		            	end	

		            	xArquivo:close()
		          	end		          
			        return xRetorno
		        end
		        
		      -- sem argumentos, retorna nil
		    else
		    	return nil
		    end
		end
	end,
}