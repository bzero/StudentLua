---
--Nome do arquivo:                 cqutil.lua                                             
--                     Arquivo com funcoes uteis                                --
---
--                                  Historico                                             
--  Nome               Login        Data                                         --
---
-- Henrique Borges    hbas         30/05/2006    Versao inicial                           
-- Henrique Borges    hbas         31/05/2006    Adicionando as funcoes de subcampo       
-- Leandro Mitsuo     lmf          22/12/2006    Conserto no agendamento (19603)          
-- Leandro Mitsuo     lmf          22/12/2006    Rework (HFLEX-HIPERCARD-CODE-REV009)     
-- Leandro Mitsuo     lmf          01/02/2007    Criação da função tecla_numerica (20382) 
-- Leandro Mitsuo     lmf          08/02/2007    Nos locais em que o numero do cartão é   
--                                               exibido, formatar de acordo com a        
--                                               especificação do cliente (20447)         
-- Leandro Mitsuo     lmf          09/04/2007    Consertando o agendamento de atualização 
--                                               (23761)                                  
-- Leandro Mitsuo     lmf          17/04/2007    Rework (HFLEX-HIPERCARD-CODE-REV012)     
-- Jobson Ronan       jrjs         27/06/2007    Alteração na função formata_numero_cartao
--                                               para depender da flag da inicialização   
--                                               (26490)                                  
---
-- Eudes Costa       ejoc          01/12/2009    Incluindo funcao para clonar tabelas     
---
hutil = {} 

---
--                                          Funcoes                                       
---


local fDesativaCTLS = true

---                                                                                       --
--Formata o número do cartão de acordo com as regras definidas pelo cliente:
--7 primeiros dígitos ficam abertos, 3 últimos dígitos ficam abertos
--O restante dos dígitos devem ser trocados por asteriscos. Caso a flag mascara_cartao
--seja desativada pelos arquivos de inicialização esta função retornará o número do 
--cartão da forma como foi recebido
--@author Rodrigo Perazzo         
--@param cartao - número do cartão a ser formatado                                             
--@return uma string que contém o número do cartão formatado                                                                                
function hutil.formata_numero_cartao( cartao )
    if not common.mascara_cartao then
        return cartao
    end
    
    return cartao:sub( 1, 6 ) .. string.rep( "*", cartao:len()-10 ) .. cartao:sub( -4 ) --NOVO BIN. COLOCAR ESPACOS EM BRANCO NO FIM PARA DAR 19 E NAO DESLOCAR O COMPROVANTE...
end


---
--Concatena espacos até completar o número de digitos passado como parametro                                                                           
--@author Danilo Oliveira                                                        
--@param len - um inteiro com o numero de espacos                                                             
--@return uma string com len espacos                                            
function hutil.espacos(len)
  local retorno = ""
  for i=1,len do
    retorno = retorno .. " "
  end
  return retorno
end

---
--Adiciona um subcampo a uma estrutura ISO                                                                                       
--@author Danilo Oliveira 
--@param hIso - um handle para a estrutura do ISO                                            
--@param pbit - a constante com o numero do bit ISO                                          
--@param id - uma string com 2 digitos com o identificador do subcampo                       
--@param data - uma string com o conteudo do subcampo                                        
--@return Nenhum                                                                                 
function hutil.isohelp_putSubcampo(hIso,pbit,id,data)
   local tamanho = util.asciitobcd(hutil.completarComZero(tostring(id:len()+data:len()),4))
   local oldValue = hIso:binaryfield(pbit)
   if(oldValue == nil) then
     oldValue = ""
   end
   local value = oldValue .. tamanho .. id .. data
   return hIso:binaryfield(pbit,value)
end

---
--Le um bit da estrutura ISO e o retorna como uma tabela de subcampos                                                                              
--@author Reuel Jonathan                                                                         
--@param hIso - um handle para a estrutura do ISO                 
--@param pbit - a constante com o numero do bit ISO               
--@return uma tabela com objetos de subcampo indexados pelo seu ID 
function hutil.isohelp_readSubcampo(hIso,pbit)
   local value = hIso:binaryfield(pbit)
   local retorno = {}
   if value == nil then
        return retorno
   end
   local index = 1
   while(index < value:len()) do
      local tamanho = tonumber(util.bcdtoascii(value:sub(index,index+1)))
      local conteudo = ""
      if(tamanho > 2) then 
        conteudo = value:sub(index+4,index+1+tamanho)
      end
      
      local subcamp = value:sub(index+2,index+3)
      if retorno[subcamp] == nil then
        retorno[subcamp] = conteudo
 
      elseif type(retorno[subcamp]) == "string" then
        local oldConteudo = retorno[subcamp]
        retorno[subcamp] = {}
        table.insert(retorno[subcamp], oldConteudo)
        table.insert(retorno[subcamp], conteudo)

     elseif type(retorno[subcamp]) == "table" then 
        table.insert(retorno[subcamp], conteudo)
      end
      
      index = index + tamanho +2
   end
   return retorno
end

---
--Completa uma string com o caracter F a esquerda                                            
--@author Eudes Lemos                  
--@param str - a string a ser completada                 
--@param len - o tamanho que a string deve ter           
--@return string com um ou mais caracteres F a esquerda
function hutil.completarComFEsquerda(str,len)
   while(str:len() < len) do
    str = "F"..str
   end
   return str
end

---
--Completa uma string com zeros a esquerda                                                                                     
--@author Eudes Lemos                                                                         
--@param str - a string a ser completada                                                        
--@param len - o tamanho que a string deve ter                                                                                                                                  
--@return a string com um ou mais zeros a esquerda                                               
function hutil.completarComZero(str,len)
   str = tostring(str)
   while(str:len() < len) do
    str = "0"..str
   end
   return str
end

---
--Completa uma string com caracteres à esquerda ou direita                                                                                 
--@author Danilo Oliveira                                                                         
--@param str - a string a ser completada                                                    
--@param caract - caracteres a serem adicionados                                            
--@param len - o tamanho que a string deve ter                                              
--@param esquerda - caso verdadeiro, completa para a esquerda. Caso falso, para a direita   
--@return a string de tamanho len com o param caract completando este tamanho para esq ou dir
function hutil.completarTexto(str,caract,len,esquerda)
  if str == nil then
    str = ""
  end

  str = tostring(str)

  if(str:len() > len) then
    return str
  end

  while(str:len() < len) do
    if esquerda then
      str = caract .. str
    else
      str = str .. caract
    end
  end

  --se o tamanho do param caract é maior que um, é possível que o texto tenha ficado maior que len
  --se isso aconteceu, é necessário cortar o "excesso"
  if str:len() > len then
    if esquerda then
      str = str:sub((str:len() - len) + 1, str:len())
    else
      str = str:sub(1,len)
    end
  end
  
  return str
end

---
--Retira os espacos em branco no começo e fim da string                                               
--@author Danilo Oliveira                                      
--@param str - a string a retirar os espacos                                               
--@return A string sem os espacos                          
function hutil.trim(str)

  if(str == nil) then
    return ""
  end

   local indexStart = 1 
   local indexEnd = str:len()
   local espaco = (" "):byte(1)
   while(str:byte(indexStart) == espaco)do
    indexStart = indexStart  +1
   end
   while(str:byte(indexEnd) == espaco)do
    indexEnd = indexEnd - 1
   end
   return str:sub(indexStart,indexEnd)
end

---
--Imprime os valores hexadecimais dos bytes de uma string                                                        
--@author Danilo Oliveira                                           
--@param str - a string a ser impressa
function hutil.dumpstr(thestr, label)
  str = label or "";
  i = 1;
  while (i <= thestr:len()) do
     ch = thestr:byte(i);
     str = (str .. string.format("%02x ", ch));
     i = i + 1;
  end
  printer.print(str);
end

---
--Retorna os valores hexadecimais dos bytes de uma string                                                   
--@author Daniel Agra                                                                                
--@param str - a string em hexadecimal                       
--@return str - string convertida                             
function hutil.hextostr(thestr)
  str = "";
  i = 1;
  while (i <= thestr:len()) do
     ch = thestr:byte(i);
     str = (str .. string.format("%02x", ch));
     i = i + 1;
  end
  
  return string.upper(str);
end

---
--Cria um objeto responsavel por quebrar uma string em pedacos (tokens). O objeto r
--retorna nil se a string acabar ou se o token corresponder exatamente a string "nil".                                                                                          
--O exemplo abaixo explica seu uso:                                                                                                                                                                                                                                  
--  local x = tokenizer("a-b-nil-d","%-")                                                                         
--  local a = x:nextToken() (a recebe a string "a")                                                                                             
--  local b = x:nextToken() (b recebe a string "b")                                            
--  local c = x:nextToken() (c recebe nil)                                                     
--  local d = x:nextToken() (d recebe a string "d")                                            
--  local e = x:nextToken() (e recebe nil)                                                                                                                                                                                                                         
--@author Danilo Oliveira                                                                         
--@param  str - A string a ser quebrada em tokens                                                
--@param  pattern - O pattern delimitando os tokens. O formato dos padroes segue o especificado  
--na API de strings Lua                                                                                                                                        
--@return Um objeto tokenizer, como descrito acima                                               
function hutil.tokenizer(str,pattern)
  local tk = {}
  tk.startIndex = 1
  function tk:nextToken()
    local ret
    local startOfToken, endOfToken = str:find(pattern,tk.startIndex)
    if startOfToken ~= nil then
      local oldStart = tk.startIndex
      tk.startIndex = endOfToken + 1
      ret = str:sub(oldStart,startOfToken-1)
      if ret ~= nil then
        return ret
      else
        return nil
      end
    else -- if startOfToken ~= nil then
      if tk.startIndex >= #str then 
        return nil 
      end
      ret = string.sub(str,tk.startIndex)
      tk.startIndex = #str
      return ret
    end
  end -- function tk:nextToken()
  return tk
end

---
--Transforma um inteiro correspondente a um valor em centavos numa string com
--um cifrao seguido pelo valor do inteiro em reais. A string é precedida por
--espacos ate completar o tamanho total (passado no segundo parametro)                                                                           
--Exemplo: formatarValor(321,7) retorna "  $3.21"                                                                                                                                                                              
--@author Danilo Oliveira                                                                                                                                          
--@param valor - o valor em centavos a ser formatado                                        
--@param tamanho - um inteiro com o tamanho total da string                                 
--@return Uma string com o valor formatado alinhado a direita                                
function hutil.formatarValor(valor,tamanho)
  valor = tostring(valor):gsub("%.", "")
  valor = math.ceil(valor * 100) /100 
  if(valor < 1) then
    valor = tostring(valor)
    -- tirando virgula
    valor = valor:sub(1,1) .. valor:sub(3)
  end
  valor = tostring(valor)
  valor = string.rep("0",3 - valor:len()) .. valor
  valorCentavos = valor:sub(valor:len()-1)
  valorReais = valor:sub(1,valor:len()-2)
  if valorReais:len() > 3 then
      numPontos = math.floor( (valorReais:len() - 1) / 3)
      qtdPontos = 0
      for i=1, numPontos do
          valorReais = valorReais:sub(1, valorReais:len() - ((3*i) + qtdPontos) ) .. "." .. valorReais:sub(valorReais:len() - ( ((3*i) + qtdPontos) - 1 ))
          qtdPontos = qtdPontos + 1
      end
  end
  -- hutil.espacos(tamanho-valor:len()-("$"):len()) ..
  return  "R$" .. valorReais .. "," .. valorCentavos
end

---
--Transforma um inteiro correspondente a um valor em centavos numa string com
--um cifrao seguido pelo valor do inteiro em reais. A string é precedida por
--espacos ate completar o tamanho total (passado no segundo parametro)                                                                           
--Exemplo: formatarValor(321,7) retorna "  $3.21"                                                                                                                                                                              
--@author Danilo Oliveira                                                                                                                                          
--@param valor - o valor em centavos a ser formatado                                        
--@param tamanho - um inteiro com o tamanho total da string                                 
--@return Uma string com o valor formatado alinhado a direita 
function hutil.formatarValor2(sValor)
  sValor = hutil.completarTexto(sValor, "0", 3, true)
  local sInteiro = sValor:sub(1,sValor:len()-2)
  local sCentavos = sValor:sub(sValor:len()-1)

  local sInteiroFormatado = ""
  local count = 0
  for i = sInteiro:len(), 1, -1 do
    count = count + 1
    sInteiroFormatado = sInteiro:sub(i, i) .. sInteiroFormatado
    if (count % 3 == 0) and (i ~= 1) then
      sInteiroFormatado = "." .. sInteiroFormatado
    end
  end

  return  "R$" .. sInteiroFormatado .. "," .. sCentavos
end

---
--Transforme uma string de valor em um string com 
-- cifrao seguido por espaços em branco e a parte decimal até completar 'tamanho' (passado no segundo parametro)                                                                           
--Exemplo: formatarValor3(321,10) retorna "R$    3,21"                                                                                                                                                                              
--@author Gustavo Rodrigues
--@param valor - o valor em centavos a ser formatado                                        
--@param tamanho - um inteiro com o tamanho total da string                                 
--@return Uma string com o valor formatado alinhado a direita  
function hutil.formatarValor3(sValor, tamanho)
  sValor = hutil.formatarValor(sValor, tamanho)
  if (#sValor < tamanho) then --Completar com espacos em branco
      sValor = "R$" .. string.rep(' ', tamanho - #sValor) .. sValor:sub(3,sValor:len())
  end
  return sValor
end
---
--Transforma um inteiro correspondente a um valor percentual numa string com 
--o valor do inteiro em porcentagem seguido pelo simbolo de percentual. A 
--string é precedida por espacos ate completar o tamanho total            
--(passado no segundo parametro)                                          
--Exemplo: formatarValor(321,7) retorna "  3.21%"                                                                                                           
--@author Danilo Oliveira                                                                                                                         
--@param valor - o valor em centavos a ser formatado                                      
--@param tamanho - um inteiro com o tamanho total da string                                                                                                          
--@return Uma string com o valor formatado alinhado a direita                              
function hutil.formatarValorPorcentagem(valor,tamanho)
  valor = hutil.completarComZero(valor,3)
  return hutil.espacos(tamanho-valor:len()-("%"):len()) .. valor:sub(1,valor:len()-2) .. "," .. valor:sub(valor:len()-1).. "%"
end

---
--Quebra uma string grande em multiplas linhas                                            
--@author Danilo Oliveira                            
--@param tamanho - tamanho maximo da linha       
--@param str - string a ser "quebrada          
--@return a string dividida em linhas de acordo com o tamanho
function hutil.WordWrap(tamanho, str)
    local buf = {}
    local ultimoEspaco = -1;
    local inicioLinha = 0;
    local i = 1;
    local c = ""

    while (i <= #str )
    do
      c = string.sub(str,i,i)
      if ( c == " " ) then
        ultimoEspaco = i;
      end

      if ( c == "\n" ) then
        ultimoEspaco = -1;
        inicioLinha = i+1;
      end

      if (i > (inicioLinha + tamanho - 1) ) then
        if (ultimoEspaco ~= -1) then
          buf[ultimoEspaco] = "\n";

          if( i ~= ultimoEspaco ) then
            buf[i] = c
          end

          inicioLinha = ultimoEspaco+1;
          ultimoEspaco = -1;
        else
          buf[i] = c .. "\n";
          inicioLinha = i;
        end
      else
        buf[i] = c
      end
      i = i+1;      
    end

    local sFinal = ""
    for i,v in ipairs(buf) do
      sFinal = sFinal .. buf[i]
    end

    return sFinal
 end

---
--Função que converte dados em hexadecimal para Ascii                                                         
--@author Danilo Oliveira                                             
--@param data - valor em hexadecimal                                                                                   
--@return valor recebido como argumento em formato de Ascii  
function hutil.hextoascii (data)
  local ascii = ""
  
  for iI = 1, data:len(), 1 do
    local byte = data:byte(iI)
    if  32 <= byte and byte < 126 then
      ascii = ascii .. data:sub(iI,iI)
    else
      ascii = ascii .. "."
    end
  end

  return ascii
end

---
--Estado responsável pela desalocação do módulo                                                   
--@author Danilo Oliveira                                 
function hutil.desalocar()
    hutil = nil
    package.loaded[ "hutil" ] = nil
end

---
--Operação xor entre os bits 'a' e 'b'                                                      
--@author Danilo Oliveira                                             
--@param a - valor do primeiro bit  
--@param b - valor em segundo bit                                                                                   
--@return xor entre 'a' e 'b'
function hutil.bit_xor (a,b)
  local floor = math.floor
  if a == nil then a = 0 end
  if b == nil then b = 0 end
  
  local r = 0
  for i = 0, 7 do
    local x = a / 2 + b / 2
    if x ~= floor (x) then
      r = r + 2^i
    end
    a = floor (a / 2)
    b = floor (b / 2)
  end
  return r
end

---
--Função auxiliar para converter uma string zonada num array de bytes
--@author Danilo Oliveira
--@param entrada - String zonada de entrada
--@return Array de bytes
function hutil.asciitohex (entrada)
  local saida = ""
  
  --printer.print(#entrada)
  
  for i = 1, #entrada, 2 do
    
    local byte = 0
    local byte1Str = string.sub(entrada,i,i)
    local byte2Str = string.sub(entrada,i+1,i+1)
    
    --preparando o primeiro nible ( o mais a direita)
    if      byte2Str == "1" then
      byte = byte + 0x01
    elseif  byte2Str == "2" then
      byte = byte + 0x02
    elseif  byte2Str == "3" then
      byte = byte + 0x03
    elseif  byte2Str == "4" then
      byte = byte + 0x04
    elseif  byte2Str == "5" then
      byte = byte + 0x05
    elseif  byte2Str == "6" then
      byte = byte + 0x06
    elseif  byte2Str == "7" then
      byte = byte + 0x07
    elseif  byte2Str == "8" then
      byte = byte + 0x08
    elseif  byte2Str == "9" then
      byte = byte + 0x09
    elseif  byte2Str == "A" then
      byte = byte + 0x0A
    elseif  byte2Str == "B" then
      byte = byte + 0x0B
    elseif  byte2Str == "C" then
      byte = byte + 0x0C
    elseif  byte2Str == "D" then
      byte = byte + 0x0D
    elseif  byte2Str == "E" then
      byte = byte + 0x0E
    elseif  byte2Str == "F" then
      byte = byte + 0x0F
    end
    
    --preparando o segundo nible ( o mais a esquerda)
    if      byte1Str == "1" then
      byte = byte + 0x10
    elseif  byte1Str == "2" then
      byte = byte + 0x20
    elseif  byte1Str == "3" then
      byte = byte + 0x30
    elseif  byte1Str == "4" then
      byte = byte + 0x40
    elseif  byte1Str == "5" then
      byte = byte + 0x50
    elseif  byte1Str == "6" then
      byte = byte + 0x60
    elseif  byte1Str == "7" then
      byte = byte + 0x70
    elseif  byte1Str == "8" then
      byte = byte + 0x80
    elseif  byte1Str == "9" then
      byte = byte + 0x90
    elseif  byte1Str == "A" then
      byte = byte + 0xA0
    elseif  byte1Str == "B" then
      byte = byte + 0xB0
    elseif  byte1Str == "C" then
      byte = byte + 0xC0
    elseif  byte1Str == "D" then
      byte = byte + 0xD0
    elseif  byte1Str == "E" then
      byte = byte + 0xE0
    elseif  byte1Str == "F" then
      byte = byte + 0xF0
    end
    
    --printer.print(string.format("%02x",byte))
    
    --inserindo o resultado no array de saida
    --table.insert ( saida, byte )
    saida = saida .. string.char(byte)
    
  end
    
  return saida
  
end

---
--Imprime os valores hexa de uma string. nas versoes mais novas do OS, ja existe uma versao nativa na API
--@author Danilo Oliveira
--@param texto - Texto original.
--@param entrada - String a ser transformada em hexa.
function hutil.logbytes (texto, entrada)

  local saida = ""

  for i = 1, #entrada do
    saida = saida .. string.format("%02x",string.byte(entrada:sub(i,i))) .. " "
  end
  
  printer.print("DebugBytes - " .. texto)
  printer.print(saida)
end

---
--Clona toda estrutura de uma table.
--@author Danilo Oliveira
--@param t - table a ser clonada
--@return uma nova table contendo as informações da table 't'
function hutil.cloneTable(t)            
  
  local new = {}             
  local i, v = next(t, nil)  
  
  while i do
    new[i] = v
    i, v = next(t, i)       
  end
  
  return new

end

---
--Formata a string da preautorização com "." a cada 3 bytes
--@author Danilo Oliveira
--@param cod - string com o cod da preautorização 
--@return string formatada
function hutil.formatarPreAutorizacao(cod)
  local I_INDICE_0 = 0
  local I_INDICE_1 = 3
  local I_INDICE_2 = 6
  local I_INDICE_3 = 9
  local I_INDICE_4 = 12 
  local formatado = cod:sub(I_INDICE_0, I_INDICE_1) .. "." .. cod:sub(I_INDICE_1+1, I_INDICE_2) .. "." .. cod:sub(I_INDICE_2+1, I_INDICE_3) .. "." .. cod:sub(I_INDICE_3+1, I_INDICE_4)
   
  return formatado
end

---
--Retorna a forma hexadecimal de um numero decimal
--@author Danilo Oliveira
--@param number - numero (ou string) em formato decimal 
--@return string com a representação hexadecimal do numero
function hutil.decimaltohex(number)
  if (number) then
    local value = 0
    if (type(number) == "string") then
      value = tonumber(number)
    else
      value = number
    end

    local result = ""

    while(value > 15) do
      local v = math.floor(value/16)
      local resto = value%16

      value = v
      if resto < 10 then
        result = resto .. result
      else
        if resto == 10 then
          result = "A" .. result
        elseif resto == 11 then
          result = "B" .. result
        elseif resto == 12 then
          result = "C" .. result
        elseif resto == 13 then
          result = "D" .. result
        elseif resto == 14 then
          result = "E" .. result
        elseif resto == 15 then
          result = "F" .. result
        end
      end
    end

    if value < 10 then
      result = value .. result
    else
      if value == 10 then
        result = "A" .. result
      elseif value == 11 then
        result = "B" .. result
      elseif value == 12 then
        result = "C" .. result
      elseif value == 13 then
        result = "D" .. result
      elseif value == 14 then
        result = "E" .. result
      elseif value == 15 then
        result = "F" .. result
      end
    end

    return result
  else
    return ""
  end  
end

---
--retorna a forma hexadecimal de um numero binario
--@author Danilo Oliveira
--@param binary - numero (ou string) em formato binario 
--@return string com a representação hexadecimal do numero
function hutil.binarytohex(binary)

  if(binary == nil) then
    return ""
  end
  
  local value = 0;  
  for bit = 1, string.len(binary), 1 do
    local bitValue = tonumber(string.sub(binary, bit, bit))
    value = value + math.pow(2,string.len(binary)-bit)*bitValue
  end
  
  return hutil.decimaltohex(value)
end

---
--retorna a forma hexadecimal de um numero binario
--@author Danilo Oliveira
--@param hex - numero (ou string) em formato binario 
--@return string com a representação hexadecimal do numero
function hutil.hextodecimal(hex)

  if(hex == nil) then
    return ""
  end
  
  local value = 0;  
  for bit = 1, string.len(hex), 1 do
    local charValue = string.sub(hex, bit, bit)
    
    if(charValue == "A") then
      charValue = "10"
    elseif(charValue == "B") then
      charValue = "11"
    elseif(charValue == "C") then
      charValue = "12"
    elseif(charValue == "D") then
      charValue = "13"
    elseif(charValue == "E") then
      charValue = "14"
    elseif(charValue == "F") then
      charValue = "15"
    end
    
    charValue = tonumber(charValue) 
    
    value = value + math.pow(16,string.len(hex)-bit)*charValue
  end
  
  return value
end

---
--concatena todos os campos de uma tabela concatenados
--@author Danilo Oliveira
--@param t - uma tabela
--@return string com todos os campos de uma tabela concatenados
function hutil.concatTable(t)
  result = ""
  for i=1, #t, 1 do
    result = result..t[i]
  end

  return result
end

---
--formata sNumero com um ponto e uma virgula
--@author Danilo Oliveira
--@param sNumero - uma string com um valor
--@param iTamTotal - tamanho da string final. se não for informado, considera 9 digitos.
--@return string com o valor com um ponto(se tiver) e uma virgula(ex: 60000 retornaria 600,00 e 600000 retornaria 6.000,00)
function hutil.mascaraValor(sNumero, iTamTotal) 
  local iTamanho = sNumero:len()
  
  while( sNumero:len() > 1 and sNumero:sub(1,1) == '0') do
    sNumero = sNumero:sub(2, sNumero:len())
  end

  if (sNumero:len() == 1) then
    return "     0,00"
  end

  iTamanho = sNumero:len()
  sNumero = sNumero:sub(1, iTamanho-2) .. "," .. sNumero:sub(iTamanho-1, iTamanho)
  
  iTamanho = sNumero:len()

  if (iTamanho > 6) then
    sNumero =  sNumero:sub(1,iTamanho - 6) .. "." .. sNumero:sub(iTamanho-5)
  end

  -- AKT (07/05) - Alterado para que o valor possa ficar do tamanho correto no menu de simulação de crediário.
  if (not iTamTotal) then
    iTamTotal = 9
  end

  return hutil.completarTexto(sNumero, " ", iTamTotal, true)
end

---
--formata sNumero com um ponto e uma virgula
--@author Rafael Felisbino
--@param sNumero - uma string com um valor
--@return string com o valor com um ponto(se tiver) e uma virgula(ex: 60000 retornaria 600,00 e 600000 retornaria 6.000,00)
function hutil.mascaraValor2(sNumero)
  local sNumero = tostring(sNumero)
  local iTamanho = sNumero:len()
  
  if (sNumero:len() == 1) then
    return "     0,0" .. sNumero
  elseif (sNumero:len() == 2) then
	return "     0," .. sNumero
  end

  iTamanho = sNumero:len()
  sNumero = sNumero:sub(1, iTamanho-2) .. "," .. sNumero:sub(iTamanho-1, iTamanho)
  
  iTamanho = sNumero:len()

  if (iTamanho > 6) then
    sNumero =  sNumero:sub(1,iTamanho - 6) .. "." .. sNumero:sub(iTamanho-5)
  end

  return hutil.completarTexto(sNumero, " ", 9, true)
end

---
--formata sData pra ficar no padrao DD/MM/AA
--@author Danilo Oliveira
--@param sData - Uma string com uma data em formato DDMMAA
--@return string com a data no padrao DD/MM/AA (ex: se o argumento for 010203 vai retornar 01/02/03)
function hutil.mascaraData(sData) 
  local sDia = sData:sub(1,2)
  local sMes = sData:sub(3,4)
  local sAno = sData:sub(5,6)

  sData = sDia .. '/' .. sMes .. '/' .. sAno

  return sData

end

---
--Separa texto de acordo com o divisor
--@author Danilo Oliveira
--@param sTexto - texto a ser divido , sDivisor: divisor da string
--@return retorna tabela de strings
function hutil.Split(sTexto,sDivisor)
  local tCampos = {}

  local iInicio = 1
  local iPosicaoInicial, iPosicaoFinal = sTexto:find(sDivisor, iInicio)

  while iPosicaoInicial do
    table.insert(tCampos, sTexto:sub(iInicio, iPosicaoInicial - 1))
    iInicio = iPosicaoFinal + 1
    iPosicaoInicial, iPosicaoFinal = sTexto:find(sDivisor, iInicio)
  end

  table.insert(tCampos, sTexto:sub(iInicio))

  return tCampos
end

---
--Formata numero de CNPJ
--@author Danilo Oliveira
--@param sCNPJ - CNPJ do POS
--@return retorna CNPJ formatado
function hutil.FormatarCNPJ(sCNPJ)
  return sCNPJ:sub(1,2) .. "." .. sCNPJ:sub(3,5) .. "." .. sCNPJ:sub(6,8) .. "/" .. sCNPJ:sub(9,12) .. "-" .. sCNPJ:sub(13)
end

---
--Retorna um número aleatório entre dois números com intervalo aberto                                                             
--@author Danilo Oliveira
--@param inicio - numero inteiro
--@patam fim - numero inteiro                                                                       
--@return número aleatório entre o início e o fim                     
function hutil.Aleatorio(inicio, fim)
    return math.ceil(math.random(inicio - 1, fim))
end

---
--Iterando pela tabela conta +1 para cada key existente.
--@author Daniel Agra
--@param tabela - A tabela que se deseja saber o tamanho.
--@return n - A quantidade de keys existentes na tabela.
function hutil.PegarTamanhoTabela(tabela)
    local n = 0
    for k, v in pairs(tabela) do
        n = n + 1
    end
    return n
end

---
--Arredonda um número                                                                 
--@author Danilo Oliveira                                                                                                          
--@param Argumentos: num - numero para ser arredondado
--@param idp - precisao                                                                  
--@return numero arredondado com a função piso.                                                                                                       
function hutil.Arredondar(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

---                                                                                                                                                                               
-- Factory de metatable para busca por tamanhos fixos de prefixo em chaves sem match direto
--@author Eudes Lemos
--@param iTamPrefix - tamanho do prefixo para buscas
--@return - metatable com método __index
function hutil.fMetatablePrefixo(iTamPrefix)
  return {
    __index = function(tabela, sChaveBusca) 
      if(sChaveBusca ~= nil) then   
        for chave,valor in pairs(tabela) do
          if(type(chave) == "string" and sChaveBusca:sub(1,iTamPrefix) == chave) then
            return valor
          end
        end
      end

      return nil
    end
  }
end

---                                               
--Metatable para busca em chaves sem match direto
--@author Reuel Jonathan
--@return metatable com método __index    
function hutil.fMetatableBusca()
  return {
    __index = function(tabela, sChaveBusca) 
      if(sChaveBusca ~= nil) then   
        for chave,valor in pairs(tabela) do
          if(type(chave) == "string" and sChaveBusca:find(chave) ~= nil) then
            return valor
          end
        end
      end

      return nil
    end
  }
end

---
--Operação de xor entre strings
--@author Daniel Agra
--@param a - string 1
--@param b - string 2
--@return xor entre o valor decimal dos caracteres que formam a e b.
function hutil.strxor(a,b)
  local resp = ""

  if(a:len() == b:len()) then
    for i=1,a:len() do
      --Transforma um caracter num núméro (representação numérica do caracter em hexa. Ex.: "1" = 1; "B" = 11)
      local iCharA = hutil.hexCharToNum(a:sub(i,i))
      local iCharB = hutil.hexCharToNum(b:sub(i,i))

      local iXOR = hutil.bxor(iCharA, iCharB)

      resp = resp .. hutil.NumToHexChar(iXOR)
    end
  end

  return resp
end

---
--Operação XOR entre dois números
--@author Reuel Jonathan
--@param a - número
--@param b - numero
--@return xor entre a e b
function hutil.bxor(a,b)
  local r = 0
  
  for i = 0, 31 do
    local x = a / 2 + b / 2
  
    if x ~= math.floor(x) then
      r = r + 2^i
    end
  
    a = math.floor(a / 2)
    b = math.floor(b / 2)
  end

  return r
end

---
--Transforma um caracter num número (representação numérica do caracter em hexa. Ex.: "1" = 1; "B" = 11)
--@author Danilo Oliveira
--@param sChar - Hexa a ser mapeado para decimal
--@return Representação decimal do valor hexadecimal.
function hutil.hexCharToNum(sChar)
  local iResp = nil

  if(sChar >= "0" and sChar <= "9")then
    iResp = tonumber(sChar)
  elseif(sChar >= "a" and sChar <= "f") or ( sChar >= "A" and sChar <= "F") then
    sChar = string.upper(sChar)

    if sChar == "A" then
      iResp = 10
    elseif sChar == "B" then
      iResp = 11
    elseif sChar == "C" then
      iResp = 12
    elseif sChar == "D" then
      iResp = 13
    elseif sChar == "E" then
      iResp = 14
    elseif sChar == "F" then
      iResp = 15
    end
  end

  return iResp
end

---
--Transforma um número caracter hexa (representação em caracter hexa de um número. Ex.: 1 = "1"; 11 = "B")
--@author Danilo Oliveira
--@param iNum - decimal a ser mapeado para hexa
--@return Representação Hexadecimal do valor decimal.
function hutil.NumToHexChar(iNum)
  local iResp = ""

  if(iNum >= 0 and iNum <= 9)then
    iResp = tostring(iNum)
  elseif(iNum >= 10 and iNum <= 15) then
    if iNum == 10 then
      iResp = "A"
    elseif iNum == 11 then
      iResp = "B"
    elseif iNum == 12 then
      iResp = "C"
    elseif iNum == 13 then
      iResp = "D"
    elseif iNum == 14 then
      iResp = "E"
    elseif iNum == 15 then
      iResp = "F"
    end
  end

  return iResp
end

---
--Imprimir todas os dados de uma tabela
--@author Danilo Oliveira
--@param tTabela - Tabela a ser imprimida
--@param tab - Nome da tabela
function hutil.fPrintTable(tTabela, tab)
  tab = tab or ""
  for k,v in pairs(tTabela) do
    printer.print(tab..k .. ":" .. tostring(v))
    if(type(v) == "table") then
      hutil.fPrintTable(v, tab.."   ")
    end
  end
end

---
--Criar Conjunto de items para verificação rápida se item está ou não contido na lista
--@author Danilo Oliveira
--@param tLista - Tabela de items.
--@return tConjunto - tabela contendo 'values' de tLista como 'keys' 
function  hutil.fCriarConjunto (tLista)
  local tConjunto = {}
  for _, l in ipairs(tLista) do tConjunto[l] = true end
  return tConjunto
end

---
--Transforma um número na representação hexadecimal dele
--@author Danilo Oliveira
--@param num - Numero
--@return Representação hexa do valor decimal.
function hutil.num2hex(num)
    local hexstr = '0123456789abcdef'
    local s = ''
    while num > 0 do
        local mod = math.fmod(num, 16)
        s = string.sub(hexstr, mod+1, mod+1) .. s
        num = math.floor(num / 16)
    end
    if s == '' then s = '0' end
    return s
end

---
--Copia apenas o conteúdo de um objeto, sem trazer a referência para o mesmo
--@author Danilo Oliveira
--@param orig - Tabela com os dados que se deseja copiar
--@return Uma nova tabela desvinculada de referencia da tabela de origem.
function hutil.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[hutil.deepcopy(orig_key)] = hutil.deepcopy(orig_value)
        end
        setmetatable(copy, hutil.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

---                                                                                          
--Verifica se o CPF eh válido
--@author Aleff Henrique                                                                         
--@param cpf - uma string com o CPF a ser verificado                                                               
--@return true se o CPF eh valido, false caso contrário                                        
function hutil.isValidCPF(cpf)
  if(cpf:len() ~= 11) then
    return false
  end
  return hutil.validarDocumento(cpf,{11,10,9,8,7,6,5,4,3}, {10,9,8,7,6,5,4,3,2})
end

---
--Executa a verificacao de digitos de um CPF ou CNPJ
--@author Rodrigo Perazzo                           
--@param caracteres - os digitos do CPF ou CNPJ                                   
--@param multiplicadoresUltimoDigito - Multiplicadores do último digito.                                            
--@param multiplicadoresPenultimoDigito - Multiplicadores do penultimo digito                                                                                        
--@return true se os digitos verificadores são os esperados, false caso contrário
function hutil.validarDocumento(caracteres,multiplicadoresUltimoDigito, multiplicadoresPenultimoDigito)
  --Variaveis para armazenar os valores corretos do ultimo e penultimo digitos
  local penultimoDigito = 0
  local ultimoDigito = 0
  
  --O tamanho
  local lastIndex = caracteres:len()

  --Calcula o digito verificador em funcao dos multiplicadores e do caracteres
  for i = 1,(lastIndex-2) do
    penultimoDigito = penultimoDigito + multiplicadoresPenultimoDigito[i] * tonumber(caracteres:sub(i,i))
    ultimoDigito = ultimoDigito + multiplicadoresUltimoDigito[i] * tonumber(caracteres:sub(i,i))
  end
  
  --Tira o módulo 11 da soma
  penultimoDigito = 11 - (penultimoDigito % 11)
  if (penultimoDigito > 9) then
    penultimoDigito = 0
  end
  ultimoDigito = ultimoDigito + (2 * penultimoDigito)
  ultimoDigito = 11 - (ultimoDigito % 11)
  if (ultimoDigito > 9) then
    ultimoDigito = 0
  end
  
  --Retorna se os digitos passados como parametros sao iguais aos esperados
  return (tonumber(caracteres:sub(lastIndex-1,lastIndex-1))  == penultimoDigito) and (tonumber(caracteres:sub(lastIndex,lastIndex))  == ultimoDigito)
end

---
--Pega a lista de arquivo abaixo e usa a data mais recente dentres eles como a data de referência para a BC atualizar as TBLs
--@author Eudes Lemos
--@param tListaArquivos - Lista de arquivos
--@param sFormatoData - Formatação da data
--@param fComHora - Boolean para inserir hora ou não 
--@return formatedFileDate - A maior data encontrada.
function hutil.pegaMaiorDataArquivos(tListaArquivos, sFormatoData, fComHora)
    local greaterDate = "0000000000"
    local formatedFileDate = ""
    for i, fileName in ipairs(tListaArquivos) do
      local fileDate = os.date("%Y%m%d", os.filemtime(fileName)) .. hutil.completarTexto(os.date("%H", os.filemtime(fileName)),"0",2,true)
      if fileDate > greaterDate then
        formatedFileDate = os.date(sFormatoData, os.filemtime(fileName))
        if fComHora then
          formatedFileDate = formatedFileDate .. hutil.completarTexto(os.date("%H", os.filemtime(fileName)),"0",2,true)
        end
        greaterDate = fileDate
      end
    end
	
	return formatedFileDate
end

---
--Formata os juros com duas casas decimais
--@author Marcelo Tosihiko Sigueoka
--@param sJuros - Juros em string
--@return sJuros - Juros formatado com vírgula e duas casas decimais
function hutil.FormataJuros(sJuros)
   if (sJuros:len() < 3) then -- Completa com "0"s, caso a string seja menor do que 3
      sJuros = string.rep("0", (3 - sJuros:len())) .. sJuros
   end

   sJuros = string.sub(sJuros, 1, (sJuros:len() - 2)) .. "," .. 
            string.sub(sJuros, (sJuros:len() - 1), sJuros:len())   
   return sJuros
end


-->> DMAV 11/05/2015 - Já existe uma função igual com um parâmetro opcional a mais
---
--Pega a lista de arquivo abaixo e usa a data mais recente dentres eles como a data de referência para a BC atualizar as TBLs
--@author Eudes Lemos
--@param tListaArquivos - Lista de arquivos
--@param sFormatoData - Formatação da data
--@return formatedFileDate - A maior data encontrada.
--[[function hutil.pegaMaiorDataArquivos(tListaArquivos, sFormatoData)
    local greaterDate = "0000000000"
    local formatedFileDate = ""
    for i, fileName in ipairs(tListaArquivos) do
      local fileDate = os.date("%Y%m%d", os.filemtime(fileName)) .. hutil.completarTexto(os.date("%H", os.filemtime(fileName)),"0",2,true)
      LogDebug(tostring(fileName) .. '=' .. tostring(fileDate), 1, I_LOGDEBUG_TIPO_BC)
	  if fileDate > greaterDate then
        formatedFileDate = os.date(sFormatoData, os.filemtime(fileName))
        greaterDate = fileDate
      end
    end
	
	LogDebug('hutil.pegaMaiorDataArquivos: ret=' .. tostring(greaterDate), 1, I_LOGDEBUG_TIPO_BC)

    return formatedFileDate
end]]

---
--Atualiza a data e hora do terminal
--@author Luciana Fujiki
--@param sData - Data no formato 'MMDD' 
--@param sHora - Hora no formato 'HHmmss'
--@param tTrans - Transação
--@return true se atualizou com sucesso, false caso contrario
function hutil.AtualizaDataHora (sData, sHora, tTrans)
	local sDataHora = os.date("%Y%m%d%H%M%S") -- AAAAMMDDHHMMSS
    
	if (sDataHora == nil or sData == nil or sHora == nil) then 
		return false 
	end
	-- Coleto data do sistema atual
    local iAnoCorrente = tonumber(string.sub(sDataHora, 1, 4))
	local iMesCorrente = tonumber(string.sub(sDataHora, 5, 6))
	local iDiaCorrente = tonumber(string.sub(sDataHora, 7, 8))
	-- Data e hora do Host
	local iMesHost = tonumber(string.sub(sData, 1, 2))
    local iDiaHost = tonumber(string.sub(sData, 3, 4))
	local iHoraHost =tonumber(string.sub(sHora, 1, 2))
	local iMinHost = tonumber(string.sub(sHora, 3, 4))
	local iSecHost = tonumber(string.sub(sHora, 5, 6))

	-- Ajustando Ano do Host
    if iMesCorrente == 12 and iDiaCorrente == 31 then
        if iMesHost == 1 and iDiaHost == 1 then
			iAnoCorrente = iAnoCorrente + 1
        end
    end
    if iMesCorrente == 1 and iDiaCorrente == 1 then
        if iMesHost == 12 and iDiaHost == 31 then
			iAnoCorrente = iAnoCorrente - 1
        end
    end

	-- Seta nova data e hora do Host
	local fres, sMsg, iret = os.setdatetime({year=iAnoCorrente, month=iMesHost, day=iDiaHost, hour=iHoraHost, min=iMinHost, sec=iSecHost})			
	if (fres) then 
		LogDebug('Atualizou data!!', 1, I_LOGDEBUG_TIPO_MSGISO)
		if (tTrans ~= nil) then
			tTrans.sData = hutil.completarTexto(tostring(iDiaHost), "0", 2, true) .. hutil.completarTexto(tostring(iMesHost), "0",2, true) .. string.sub(tostring(iAnoCorrente), 3, 4)
			tTrans.sHora = sHora
		end
	else 
		LogDebug('NAO Atualizou data', 1, I_LOGDEBUG_TIPO_MSGISO)
		LogDebug('fres: '.. tostring(fres), 1, I_LOGDEBUG_TIPO_MSGISO)
		LogDebug('sMsg: '.. tostring(sMsg), 1, I_LOGDEBUG_TIPO_MSGISO)
		LogDebug('iret: '.. tostring(iret), 1, I_LOGDEBUG_TIPO_MSGISO)
	end
      
   return fres
end


local T_MESES = {}
	T_MESES[1] = "jan"
	T_MESES[2] = "fev"
	T_MESES[3] = "mar"
	T_MESES[4] = "abr"
	T_MESES[5] = "mai"
	T_MESES[6] = "jun"
	T_MESES[7] = "jul"
	T_MESES[8] = "ago"
	T_MESES[9] = "set"
	T_MESES[10] = "out"
	T_MESES[11] = "nov"
	T_MESES[12] = "dez"

---
--Retorna o mes abreviado
--@author Danilo de Souza Pinto
--@param iMes valor do mes numerico
--@return tParams valor do mes abreviado
function hutil.converteMes( iMes )
	if  (iMes ~= nil and iMes ~= "" and iMes > 0 and iMes < 13)  then
	
		for iIndex ,tParams in pairs(T_MESES) do
			if iIndex == iMes then
				return tParams
			end
		end
	else
		return ""
	end

end

---
-- Retorna trilha ajustada
--@author Danilo de Souza Pinto
--@param track1 - tritlha 1 do cartao
--@param track2 - tritlha 2 do cartao
--@param track3 - tritlha 3 do cartao
--@return track1 - valor da trilha ajustada
--@return track2 - valor da trilha ajustada
--@return track3 - valor da trilha ajustada
function hutil.ajustaTrilhas (track1, track2, track3)
	
	if track1 ~= nil and type(track1) == "string" then
		--printer.print('t1:' .. track1)
		track1 = string.gsub(track1,'%%','')
		track1 = string.gsub(track1,'?','')
	end
	
	if track2 ~= nil and type(track2) == "string" then
		--printer.print('t2:' .. track2)
		track2 = track2:gsub("B","")
		track2 = track2:gsub("F","")
		track2 = track2:gsub("D","=")
	end
	
	if track3 ~= nil and type(track3) == "string" then
		--printer.print('t3:' .. track3)
		track3 = track3:gsub("B","")
		track3 = track3:gsub("F","")
		track3 = track3:gsub("D","=")
	end
	
	return track1, track2, track3
end

--Validar data
--@author Daniele Paleari
--@param dia - numero no formato dd
--@param mes - numero no formato mm
--@param ano - numero no formato aa
--@return valida boolean indicando se a data é válida
function hutil.validarData(dia, mes, ano)
	local valida = false
	if ((dia >= 1 and dia <= 31) and (mes >= 1 and mes <= 12)) then
        if ((dia == 29 and mes == 2) and ((ano % 4) == 0)) then --verifica se o ano e bissexto
            valida = true
        elseif (dia <= 28 and mes == 2) then --verifica o mes de feveireiro
            valida = true
        elseif ((dia <= 30) and (mes == 4 or mes == 6 or mes == 9 or mes == 11)) then --verifica os meses de 30 dias
			valida = true
        elseif ((dia <=31) and (mes == 1 or mes == 3 or mes == 5 or mes == 7 or mes ==8 or mes == 10 or mes == 12)) then --verifica os meses de 31 dias
            valida = true
        else
            valida = false
        end
    end
	return valida
end

--Quebra mensagem com base nos "\n" e monta tabela com varias linhas
--@author Danilo de Souza Pinto
--@param sMensagem - Mesagem a ser quebrada
--@param iQtdeCaractLinha - Quantidade maxima de caracteres na linha
--@return tLinhas - Tabela onde cada 'value' é uma linha da string
--@return iQtdeLinhas - Quantidade de linhas
function hutil.quebraStrLinhas(sMensagem, iQtdeCaractLinha)
	local sLinha = ""
  local iQtdeLinhas = 0
	local tLinhasMsg = {}
	
	if (sMensagem ~= "") then
		sMensagem = sMensagem.."\n"
		sMensagem = sMensagem:gsub("\n", "\r")
		for sLinha in string.gmatch(sMensagem, "(.-)(\r)") do
			if (sLinha ~= nil) then
				table.insert( tLinhasMsg, sLinha )
			end
			iQtdeLinhas = iQtdeLinhas + 1
		end
	end
	
	return tLinhasMsg, iQtdeLinhas
end

---
--Agrupa os milhares no formato 123.456.789.
--@author Paulo Oliveira
--@param String val valor sem formatação (ex.: 123456789)
--@return Valor formatado
function hutil.AgrupaMilhares(val)
  local valFmt = val
  while true do
    valFmt, k = string.gsub(valFmt, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return valFmt
end

--- 
--Formata uma string contendo número em valor monetário no formato 123.456.789,12
--@author Paulo Oliveira
--@param String val valor sem formatação (ex.: 12345678912)
--@return Valor formatado
function hutil.FormataValor(val)
	local valFmt = tostring(val)
	while valFmt:len() < 3 do
		valFmt = "0" .. valFmt
	end
	valDec = string.sub(valFmt, valFmt:len() - 1) -- Dígitos decimais
	valFmt = hutil.AgrupaMilhares(string.sub(valFmt, 0, valFmt:len() - 2)) -- Grupos de milhares
	return valFmt .. "," .. valDec
end

---
--Arredonda valores.
--@author Danilo Oliveira
--@param num - Número
--@param idp - Variação
function hutil.round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

---
--Verifica se tem CTLS
--@author Daniel Agra
--@return ret true para indicar se tem CTLS
hutil.AceitaCTLS = function()

	--GCM: Desabilitando CTLS para o piloto
	if fDesativaCTLS then
		return false
	end
	--Se não for POS, sempre diz que tem CTLS
	
	if gtConfig and #gtConfig > 0 and gtConfig[1].fDesativaCTLS then
		
		return false
	end
	
    if iGuiMode ~= S_GUI_MODE_POS then
      return true
    end

    local deviceCap = device.comm_get_capabilities()
    local ret = false

    for i,v in ipairs(deviceCap) do
      if v == 11 then
        ret = true
      end
    end

    return ret
    --] ]
end


---
--retorna hash de um arquivo
--@author Danilo Oliveira
--@param sFile - nome do arquivo
--@return hash - sha1 do arquivo
hutil.getFileHash = function (sFile)
		
	local hash = ''
	local fHandle = io.open(sFile, "r")	
	
	if fHandle ~= nil then
	
		LogDebug('abrindo para sha1 arquivo ' .. tostring(sFile), 1, I_LOGDEBUG_TIPO_BC)
		--zerando o sha1
		--sha1.chaininit()
			
		--iniciando leitura do arquivo
		--debugTexto('carregando arquivo')
		f = fHandle:read('*a')
		
		--debugTexto('gerando sha1')
		fileHash = sha1.calculate(f)
				
		if fileHash then
			--debugTexto(fileHash)
			hash = hutil.hextostr(fileHash)
			LogDebug('hash=' .. tostring(hash), 1, I_LOGDEBUG_TIPO_BC)
		end
		
		fHandle:close()
	
	else
		LogDebug('erro abrindo arquivo ' .. tostring(sFile), 1, I_LOGDEBUG_TIPO_BC)
	
	end
	
	--debugTexto('FS: arquivo ' .. file .. ' carregado')
		
	--erro abrindo o arquivo
	return hash
	
end


---
--retorna hash de uma lista de arquivos
--@author Danilo Oliveira
--@param tFiles - arquivos
--@return tHashs - sha1 dos arquivos
hutil.getFilesHash = function (tFiles)
	
	local tHashs = {}	
	
	for i,sFile in ipairs(tFiles) do
		local tHash = {}
		tHash['hash'] = hutil.getFileHash(sFile)
		table.insert(tHashs,tHash)
    end
	
	return tHashs
	
end

---
--retorna uma lista com as capacidades do terminal
--@author Rafael Felisbino
--@param 
--@return tCapacidadesTerm
hutil.getCapabilities = function ()
	local tCapacidades = device.comm_get_capabilities()
	local tCapacidadesTerm = {}
	
	--utilizando tabela de capacidades
	if tCapacidades and #tCapacidades >= 1 and tCapacidades[1] ~= 0 then
		for i, iCapacidade in ipairs(tCapacidades) do
			
			if (iCapacidade == 0) then -- Bug verifone
				break
			end
			
			if iCapacidade >= 1 and iCapacidade <= 2 then
				tCapacidadesTerm.fDial = true
			elseif iCapacidade == 3 then
				tCapacidadesTerm.fGsm = true
			elseif iCapacidade >= 4 and iCapacidade <= 7 then
				tCapacidadesTerm.fGprs = true
			elseif iCapacidade == 8 then
				tCapacidadesTerm.fWifi = true
			elseif iCapacidade == 9 then
				tCapacidadesTerm.fEthernet = true
			elseif iCapacidade == 10 then
				tCapacidadesTerm.fBluetooth = true
			elseif iCapacidade == 11 then
				tCapacidadesTerm.fNfc = true
			elseif iCapacidade == 12 then
				tCapacidadesTerm.fBaseBluetooth = true
			elseif iCapacidade == 13 then
				tCapacidadesTerm.fPortaSerial = true
			elseif iCapacidade == 14 then
				tCapacidadesTerm.fPortaUsb = true
			end
			
		end
	else
		tCapacidadesTerm = nil
	end
	
	return tCapacidadesTerm
	
end

---
--retorna o modo de entrada da transação
--@author Rafael Felisbino
--@param transação em uso
--@return sModoCaptura
hutil.getEntryMode = function (tTransacaoEmUso)
	local sModoCaptura = tTransacaoEmUso.sModoCaptura or "000"

	if(sModoCaptura == "000") then				
		if(tTransacaoEmUso.iTipoEntrada == I_TIPO_ENTRADA_CHIP) then
			sModoCaptura = S_MODO_CAPTURA_CHIP_COLETA_SENHA

		elseif(tTransacaoEmUso.iTipoEntrada == I_TIPO_ENTRADA_MAGNETICO) then
			sModoCaptura = S_MODO_CAPTURA_MAGNETICO
			if(tTransacaoEmUso.fFallbackMagnetico) then
				sModoCaptura = S_MODO_CAPTURA_FALLBACK_MAGNETICO
			end
		elseif (tTransacaoEmUso.iTipoEntrada == I_TIPO_ENTRADA_CTLS) then
			sModoCaptura = S_MODO_CAPTURA_CTLS
		elseif (tTransacaoEmUso.iTipoEntrada == I_TIPO_ENTRADA_CTLS_TARJA) then
			sModoCaptura = S_MODO_CAPTURA_CTLS_TARJA
		else
			sModoCaptura = S_MODO_CAPTURA_DIGITADO
			if(tTransacaoEmUso.fFallbackDigitado) then
				sModoCaptura = S_MODO_CAPTURA_FALLBACK_DIGITADO
			end

		end
	end
	
	return sModoCaptura
	
end

---
--retorna a tecla pressionada
--@author Rafael Felisbino
--@param tecla
--@return tecla convertida
hutil.fTrataTecla = function (iTeclaFisica)
	local sDispositivo = os.getenv(SYS_PLATFORMVER)--SYS_PLATFORMNAME)
	local tDeParaTecla = {}
	
	LogDebug('dispositivo:' .. tostring(sDispositivo), 1, I_LOGDEBUG_TIPO_UI)
	LogDebug('-Tecla Fisica:' .. tostring(iTeclaFisica), 1, I_LOGDEBUG_TIPO_UI)

	if sDispositivo == "V6P" or sDispositivo == "VCP" or sDispositivo == "VCP" then --VX680 sem NFC - com NFC VX685
		tDeParaTecla[1] = "1"
		tDeParaTecla[20] = 15
		tDeParaTecla[205] = 13 -- tecla # (funcao)
	elseif sDispositivo == "V2P" then --VX520
		tDeParaTecla[1] = 1
		tDeParaTecla[2] = 2
		tDeParaTecla[22] = 16 --baixo
		tDeParaTecla[17] = 19 --cima
		tDeParaTecla[19] = 19 -- esta "cima", mas deveria ser "outra" 204
		tDeParaTecla[303] = 204--outra
		tDeParaTecla[303] = 204--outra
		tDeParaTecla[205] = 205--outra
	elseif sDispositivo == "IWP" then --IWL280
		tDeParaTecla[13] = 15 --.
		tDeParaTecla[205] = 13 --F
	elseif sDispositivo == "I2P" or sDispositivo == "IIP" or sDispositivo == "ITP" then --ICT220 16mb ICT220 128mb ICT250
		tDeParaTecla[17] = 19  -- cima
		tDeParaTecla[303] = 204-- outra
		tDeParaTecla[205] = 13 -- F
		tDeParaTecla[13] = 15 -- .
	elseif sDispositivo == "WINDOWS" then
		tDeParaTecla[1] = 1
		tDeParaTecla[2] = 2
		tDeParaTecla[205] = 13 -- tecla # (funcao)
	end
	
	local iTeclaLogica = 0
	if tDeParaTecla[iTeclaFisica] then
		iTeclaLogica = tDeParaTecla[iTeclaFisica]
	else
		iTeclaLogica = iTeclaFisica
	end
	
	LogDebug('-Tecla Convertida:' .. tostring(iTeclaLogica), 1, I_LOGDEBUG_TIPO_UI)
	return iTeclaLogica 
	
end

-----------------------------------------------------------------------------------------------
--  Nome: hutil.FormatarCNPJ
--  Descricao: Formata numero de CNPJ
--  Argumentos:  sCNPJ: CNPJ do POS
--  Retornos:  retorna CNPJ formatado
-----------------------------------------------------------------------------------------------

function hutil.FormatarCNPJ(sCNPJ)
  return sCNPJ:sub(1,2) .. "." .. sCNPJ:sub(3,5) .. "." .. sCNPJ:sub(6,8) .. "/" .. sCNPJ:sub(9,12) .. "-" .. sCNPJ:sub(13)
end

-----------------------------------------------------------------------------------------------
--  Nome: hutil.FormatarCPF
--  Descricao: Formata numero de CNPJ
--  Argumentos:  sCPF: sCPF do POS
--  Retornos:  retorna sCPF formatado
-----------------------------------------------------------------------------------------------

function hutil.FormatarCPF(sCPF)
  return sCPF:sub(1,3) .. "." .. sCPF:sub(4,6) .. "." .. sCPF:sub(7,9) .. "-" .. sCPF:sub(10, 11)
end