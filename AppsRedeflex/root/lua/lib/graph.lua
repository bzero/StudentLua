require "gblvar"
require "cdspgr"
require "hutil"
require "logdebug"

HF_BUTTON_ACCEPT_BUTTON	= 100 -- Botão de Ok selecionado.
HF_BUTTON_REJECT_BUTTON	= 101 -- Botão de Cancelar ou Voltar selecionado.
HF_BUTTON_CLEAR_BUTTON = 203 -- Botão de Limpar selecionado.
HF_BUTTON_FIRST_BUTTON = 204 -- Primeiro botão selecionado (Botão da esquerda do footer).
HF_BUTTON_SECOND_BUTTON = 205 -- Segundo botão selecionado. 
HF_BUTTON_THIRD_BUTTON = 206 -- Terceiro botão selecionado.
HF_BUTTON_LAST_BUTTON = 207 -- Último botão selecionado (Botão da direita do footer).
HF_BUTTON_SETTINGS_DOWN_BUTTON = 208 -- Retorno da área superior esquerda na tela de settings
HF_BUTTON_SETTINGS_UP_BUTTON = 209 -- Retorno da área superior direita na tela de settings
HF_BUTTON_SETTINGS_BUTTON = 210 -- Retorno do botão inferior exibido na tela de settings.
HF_CHIP_EVENT = 301 -- Evento de uso do cartão por meio de CHIP detectado.
HF_MAGNETIC_EVENT = 302 -- Evento de uso do cartão por meio de Fita Magnética detectado.
HF_TIMEOUT_EVENT = 303 -- Evento Timeout de passado como parâmetro da função detectado.
HF_TIMEOUT_MENU_EVENT = 304 -- Evento Timeout utilizado para Menu na aplicação, ele não tem um equivalente na Lib.
HF_BUTTON_KEYBOARD_ACCEPT_BUTTON = 1000 -- Retorno do botão “Ok” da tela de keyboard.
HF_BUTTON_KEYBOARD_REJECT_BUTTON = 1001 -- Retorno do botão “Cancelar” da tela de keyboard.
HF_BUTTON_KEYBOARD_PREV_BUTTON = 1002 -- Retorno do botão “Voltar” da tela de keyboard.
HF_BUTTON_KEYBOARD_ARROW_LEFT_BUTTON 	= 1014 -- Retorno do botão “Seta Esquerda” da tela de Keyboard.
HF_BUTTON_KEYBOARD_ARROW_RIGHT_BUTTON = 1015 -- Retorno do botão “Seta direita” da tela de Keyboard.

--Tipos de máscaras de input
I_INPUT_TIPO_ALFANUMERICO = 1 --Input do tipo alfanumerico
I_INPUT_TIPO_NUMERICO = 2 -- Input do tipo numérico
I_INPUT_TIPO_IP = 3 -- Input do tipo IP
I_INPUT_TIPO_SENHA = 4 -- Input do tipo senha

HF_BUTTON_KEYBOARD_REJECT_BUTTON_BUG = 63569
HF_BUTTON_KEYBOARD_ACCEPT_BUTTON_BUG = 63568

RET_OK 			= 0
RET_CANCELADO 	= 2

RCKEY_0 =   0x30
RCKEY_1 =   0x31 
RCKEY_2 =   0x32
RCKEY_3 =   0x33 
RCKEY_4 =   0x34 
RCKEY_5 =   0x35
RCKEY_6 =   0x36 
RCKEY_7 =   0x37 
RCKEY_8 =   0x38 
RCKEY_9 =   0x39

RCKEY_A      = 0x41

RCKEY_O1     = 0x100
RCKEY_O2     = 0x101
RCKEY_O3     = 0x102
RCKEY_O4     = 0x103
RCKEY_O5     = 0x104
RCKEY_O6     = 0x105
RCKEY_O7     = 0x106
RCKEY_O8     = 0x107

RCKEY_F1     = 0x200
RCKEY_F2     = 0x201
RCKEY_F3     = 0x202
RCKEY_F4     = 0x203
RCKEY_F5     = 0x204
RCKEY_F6     = 0x205
RCKEY_F7     = 0x206
RCKEY_F8     = 0x207
RCKEY_F9     = 0x208
RCKEY_F10    = 0x209
RCKEY_F11    = 0x20A
RCKEY_F12    = 0x20B
RCKEY_F13    = 0x20C

RCKEY_ENTER  = 0x300
RCKEY_CLEAR  = 0x301
RCKEY_CANCEL = 0x302
RCKEY_PREV   = 0x303
RCKEY_PREV2  = 0x304
RCKEY_NEXT   = 0x305
RCKEY_NEXT2  = 0x306

DISP_LONG_TOUCH_COL         =   38   
DISP_LONG_TOUCH_LIN         =   14   
DISP_TOUCH_MENU_MAX_COM_TIT =   3    
DISP_TOUCH_MENU_MAX_SEM_TIT =   4    
DISP_TOUCH_MAX_ARIAL_19     =   20

PLATF_TECLA_ENTER     		= RCKEY_F13
--PLATF_TECLA_LIMPA     		= RCKEY_F12
PLATF_TECLA_LIMPA			= RCKEY_CLEAR
PLATF_TECLA_CANCELA   		= RCKEY_F11
PLATF_TECLA_ANTERIOR  		= RCKEY_F7
PLATF_TECLA_ANTERIOR2 		= nil
PLATF_TECLA_PROXIMO   		= RCKEY_F8
PLATF_TECLA_PROXIMO2  		= nil
PLATF_TECLA_ALFA      		= RCKEY_PREV
PLATF_TECLA_ALFA2     		= RCKEY_NEXT
PLATF_ALFASEQ         		= "2ABC\0003DEF\0004GHI\0005JKL\0006MNO\0007PRS\0008TUV\0009WXY\0000_ \000.,\0001QZ\000"
PLATF_TECLA_VOLTAR    		= RCKEY_F4

PLATF_TECLA_MENU      		= RCKEY_F1
PLATF_TECLA_MENU2     		= RCKEY_NEXT
PLATF_TECLA_MENU3     		= RCKEY_PREV
PLATF_TECLA_FUNC       		= 3003

TEMPO_MSG_SUCESSO   =  5000   --  5 segundos
TEMPO_MSG_AVISO     =  2000   --  2 segundos
TEMPO_MSG_ERRO      =  5000   --  5 segundos
TEMPO_CONFIG_OK     = 10000   -- 10 segundos
TEMPO_OPERADOR      = 30   	  -- 30 segundos Espec. P0600
TEMPO_IDLE          = 60000   -- 60 segundos
TEMPO_QUEDA_ENERGIA = 300000  -- 5 min

SYS_BATTERY_NO_CHARGE     = 0
SYS_BATTERY_CHARGING      = 1
SYS_BATTERY_LOW_ALARM     = 2

local statusAnimacao = false
local gfAnimacaoAtiva = false

graph = {}

local bImagemAnim = false
local progressBarBG = ""

local function Trim (sOrig)
	return (string.gsub(sOrig, "^%s*(.-)%s*$", "%1"))
	--return trim(sOrig)
end

local function Beep ()
	keyboard.buzzer (BEEP_SHORT,BEEP_MIDTONE)
end

local function BeepClick()
	keyboard.buzzer (BEEP_CLICK, BEEP_LOW)
end


function graph.init(file)
	return ui.graphical_init(file)

	
end

---
-- Monta o ícone do sinal
--@author Marcelo Tosihiko Sigueoka
--@param sPosFontes Posição das fontes na barra de status
--@return sIconeSinal Ícone do sinal
local function MontaIconeSinal(sPosFontes, iSinal, iTxErro)   
   
   local sIconeSinal = "~L003"
   if iSinal >= 0 then
   --if ((iSinal >= 0) and (iSinal <= 31)) then
      --[[   
         Monta os ícones do sinal. Definição de 20/Jul/2011:
         Abaixo de 5 = Sem Sinal
         Entre 5 e 10 = Fraco 1 Barra.
         Entre 11 e 15 = Médio 2 Barras.
         Entre 16 e 21 = Bom 3 Barras.
         Acima de 21 = Ótimo 4 Barras.
      ]]
      
      if (iSinal > 21) then
         sIconeSinal = sIconeSinal .. "~I160"  -- 4 Barras
      elseif (iSinal >= 16) then
         sIconeSinal = sIconeSinal .. "~I159"  -- 3 Barras
      elseif (iSinal >= 11) then
         sIconeSinal = sIconeSinal .. "~I158"  -- 2 Barras
      elseif (iSinal >= 5) then
         sIconeSinal = sIconeSinal .. "~I157"  -- 1 Barra 
      else
         sIconeSinal = sIconeSinal .. "~I156"  -- Nenhuma barra
      end
      
      sIconeSinal = sIconeSinal .. "~L024~U002" .. sPosFontes .. "~F01~$1" .. string.format("%02d", iSinal)
      
      -- Taxa de Erro
            
      if ((iTxErro >= 0) and (iTxErro <= 7)) then
         sIconeSinal = sIconeSinal .. "/" .. iTxErro
      end
   else
      sIconeSinal = sIconeSinal .. "~I156"  -- Nenhuma barra
   end
   return sIconeSinal   
end


local function MontaModoCom(iModoCom)
   -- Modo de comunicação atual do modem - INT (0 - Sem SimCard, 1 - Sem registro, 2 - Registrado em CSD, 3 - Registrado em GPRS.)
   local sModoCom = ""
   local sPosicao = "~L080~V"
   
   -- Verifica se está atachado em GPRS   
   local iModo = iModoCom
         
	if (iModo == 0) then
		sModoCom = sPosicao .. "~I162"  -- Sem SIM Card
	elseif (iModo == 1) then
		sModoCom = sPosicao -- atachando
	elseif (iModo == 2 or iModo == 3) then
		sModoCom = sPosicao .. "~I161"  -- Modo GPRS
	else
		sModoCom = sPosicao .. "~I162~F01" .. iModo  -- Sem SIM Card
	end
   
   return sModoCom
end

---
-- Monta o nome da operadora
--@author Marcelo Tosihiko Sigueoka
--@param sPosFontes Posição das fontes na barra de status
--@return sOperadora Nome da Operadora
local function MontaOperadora(sPosFontes, sOperadora)
   -- Verifica se identificou a operadora do SIM Card
   return sPosFontes .. "~C~F01~$1" .. sOperadora
end 

local function MontaIconeBateria(sPosFontes, iNivelBat)    
   local sIconeBateria = "~R003~U000"
   
   if (iNivelBat <= 0) then
      iNivelBat = -iNivelBat --voltando para positivo para exibir correto
	  sIconeBateria = sIconeBateria .. "~I155"  -- Bateria sendo carregada...
   elseif (iNivelBat >= 80) then
      sIconeBateria = sIconeBateria .. "~I154"  -- 4 Barras
   elseif (iNivelBat >= 60) then
      sIconeBateria = sIconeBateria .. "~I153"  -- 3 Barras
   elseif (iNivelBat >= 40) then
      sIconeBateria = sIconeBateria .. "~I152"  -- 2 Barras
   elseif (iNivelBat >= 20) then
      sIconeBateria = sIconeBateria .. "~I151"  -- 1 Barra
   else
      sIconeBateria = sIconeBateria .. "~I150"  -- Nenhuma Barra
   end
   
   sIconeBateria = "~R035" .. sPosFontes .. "~F01~$1" .. iNivelBat .. "%" .. sIconeBateria
   return sIconeBateria
end  


local function MontaBarraStatus2(iNivelBat, fHorizontal,iModoCom, iSinal, iTxErro, sOperadora)
   local sPosFontes = "~D002"
   
   local sFundo = "~B099" -- Default
  
   if (fHorizontal) then     
	  sFundo = "~B098"
   end

   
   -- Monta a barra de status   
   local sScript = sFundo ..                                 -- Fundo da barra
                   MontaIconeSinal(sPosFontes, tonumber(iSinal), tonumber(iTxErro)) .. -- Sinal
                   MontaModoCom(tonumber(iModoCom)) ..       -- Modo de Comunicação               
                   MontaOperadora(sPosFontes, sOperadora) .. -- Operadora
                   MontaIconeBateria(sPosFontes, tonumber(iNivelBat))  -- Bateria
   
   --LogDebug(sScript, 1, I_LOGDEBUG_TIPO_UI)
   ui.graphical_fix_img(sScript)
   
   --return sScript
   
end


local function MontaBarraStatus(fHorizontal)
	
	local gsm_info = {}
	
	--status da bateria
	local iCargaBateria, iStatusBateria = os.batterystatus()
	
	--sem bateria
	if iStatusBateria == nil or iCargaBateria == nil then
		iCargaBateria = 0
		
	--carregando
	elseif tonumber(iStatusBateria) == 1 then
		iCargaBateria = -iCargaBateria
	end
	
	--dados do gsm
	if gsm then
		gsm_info = gsm.info()	
	end
	
   if not gsm_info['has_sim_card'] then
      MontaBarraStatus2(iCargaBateria, fHorizontal, 0, 0, 99, '')

   else
   	if not gsm_info['gprs_mode'] 	   then gsm_info['gprs_mode'] 	 = '0' end
   	if not gsm_info['radio_level'] 	then gsm_info['radio_level'] = '0' end
   	if not gsm_info['rssi']			   then gsm_info['rssi'] 		 = '0' end
   	if not gsm_info['network_name']	then gsm_info['network_name'] = '' end
      if not gsm_info['ber']  then gsm_info['ber'] = '99' end
   	
   	--ajuste para nao ficar com nome de operadora e sem chip
   	if (gsm_info['network_name']:len() > 1 or gsm_info['rssi'] ~= '0') and gsm_info['gprs_mode'] == '0' then
   		gsm_info['gprs_mode'] = '1'
   	end
   	
   	MontaBarraStatus2(iCargaBateria, fHorizontal, gsm_info['gprs_mode'], gsm_info['rssi'], gsm_info['ber'], gsm_info['network_name'])
   end
end

local function GeraTelaScript(sMenuScr) 
	ret = ui.graphical(sMenuScr)
	return ret
end



local function TecladoNumerico()
   local sAux = ""
 
   sAux = string.format("~U076~L015~I011{~L008~U010~F041~K%03x}", KEY_ONE) ..
          string.format("~C~I011{~L008~U010~F042~K%03x}"        , KEY_TWO) ..
          string.format("~R015~I011{~L008~U010~F043~K%03x}"     , KEY_THREE) ..
          string.format("~U122~L015~I011{~L008~U010~F044~K%03x}", KEY_FOUR) ..
          string.format("~C~I011{~L008~U010~F045~K%03x}"        , KEY_FIVE) ..
          string.format("~R015~I011{~L008~U010~F046~K%03x}"     , KEY_SIX) ..
          string.format("~U168~L015~I011{~L008~U010~F047~K%03x}", KEY_SEVEN) ..
          string.format("~C~I011{~L008~U010~F048~K%03x}"        , KEY_EIGHT) ..
          string.format("~R015~I011{~L008~U010~F049~K%03x}"     , KEY_NINE) ..
          string.format("~U214~L015~I012{~L008~U010~F040~K%03x}", KEY_ZERO) ..
          string.format("~R015~I010{~U010~F04~$1limpa~K%03x}"  ,  KEY_CLEAR)   
          --tsIUTouch.MontaBotoesBarraInferior(tBotoesInferiores)
   
   --LogDebug(sAux, 1, I_LOGDEBUG_TIPO_UI)
  
   
   
   return sAux
end





local function EsperaTecla2(iTimeout)
	--local key = keyboard.getkeystrokenb(iTimeout)
	local key = ui.graphical_getkeystroke(iTimeout)

	if key == nil or key == HF_TIMEOUT_EVENT then
		return -1, HF_TIMEOUT_EVENT
	else
		--0 a 9
		if key >= KEY_ZERO and key <= KEY_NINE then
			key = key - 1 + 0x30	
			LogDebug(key, 1, I_LOGDEBUG_TIPO_UI)
		--proxima
		elseif key == KEY_DOWN then
			key = RCKEY_NEXT
		--anterior
		elseif key == KEY_UP then
			key = RCKEY_PREV
		--clear
		elseif key == KEY_CLEAR then
			key = RCKEY_CLEAR
		--enter
		elseif key == KEY_ENTER or key == PLATF_TECLA_ENTER then
			key = RCKEY_ENTER
		--enter
		elseif key == KEY_CANCEL then
			key = RCKEY_CANCEL
		end
		
		--BeepClick()
		return RET_OK, key 
	end
end


---
-- Espera o teclado. Os botões permitidos são controlados por uma tabela.
--@author Marcelo Tosihiko Sigueoka
--@param tTeclasAtalhoPermitidas Tabela contendo as teclas que a função acatará
--@param iTimeout Timeout da espera por uma tecla, em ms
--@param fSetas Se true, a função aceitará a tecla de seta pra baixo ou seta para cima como entrada
--@return iRet Código de retorno
--@return iIdxSel Código do item selecionado
local function EsperaTecla(tTeclasAtalhoPermitidas, iTimeout, fSetas)
   LogDebug("[sIUTouch] EsperaTecla()", 1, I_LOGDEBUG_TIPO_UI)
   
   local iRet, iTecla = RET_OK, 0
   
   repeat
      iRet, iTecla = EsperaTecla2(iTimeout)
      if (iRet ~= RET_OK) then return iRet, 0 end
      
      LogDebug("[sIUTouch] iTecla = " .. iTecla, 1, I_LOGDEBUG_TIPO_UI)
      
      -- Retorna a tecla mapeada
      if ((tTeclasAtalhoPermitidas) and (tTeclasAtalhoPermitidas[iTecla])) then 
		 LogDebug('atalho permitido', 1, I_LOGDEBUG_TIPO_UI)
		 return RET_OK, tonumber(tTeclasAtalhoPermitidas[iTecla])
      end                        
      if (iTecla == RCKEY_CANCEL) then 
         LogDebug('menu cancelado', 1, I_LOGDEBUG_TIPO_UI)
		 return RET_CANCELADO, 0 
      end      
      
	  if ((fSetas) and ((iTecla == RCKEY_NEXT) or (iTecla == RCKEY_PREV))) then
         LogDebug('teclas ' .. iTecla .. ' ' ..  RCKEY_NEXT .. ' ' .. RCKEY_PREV, 1, I_LOGDEBUG_TIPO_UI)
		 return RET_OK, iTecla
      end
   until nil
   
   return iRet, iTecla
end



---
-- Função que formata uma string de acordo com o tipo de mascara
--@author Sergio Ueno
--@param sDado, string a ser formtada
--@param iMasc, tipo de mascara
--@return RET_OK
--@return sAux dado formatado
local function MascaraDado(sDado, iMasc)
   local k = 0   
   local sAux, sDecimal, sValor = "", "", ""

   -- se não definiu um tipo de mascara retorna o proprio dado
   if (iMasc == 0) then      
      return sDado
   end

   if (iMasc == gtOpcaoMasc.VALOR) then
      sValor = string.gsub(sDado, "[.]", "") -- retira formatação "."

      if (sValor:len() == 1) then
         sAux = "0"
         sDecimal = "0" .. sValor
      elseif(sValor:len() == 2) then
         sAux = "0"
         sDecimal = sValor
      else
         sAux     = string.sub(sValor, 1, -3)  -- atribui do primeiro até os tres últimos dígitos
         sDecimal = string.sub(sValor, -2)     -- atribui os dois últimos dígitos
      end
   else
      sAux = sDado
   end

   while true do  
      if (iMasc == gtOpcaoMasc.IP) then
         sAux, k = string.gsub(sAux, "^(-?%d+)(%d%d%d)", '%1.%2')
      elseif (iMasc == gtOpcaoMasc.VALOR) then
         sAux, k = string.gsub(sAux, "^(-?%d+)(%d%d%d)", '%1.%2')
      elseif (iMasc == gtOpcaoMasc.HORA) then
         sAux, k = string.gsub(sAux, "^(-?%d+)(%d%d)", '%1:%2')
      elseif (iMasc == gtOpcaoMasc.VENC) then
         sDado = string.format("%4.4s", sDado)
         sAux  = string.format("%2.2s/%2.2s", string.sub(sDado, 1, 2), string.sub(sDado,3,4) )
         break
      elseif (iMasc == gtOpcaoMasc.CELULAR) then
         sAux = string.gsub(sAux, "^(..)(.*)$", "(%1)%2")         
         sAux, k = string.gsub(sAux, "^(%b())(%d%d%d%d%d)(%d%d%d%d)$", "%1%2-%3") -- Formata celulares com 9 dígitos
         if (k == 0) then
            sAux = string.gsub(sAux, "^(%b())(%d%d%d%d)(.*)$", "%1%2-%3")
         end
         break
      elseif (iMasc == gtOpcaoMasc.CPF) then
         sDado = string.format("%11.11s", sDado)
         sAux  = string.format("%3.3s.%3.3s.%3.3s-%2.2s", string.sub(sDado, 1, 3), string.sub(sDado,4,6), string.sub(sDado,7,9), string.sub(sDado,10,11) )
         break
      elseif (iMasc == gtOpcaoMasc.CONTACORRENTE) then
         sDado = string.format("%12.12s", sDado)
         sAux  = string.format("%11.11s-%1.1s", string.sub(sDado, 1, 11), string.sub(sDado,12,12))
         break
      elseif (iMasc == gtOpcaoMasc.CEP) then
         sDado = string.format("%8.8s", sDado)
         sAux  = string.format("%5.5s-%3.3s", string.sub(sDado, 1, 5), string.sub(sDado,6,8))
         break
      end
      if (k==0) then
         break
      end
   end
   if (iMasc == gtOpcaoMasc.VALOR) then
      sAux     = sAux .. "," .. sDecimal
   end
   return sAux
end



---
-- Gera pares de botões para a barra inferior
--@author Marcelo Tosihiko Sigueoka
--@param tBotoesInferiores Tabela contendo os botões que deverão ser gerados
--@param fMostraSetas Caso seja true, setas serão montadas posteriormente ao lado do par de botões
--@param tTeclasAtalhoPermitidas Tabela contendo as teclas que a função acatará
--@return sBotoesAcao Par de botões
local function GeraBotoesBarraInferior(tBotoesInferiores, fMostraSetas, tTeclasAtalhoPermitidas)
   local sBotoesAcao = "~D009"
   local fBotaoCancela = true
   local iBotaoEsquerda, iBotaoDireita = -1, -1
   local sPosBotaoEsq, sPosBotaoDir = "~L015", "~R015"
   
   --********************* Botões inferiores ***********************
   if (tBotoesInferiores) then 
      -- Verifica quais botões inferiores devem ser setados
      if ((tBotoesInferiores.fBotaoMenuIni) and (tBotoesInferiores.fBotaoFuncao)) then
         -- "menu inicial" e "função"
         sBotoesAcao = sBotoesAcao ..
                       sPosBotaoEsq .. "~I038{~F04~$1~U001" .. gtMsg.MSGMNU_MENU .. 
                       "~D005" .. gtMsg.MSGMNU_INICIAL .. "~K%03x}" ..  -- Menu Inicial
                       sPosBotaoDir .. "~I004{~F04" .. gtMsg.MSGMNU_FUNCAO .. "~K%03x}"
         
         -- Mapeia os retornos dos botões
         iBotaoEsquerda = PLATF_TECLA_MENU
         iBotaoDireita  = PLATF_TECLA_FUNC         
         fBotaoCancela  = false
      elseif (tBotoesInferiores.fBotaoConfirma) then
         sBotoesAcao = sBotoesAcao .. 
                       sPosBotaoDir .. "~I013{~F04~$1" .. gtMsg.MSGMNU_CONFIRMA .. "~K%03x}" -- Botão "confirma"
         iBotaoDireita = PLATF_TECLA_ENTER

         if (tBotoesInferiores.fBotaoNovoValor) then
            -- Botão "novo valor" cinza
            sBotoesAcao = sBotoesAcao .. 
                          sPosBotaoEsq .. "~I004{~F04" .. gtMsg.MSGMNU_NOVO_VALOR .. "~K%03x}"         
            -- Mapeia os retornos dos botões
            iBotaoEsquerda = RCKEY_CANCEL
            fBotaoCancela  = false      
         end
      elseif ((tBotoesInferiores.fBotaoMenuIni) and (tBotoesInferiores.fBotaoVoltar)) then
         -- "voltar" e "menu inicial"
         if (not (fMostraSetas)) then
            sBotoesAcao = sBotoesAcao ..            
                          sPosBotaoEsq .. "~I004{~L010~I016~R010~F04" .. gtMsg.MSGMNU_VOLTAR .. "~K%03x}" ..     -- Botão "voltar"
                          sPosBotaoDir .. "~I038{~F04~$1~U001" .. gtMsg.MSGMNU_MENU .. 
                          "~D005" .. gtMsg.MSGMNU_INICIAL .. "~K%03x}"    -- Botão "menu inicial"
         else      
            sBotoesAcao = sBotoesAcao ..            
                          sPosBotaoEsq .. "~I006{~U004~I016~D004~F01~$0" .. gtMsg.MSGMNU_VOLTAR .. "~K%03x}" ..  -- Botão "voltar"
                          sPosBotaoDir .. "~I042{~F01~$1~U006" .. gtMsg.MSGMNU_MENU .. 
                          "~D006" .. gtMsg.MSGMNU_INICIAL .. "~K%03x}"     -- Botão "menu inicial"
         end
         
         -- Mapeia os retornos dos botões
         iBotaoEsquerda = PLATF_TECLA_VOLTAR
         iBotaoDireita  = PLATF_TECLA_MENU         
         fBotaoCancela  = false
      elseif ((tBotoesInferiores.fBotaoSim) and (tBotoesInferiores.fBotaoNao)) then
         -- "não" e "sim"
         if (not (fMostraSetas)) then
            sBotoesAcao = sBotoesAcao ..
                          sPosBotaoEsq .. "~I004{~F04~$0" .. gtMsg.MSGMNU_NAO .. "~K%03x}" .. -- Botão "não"
                          sPosBotaoDir .. "~I013{~F04~$1" .. gtMsg.MSGMNU_SIM .. "~K%03x}"    -- Botão "sim"            
         else 
            sBotoesAcao = "~D011" ..                        -- Posição dos botões (DIFERENTE DO PADRÃO!)
                          sPosBotaoEsq .. "~I006{~F01~$0" .. gtMsg.MSGMNU_NAO .. "~K%03x}" .. -- Botão "não"
                          "~L070~I046{~F01~$1" .. gtMsg.MSGMNU_SIM .. "~K%03x}"    -- Botão "sim"                    
         end         
         
         -- Mapeia os retornos dos botões
         iBotaoEsquerda = RCKEY_CANCEL
         iBotaoDireita  = RCKEY_ENTER
         fBotaoCancela  = false         
      elseif (tBotoesInferiores.fBotaoNovaSimul) then
         -- Botão "nova simulação" laranja  
         sBotoesAcao = sBotoesAcao .. 
                       sPosBotaoDir .. "~I013{~F04~$1~D004" .. gtMsg.MSGMNU_NOVA_SIMULACAO .. "~K%03x}"         
         iBotaoDireita  = gtOpcaoMenu.NOVA_SIMUL      -- Mapeia o retorno do botão
      elseif (tBotoesInferiores.fBotaoContratar) then
         sBotoesAcao = sBotoesAcao .. 
                       sPosBotaoDir .. "~I013{~F04~$1" .. gtMsg.MSGMNU_CONTRATACAO .. "~K%03x}"
         iBotaoDireita  = gtOpcaoMenu.CONTRATAR_SIMUL -- Botão "contratar" laranja              
      elseif (tBotoesInferiores.fBotaoOk) then
         sBotoesAcao = sBotoesAcao .. 
                       sPosBotaoDir .. "~I013{~F04~$1" .. gtMsg.MSGMNU_OK .. "~K%03x}"
         iBotaoDireita  = RCKEY_ENTER -- Botão "ok" laranja
         fBotaoCancela  = false         
      elseif ((tBotoesInferiores.fBotaoAgora) and (tBotoesInferiores.fBotaoAgendar)) then
         sBotoesAcao = sBotoesAcao ..
                       sPosBotaoEsq .. "~I004{~F04~$0" .. gtMsg.MSGMNU_AGORA .. "~K%03x}" .. 
                       sPosBotaoDir .. "~I004{~F04~$0" .. gtMsg.MSGMNU_AGENDAR .. "~K%03x}"  
         -- Mapeia os retornos dos botões
         iBotaoEsquerda = KEY_ENTER
         iBotaoDireita  = KEY_CANCEL
         fBotaoCancela  = false      
	   elseif (tBotoesInferiores.fBotaoFuncao) then
			--printer.print("tem botao funcao")
			-- somente botão "função"
			
			sBotoesAcao = sBotoesAcao .. sPosBotaoDir .. "~I004{~F04" .. gtMsg.MSGMNU_FUNCAO .. "~K%03x}"
         
			-- Mapeia os retornos dos botões
			iBotaoEsquerda = PLATF_TECLA_FUNC       
			fBotaoCancela  = false  
		
	  end
   end
   
   --********************* Mapeia e gera os botões e seus retornos ***********************
   if (fBotaoCancela) then
      -- BOTÃO CANCELA -> DEFAULT
      sBotoesAcao = sBotoesAcao .. sPosBotaoEsq .. "~I004{~F04~$0" .. gtMsg.MSGMNU_CANCELA .. "~K%03x}"
      
      if (iBotaoDireita >= 0) then
         sBotoesAcao = string.format(sBotoesAcao, iBotaoDireita, KEY_CANCEL)      
      else
         sBotoesAcao = string.format(sBotoesAcao, KEY_CANCEL)      
      end
   else
      if ((iBotaoEsquerda >= 0) and (iBotaoDireita >= 0)) then
         sBotoesAcao = string.format(sBotoesAcao, iBotaoEsquerda, iBotaoDireita)
      elseif (iBotaoEsquerda >= 0) then
         sBotoesAcao = string.format(sBotoesAcao, iBotaoEsquerda)
      elseif (iBotaoDireita >= 0) then
         sBotoesAcao = string.format(sBotoesAcao, iBotaoDireita)
      end
   end
   
   if (tTeclasAtalhoPermitidas) then
      if ((iBotaoEsquerda >= 0) and (not tTeclasAtalhoPermitidas[iBotaoEsquerda])) then
         tTeclasAtalhoPermitidas[iBotaoEsquerda] = iBotaoEsquerda
      end
      if ((iBotaoDireita >= 0) and (not tTeclasAtalhoPermitidas[iBotaoDireita])) then
         tTeclasAtalhoPermitidas[iBotaoDireita] = iBotaoDireita
      end
   end
   
   return sBotoesAcao
end

---
-- Função para capturar strings numéricas
--@author Marcelo Tosihiko Sigueoka
--@param sMsg Mensagem exibida na primeira linha (Default = "").
--@param iTamMin Tamanho mínimo do valor (Default = 0).
--@param xFormat Tamanho máximo do valor (Se numérico) OU Formato da entrada (Se string - Default = "@@...@@")
--@param iMascara O dado deve ser mascarado (default = 0, sem máscara). Usar ao ler senhas, por exemplo
--@param iAlinhaEsq Alinhado à esquerda (default = 0, alinhado à direita)
--@param sDado Dado capturado (default = vazio)
--@param iTimeout Tempo para coleta do dado default = TEMPO_OPERADOR em ms
--@param fTecladoNumerico Indica se mostra o teclado numérico no display (default = true)
--@param iMasc Indica qual é o tipo de formatação do dado
--@param iTamMax Tamanho máximo do dado
--@param sDsp Dado auxiliar para montagem da tela
--@return iRet Código de retorno
--@return sDado Dado lido
local function RecebeStringNumerica(sMsg, iTamMin, xFormat, iMascara, iAlinhaEsq, sDado, iTimeout, fTecladoNumerico, 
                                    iMasc, iTamMax, sDsp, fFooter)
   local sTela, sDadoLido = "", ""
   local sScript = "~U027~L015~F04%s~U049~R015~F05"
   
   -- Verifica se sDado tem algum valor
   if ( (sDado == nil) or (sDado == "") ) then
      sDado = string.rep(".", iTamMax)
      sDsp  = sDado
      if type(xFormat) == "string" then
         -- Se tipo valor apresenta como "0,00"
         if (iMasc == gtOpcaoMasc.VALOR) then
            sDsp  = "0,00"
            sDado = sDsp
         else
            -- substitui "@" por "."
            sDsp = string.gsub(xFormat, "@", ".")  -- troca @ por "."
         end
      end
      -- formata o script a ser apresentado na tela com sua respectiva mascara
      sTela = string.format(sScript, sMsg) .. sDsp
   else
      -- sDado possui valor
      sDadoLido = Trim(sDado)
      if (iAlinhaEsq == 0) then  -- alinhado a direita
         -- Se é para mascar, substitui sDado por "*"
         if ( (iMascara) and (iMascara > 0) ) then
            sDado = string.rep(".", iTamMax - sDadoLido:len()) .. string.rep("*", sDadoLido:len())
         else
            sDado = string.rep(".", iTamMax - sDadoLido:len()) .. sDadoLido
         end
      end
      -- formata o script a ser apresentado na tela com sua respectiva mascara
      sTela = string.format(sScript, sMsg) .. MascaraDado(sDado, iMasc)

      -- formata com a mascara default
      if (iMasc == gtOpcaoMasc.VALOR) then
         sDsp  = "0,00"
      else
         sDsp = string.gsub(xFormat, "@", ".")  -- troca @ por "."
      end
   end
   
   local sTecladoNumerico = ""
   if (fTecladoNumerico) then
      sTecladoNumerico = TecladoNumerico() -- Monta e armazena o teclado numérico
      sTela = sTela .. sTecladoNumerico
   end
   
   if (fFooter) then
		tBotoesInferiores = {}
		tBotoesInferiores.fBotaoConfirma = true
		tTeclasAtalhoPermitidas = {}
		tTeclasAtalhoPermitidas[RCKEY_ENTER] = RCKEY_ENTER
   
		sTela = sTela .. GeraBotoesBarraInferior(tBotoesInferiores, nil, tTeclasAtalhoPermitidas) 
	end
   
   
   
   -- executa script para atualizar tela
   local iRet = ui.graphical(sTela)
   if (iRet ~= RET_OK) then return iRet, 0 end

   local i = sDadoLido:len()
   local iTecla = 0
   repeat
      LogDebug('esperando tecla...', 1, I_LOGDEBUG_TIPO_UI)
	  iRet, iTecla = EsperaTecla2(iTimeout)
      LogDebug('tecla :' .. tostring(iTecla), 1, I_LOGDEBUG_TIPO_UI)
	  if (iRet ~= RET_OK) then return iRet, 0 end
      
      if (iTecla == RCKEY_CANCEL) then 
         return RET_CANCELADO, 0 
      elseif (iTecla == RCKEY_ENTER) then 
         if (i >= iTamMin) then
            return RET_OK, sDadoLido
         end
      elseif (iTecla == RCKEY_CLEAR) then
         if (i > 0 ) then  --retira o último dado digitado
            sDadoLido = string.sub(sDadoLido, 1, - 2) -- remove o último dígito
            if (iAlinhaEsq == 0) then  -- alinhado a direita
               if (sDadoLido:len() > 0) then
                  sDado     = "." .. string.sub(sDado, 1, -2) -- remove o último dígito
                  LogDebug("[sIUTouch] sDado  (" .. sDado .. ")", 1, I_LOGDEBUG_TIPO_UI)
               else
                  sDado     = string.rep(".", iTamMax)
               end
            else  -- alinhado a esquerda
               sDado = string.sub(sDado, 1, sDadoLido:len()) .. string.rep(".", iTamMax - sDadoLido:len())
               LogDebug("[sIUTouch] sDado ESQ" .. sDado .. ")", 1, I_LOGDEBUG_TIPO_UI)
            end
            i = i - 1
         else
            Beep (BEEP_WARN)
         end
      elseif ( (iTecla >= RCKEY_0) and (iTecla <= RCKEY_9) ) then
         if (i == iTamMax) then
            Beep (BEEP_WARN)
         else
            if ( (iMasc == gtOpcaoMasc.VALOR) and (i == 0) and (iTecla == RCKEY_0) ) then
               -- valor não aceita o primeiro dígito como zero
               Beep (BEEP_WARN)
            else
               i = i + 1
               sDadoLido = sDadoLido .. (iTecla - RCKEY_0 + '0')
			   LogDebug('sDadoLido:' .. sDadoLido, 1, I_LOGDEBUG_TIPO_UI)
               --LogDebug('AQUI A ' .. iTamMax .. ' ' .. sDadoLido:len() .. ' ' .. iAlinhaEsq .. ' ' .. iMascara, 1)
			   if (iAlinhaEsq == 0) then  -- alinhado a direita
                  if (iTamMax > sDadoLido:len()) then
                     
					 sDado     = string.rep(".", iTamMax - sDadoLido:len() - 1) .. 
                                 string.sub(sDado, iTamMax - sDadoLido:len() + 1, iTamMax + sDadoLido:len())
                  else
                     if (iMasc == gtOpcaoMasc.VALOR) then
                        sDado     = string.sub(sDado, 1)
                     else
                        sDado     = string.sub(sDado, 2)
                     end
                  end
               end
               if ( (iMascara) and (iMascara > 0) ) then
                  if (iAlinhaEsq == 0) then  -- alinhado a direita
                     sDado = sDado .. "*"
                  else  -- alinhado a esquerda
                     sDado = "*" .. string.sub(sDado, 1, iTamMax - 1)
                  end
               else
                  if (iAlinhaEsq == 0) then  -- alinhado a direita
                     sDado = sDado .. (iTecla - RCKEY_0 + '0')
                  else  -- alinhado a esquerda
                     sDado = sDadoLido ..  string.rep(".", iTamMax - sDadoLido:len())
					 LogDebug('aqui B', 1, I_LOGDEBUG_TIPO_UI)
                  end
               end
            end
         end
      else
         Beep (BEEP_WARN)
      end

      -- mostra mascara inicial do inicio da chamada da função
      if ( (iMasc ~= 0) and (sDadoLido:len() == 0) )then
         sTela = string.format(sScript, sMsg) .. sDsp
      else
		 sTela = string.format(sScript, sMsg) .. MascaraDado(sDado, iMasc)
      end

      if (fTecladoNumerico) then
         sTela = sTela .. sTecladoNumerico
      end
	  
	  if (fFooter) then
		tBotoesInferiores = {}
		tBotoesInferiores.fBotaoConfirma = true
		tTeclasAtalhoPermitidas = {}
		tTeclasAtalhoPermitidas[RCKEY_ENTER] = RCKEY_ENTER
   
		sTela = sTela .. GeraBotoesBarraInferior(tBotoesInferiores, nil, tTeclasAtalhoPermitidas) 
	  end
   
      
      -- executa script para atualizar tela
      LogDebug(sTela, 1, I_LOGDEBUG_TIPO_UI)
	  iRet = ui.graphical(sTela)
      if (iRet ~= RET_OK) then return iRet, 0 end
   until nil
   
   return iRet, sDado
end





--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------


---
-- Retorna o teclado alfanumérico QWERTY maiúsculo (Layout 1)
--@author Marcelo Tosihiko Sigueoka
--@param iRetFuncao1 Retorno da primeira tecla de função do teclado
--@return tTeclas Tabela contendo as teclas do teclado
local function RetornaTecladoAlfa1(iRetFuncao1)
   local tTeclas = {
      -- 1ª linha de teclas
      string.format("Q~K%03x}", string.byte('Q')),
      string.format("W~K%03x}", string.byte('W')),
      string.format("E~K%03x}", string.byte('E')),
      string.format("R~K%03x}", string.byte('R')),
      string.format("T~K%03x}", string.byte('T')),
      string.format("Y~K%03x}", string.byte('Y')),
      string.format("U~K%03x}", string.byte('U')),
      string.format("I~K%03x}", string.byte('I')),
      string.format("O~K%03x}", string.byte('O')),
      string.format("P~K%03x}", string.byte('P')),
      
      -- 2ª linha de teclas
      string.format("A~K%03x}", string.byte('A')),
      string.format("S~K%03x}", string.byte('S')),
      string.format("D~K%03x}", string.byte('D')),
      string.format("F~K%03x}", string.byte('F')),
      string.format("G~K%03x}", string.byte('G')),
      string.format("H~K%03x}", string.byte('H')),
      string.format("J~K%03x}", string.byte('J')),
      string.format("K~K%03x}", string.byte('K')),
      string.format("L~K%03x}", string.byte('L')),
      
      -- 3ª linha de teclas
      string.format("~I055~K%03x}", iRetFuncao1),  -- Tecla para mudar de teclado
      string.format("Z~K%03x}", string.byte('Z')),
      string.format("X~K%03x}", string.byte('X')),
      string.format("C~K%03x}", string.byte('C')),
      string.format("V~K%03x}", string.byte('V')),
      string.format("B~K%03x}", string.byte('B')),
      string.format("N~K%03x}", string.byte('N')),
      string.format("M~K%03x}", string.byte('M')),         
   }
   
   return tTeclas
end


---
-- Retorna o teclado alfanumérico QWERTY minúsculo (Layout 1)
--@author Marcelo Tosihiko Sigueoka
--@param iRetFuncao1 Retorno da primeira tecla de função do teclado
--@return tTeclas Tabela contendo as teclas do teclado
local function RetornaTecladoAlfa2(iRetFuncao1)
   local tTeclas = {
      -- 1ª linha de teclas
      string.format("q~K%03x}", string.byte('q')),
      string.format("w~K%03x}", string.byte('w')),
      string.format("e~K%03x}", string.byte('e')),
      string.format("r~K%03x}", string.byte('r')),
      string.format("t~K%03x}", string.byte('t')),
      string.format("y~K%03x}", string.byte('y')),
      string.format("u~K%03x}", string.byte('u')),
      string.format("i~K%03x}", string.byte('i')),
      string.format("o~K%03x}", string.byte('o')),
      string.format("p~K%03x}", string.byte('p')),
      
      -- 2ª linha de teclas
      string.format("a~K%03x}", string.byte('a')),
      string.format("s~K%03x}", string.byte('s')),
      string.format("d~K%03x}", string.byte('d')),
      string.format("f~K%03x}", string.byte('f')),
      string.format("g~K%03x}", string.byte('g')),
      string.format("h~K%03x}", string.byte('h')),
      string.format("j~K%03x}", string.byte('j')),
      string.format("k~K%03x}", string.byte('k')),
      string.format("l~K%03x}", string.byte('l')),
      
      -- 3ª linha de teclas
      string.format("~I055~K%03x}", iRetFuncao1),  -- tecla para mudar de teclado
      string.format("z~K%03x}", string.byte('z')),
      string.format("x~K%03x}", string.byte('x')),
      string.format("c~K%03x}", string.byte('c')),
      string.format("v~K%03x}", string.byte('v')),
      string.format("b~K%03x}", string.byte('b')),
      string.format("n~K%03x}", string.byte('n')),
      string.format("m~K%03x}", string.byte('m')),         
   }
   
   return tTeclas
end

---
-- Retorna o teclado alfanumérico de números (Layout 2)
--@author Marcelo Tosihiko Sigueoka
--@param iRetFuncao1 Retorno da primeira tecla de função do teclado
--@return tTeclas Tabela contendo as teclas do teclado
local function RetornaTecladoAlfa3(iRetFuncao1)
   
   local tTeclas = {
      -- 1ª linha de teclas
      string.format("1~K%03x}", string.byte('1')),
      string.format("2~K%03x}", string.byte('2')),
      string.format("3~K%03x}", string.byte('3')),
      string.format("4~K%03x}", string.byte('4')),
      string.format("5~K%03x}", string.byte('5')),
      string.format("6~K%03x}", string.byte('6')),
      string.format("7~K%03x}", string.byte('7')),
      string.format("8~K%03x}", string.byte('8')),
      string.format("9~K%03x}", string.byte('9')),
      string.format("0~K%03x}", string.byte('0')),
      
      -- 2ª linha de teclas
      string.format("-~K%03x}", string.byte('-')),
      string.format("/~K%03x}", string.byte('/')),
      string.format(":~K%03x}", string.byte(':')),
      string.format(";~K%03x}", string.byte(';')),
      string.format("(~K%03x}", string.byte('(')),
      string.format(")~K%03x}", string.byte(')')),
      string.format("$~K%03x}", string.byte('$')),
      string.format("&~K%03x}", string.byte('&')),
      string.format("%s~K%03x}", '"', string.byte('"')),
      
      -- 3ª linha de teclas
      string.format("~F01+~L002#~R002=~K%03x}", iRetFuncao1),  -- Tecla para mudar de teclado
      string.format(",~K%03x}", string.byte(',')),
      string.format("?~K%03x}", string.byte('?')),
      string.format("!~K%03x}", string.byte('!')),
      string.format("_~K%03x}", string.byte('_')),      
      string.format("[~K%03x}", string.byte('[')),
      string.format("]~K%03x}", string.byte(']')),
      string.format(".~K%03x}", string.byte('.')),
   }
   
   return tTeclas
end

---
-- Retorna o teclado alfanumérico de símbolos (Layout 3)
--@author Marcelo Tosihiko Sigueoka
--@param iRetFuncao1 Retorno da primeira tecla de função do teclado
--@return tTeclas Tabela contendo as teclas do teclado
local function RetornaTecladoAlfa4(iRetFuncao1)
   
   local tTeclas = {      
       -- 1ª linha de teclas
      string.format("~{~K%03x}", string.byte('{')),
      string.format("~}~K%03x}", string.byte('}')),
      string.format("#~K%03x}", string.byte('#')),
      string.format("%%~K%03x}", string.byte('%')),
      string.format("^~K%03x}", string.byte('^')),
      string.format("*~K%03x}", string.byte('*')),
      string.format("+~K%03x}", string.byte('+')),
      string.format("=~K%03x}", string.byte('=')),
      string.format("_~K%03x}", string.byte('_')),
      string.format("|~K%03x}", string.byte('|')),
      
      -- 2ª linha de teclas
      string.format("~F01123~K%03x}", iRetFuncao1),  -- Tecla para mudar de teclado
      string.format("\\~K%03x}", string.byte("\\")),
      string.format("~~~K%03x}", string.byte('~')),
      string.format("<~K%03x}", string.byte('<')),
      string.format(">~K%03x}", string.byte('>')),
      string.format("?~K%03x}", string.byte('?')),
      string.format("!~K%03x}", string.byte('!')),
      string.format("%s~K%03x}", '"', string.byte('"')),
      string.format("~I056~K%03x}", PLATF_TECLA_LIMPA), -- Tecla limpa fica na segunda linha
   }
   
   return tTeclas
end

---
-- Retorna o teclado alfanumérico de acordo com o índice
--@author Marcelo Tosihiko Sigueoka
--@param iIdxTeclado Código de identificação do teclado
--@param iRetFuncao1 Retorno da primeira tecla de função do teclado
--@return tTeclas Tabela contendo as teclas do teclado
local function RetornaTeclasAlfa(iIdxTeclado, iRetFuncao1)
   if (iIdxTeclado == gtTecladoAlfa.QWERTY) then
      return RetornaTecladoAlfa1(iRetFuncao1)
   elseif (iIdxTeclado == gtTecladoAlfa.QWERTY_MIN) then   
      return RetornaTecladoAlfa2(iRetFuncao1)
   elseif (iIdxTeclado == gtTecladoAlfa.NUMEROS) then
      return RetornaTecladoAlfa3(iRetFuncao1)
   end
   
   return RetornaTecladoAlfa4(iRetFuncao1)
end



---
-- Exibe o teclado alfa
--@author Sérgio Ueno
--@param iIdxTeclado Código de identificação do teclado
--@param tTecladoQWERTY Tabela que identifica quais são os teclados "QWERTY"
--@param iRetFuncao1 Retorno da primeira tecla de função do teclado
--@param iRetFuncao2 Retorno da segunda tecla de função do teclado
--@param iRetPontoCom Retorno da tecla ".com"
--@return sTeclado mensagem do teclado alfa
local function TecladoAlfa(iIdxTeclado, tTecladoQWERTY, iRetFuncao1, iRetFuncao2, iRetPontoCom)
   local sImgFonte = "~I051{~F03"
   
   local tTeclas = RetornaTeclasAlfa(iIdxTeclado, iRetFuncao1)
   
   local sBotaoFuncao2 = ""
   if (tTecladoQWERTY[iIdxTeclado]) then
      sBotaoFuncao2 = "~F01123"
   else
      sBotaoFuncao2 = "~L002~I062"
   end   
   
   -- Monta o teclado
   local sTeclado =
         "~U080" ..
         "~L006" .. sImgFonte .. tTeclas[1] ..
         "~L037" .. sImgFonte .. tTeclas[2] ..
         "~L068" .. sImgFonte .. tTeclas[3] ..
         "~L099" .. sImgFonte .. tTeclas[4] ..
         "~L130" .. sImgFonte .. tTeclas[5] ..
         "~L161" .. sImgFonte .. tTeclas[6] ..
         "~L192" .. sImgFonte .. tTeclas[7] ..
         "~L223" .. sImgFonte .. tTeclas[8] ..
         "~L254" .. sImgFonte .. tTeclas[9] ..
         "~L285" .. sImgFonte .. tTeclas[10] ..

         "~U120" ..
         "~L021" .. sImgFonte .. tTeclas[11] ..
         "~L052" .. sImgFonte .. tTeclas[12] ..
         "~L083" .. sImgFonte .. tTeclas[13] ..
         "~L114" .. sImgFonte .. tTeclas[14] ..
         "~L145" .. sImgFonte .. tTeclas[15] ..
         "~L176" .. sImgFonte .. tTeclas[16] ..
         "~L207" .. sImgFonte .. tTeclas[17] ..
         "~L238" .. sImgFonte .. tTeclas[18] ..
         "~L269" .. sImgFonte .. tTeclas[19] ..

         "~U200" ..
         string.format("~L006~I051{" .. sBotaoFuncao2 .. "~K%03x}", iRetFuncao2) ..  -- Botão para alterar de teclado
         string.format("~L037~I053{~F01espaço~K%03x}",    string.byte(' ')) ..
         string.format("~L092~I051{~F03@~K%03x}",         string.byte('@')) ..
         string.format("~L123~I051{~F03.~K%03x}",         string.byte('.')) ..
         string.format("~L154~I051{~L001~F06.com~K%03x}", iRetPontoCom) ..
         string.format("~L185~I054{~D005~I061~K%03x}",    RCKEY_CANCEL) ..
         string.format("~L233~I054{~D005~I060~K%03x}",    PLATF_TECLA_VOLTAR) ..
         string.format("~L281~I052{~F03~$1ok~K%03x}",     RCKEY_ENTER)
   
   -- Verifica se possui a 3ª linha de teclas
   if (tTeclas[20]) then
      sTeclado = sTeclado ..
                 "~U160" ..
                 "~L021" .. sImgFonte .. tTeclas[20] ..
                 "~L052" .. sImgFonte .. tTeclas[21] ..
                 "~L083" .. sImgFonte .. tTeclas[22] ..
                 "~L114" .. sImgFonte .. tTeclas[23] ..
                 "~L145" .. sImgFonte .. tTeclas[24] ..
                 "~L176" .. sImgFonte .. tTeclas[25] ..
                 "~L207" .. sImgFonte .. tTeclas[26] ..
                 "~L238" .. sImgFonte .. tTeclas[27] ..
                 string.format("~L269" ..  sImgFonte .. "~I056~K%03x}", PLATF_TECLA_LIMPA)
   end 
   
   return sTeclado
end



---
-- Função para montar o dado exibido na tela de teclado alfanumérico
--@author Marcelo Tosihiko Sigueoka
--@param sFormato Formatação da tela
--@param tParam Tabela contendo os parâmetros para montagem da tela
--@param tCaractEspeciais Tabela que contém os caracteres que devem ser tratados para serem exibidos na tela
--@param fRolagEsq True, caso o dado deva ser rolado para a esquerda
--@param fRolagDir True, caso o dado deva ser rolado para a direita
--@return sDadoExibido Dado a ser exibido na tela
local function MontaDadoExibido(sFormato, tParam, tCaractEspeciais, fRolagEsq, fRolagDir)
   
   local sDadoExibido = tParam.sDadoFormat
   
   if ((tParam.iLarguraDado ~= nil) and(tParam.iLarguraDado <= tParam.iLarguraMaxDados)) then
      tParam.sPosicaoDado = "~L000"   
   else
      if (fRolagDir) then          
         LogDebug("[sIUTouch] fRolagDir = true",1, I_LOGDEBUG_TIPO_UI)
         sDadoExibido = RolagemDadoDireita(tParam, tCaractEspeciais)         
      elseif (fRolagEsq) then
         LogDebug("[sIUTouch] fRolagEsq = true", 1, I_LOGDEBUG_TIPO_UI)
         sDadoExibido = RolagemDadoEsquerda(tParam, tCaractEspeciais)
      else
         -- Posiciona o último caractere do lado direito (string é maior do que a caixa de dados)
         --tParam.sPosicaoDado = "~R000"
		 
		 -- TODO: alterei para esquerda pq a funcao de get tam da string não esta funcionando
		 tParam.sPosicaoDado = "~L000"
      end      
   end
   
   -- Formata a string para ser exibida dentro da caixa de texto
   return string.format(sFormato, tParam.sPosicaoDado .. sDadoExibido)   
end


---
-- Verifica se o caractere capturado pelo teclado alfanumérico é permitido
--@author Marcelo Tosihiko Sigueoka
--@param iTecla Tecla capturada
--@param tParam Tabela contendo os parâmetros para montagem da tela
--@return fPermitido True, caso o caractere seja permitido, False, caso contrário
local function CaracterePermitido(iTecla, tParam)
   if (iTecla == tParam.iRetPontoCom) then
      -- Verifica se deve permitir a tecla ".com"
      if (tParam.iCaracPermit == gtTeclCaract.MAIUSC_NUM) then
         return false
      end
      
      return true
   end 
   
   if (tParam.iCaracPermit == gtTeclCaract.MAIUSC_NUM) then
      -- Só permite letras maiúsculas e números      
      if (((iTecla >= 48) and (iTecla <= 57)) or       -- '0' a '9' 
          ((iTecla >= 65) and (iTecla <= 90))) then    -- 'A' a 'Z'
         return true 
      end
   elseif ((iTecla >= 32) and (iTecla <= 126)) then
      -- 32 = 0x20 e 126 = 0x7E
      return true
   end
   
   return false
end


---
-- Adiciona um caractere ao buffer de dado lido
--@author Marcelo Tosihiko Sigueoka
--@param sString Caractere OU String a ser adicionado ao dado lido
--@param tParam Tabela contendo os parâmetros do dado coletado
--@param tCaractEspeciais Tabela contendo os caracteres especiais
--@return não há
local function AdicionaCaractereDadoLido(sString, tParam, tCaractEspeciais)   
   LogDebug("[sIUTouch] AdicionaCaractereDadoLido()", 1, I_LOGDEBUG_TIPO_UI)
   
   tParam.sDado = tParam.sDado .. sString
   
   -- Calcula o novo tamanho da string total
   local iRet, iTamanho = RecuperaTamanhoString(sString, tParam.sFonteDado)
   if (iRet == RET_OK) then
      tParam.iLarguraDado = tParam.iLarguraDado + iTamanho
      LogDebug("[sIUTouch] Larguras simbolo = " .. iTamanho .. " total = " .. tParam.iLarguraDado, 1, I_LOGDEBUG_TIPO_UI)
   end  
   
   -- Processa a string para que ela possa ser exibida na tela
   local iStrLen = sString:len()
   if (tParam.iMascara == 1) then      
      sString = string.rep("*", iStrLen)
   end
   
   if ((iStrLen == 1) and (tCaractEspeciais[sString])) then
      -- Adiciona "~" antes dos caracteres especiais para o dado a ser exibido
      sString = "~" .. sString
   end
   
   tParam.sDadoFormat   = tParam.sDadoFormat .. sString
   tParam.iQtdeCarDig   = tParam.iQtdeCarDig + iStrLen
   tParam.iCursor       = tParam.iQtdeCarDig
   tParam.iCursorFormat = tParam.sDadoFormat:len()
end

---
-- Remove um caractere do buffer de dado lido
--@author Marcelo Tosihiko Sigueoka
--@param tParam Tabela contendo os parâmetros do dado coletado
--@param tCaractEspeciais Tabela contendo os caracteres especiais
--@return não há
local function RemoveCaractereDadoLido(tParam, tCaractEspeciais)
   LogDebug("[sIUTouch] RemoveCaractereDadoLido()", 1, I_LOGDEBUG_TIPO_UI)
   
   local sChar = string.sub(tParam.sDado, -1, -1)
   
   local iRet, iTamanho = RecuperaTamanhoString(sChar, tParam.sFonteDado)
   if (iRet == RET_OK) then
      tParam.iLarguraDado = tParam.iLarguraDado - iTamanho
      tsBas.LogDebug("[sIUTouch] Larguras simbolo = " .. iTamanho .. " total = " .. tParam.iLarguraDado, 1, I_LOGDEBUG_TIPO_UI)
   end 
   
   -- Verifica se o caractere a ser removido é um dos caracteres especiais
   if (tCaractEspeciais[sChar]) then
      tParam.sDadoFormat = string.sub(tParam.sDadoFormat, 1, -3) -- remove o caractere mais o "~" que o precede
   else
      tParam.sDadoFormat = string.sub(tParam.sDadoFormat, 1, -2)   
   end
   
   tParam.sDado         = string.sub(tParam.sDado, 1, - 2) -- remove o último dígito
   tParam.iQtdeCarDig   = tParam.iQtdeCarDig - 1
   tParam.iCursor       = tParam.iQtdeCarDig
   tParam.iCursorFormat = tParam.sDadoFormat:len()
end 


---
-- Função para capturar strings alfanuméricas
--@author Marcelo Tosihiko Sigueoka
--@param sFormato Formatação da tela
--@param tParam Tabela contendo os parâmetros para montagem da tela
--@param tTeclados Tabela contendo os teclados alfanúmericos
--@param tTecladoQWERTY Tabela que define quais são os teclados do tipo QWERTY (maiúscula e minúscula)
--@param tCaractEspeciais Tabela que contém os caracteres que devem ser tratados para serem exibidos na tela
--@return iRet Código de retorno
--@return sDado Dado lido
local function ExecutaTelaAlfaNumerica(sFormato, tParam, tTeclados, tTecladoQWERTY, tCaractEspeciais)
   local iRet, iTecla, iTecladoSelecionado = RET_OK, 0, gtTecladoAlfa.QWERTY
   local sTela, sDadoExibido, sStr = "", "", ""
   local fShift, fAtualizaDado = true, true  -- Letras maiúsculas por default
   local fAdicionaCaract, fRolagEsq, fRolagDir, fErro = false, false, false, false
   
   -- Monta barra de status horizontal
   MontaBarraStatus(true)
   repeat      
      if (fAtualizaDado) then
         sDadoExibido = MontaDadoExibido(sFormato, tParam, tCaractEspeciais, fRolagEsq, fRolagDir)
      end
      
      if (not fErro) then
         -- Atualiza a tela apenas se não ocorreu algum erro
         sTela = sDadoExibido .. tTeclados[iTecladoSelecionado]
      
         iRet = GeraTelaScript(sTela)
         if (iRet ~= RET_OK) then return iRet, 0 end
      end
   
      iRet, iTecla = EsperaTecla2(tParam.iTimeout)
      if (iRet ~= RET_OK) then return iRet, 0 end
      
      LogDebug("[sIUTouch] iTecla = " .. iTecla, 1, I_LOGDEBUG_TIPO_UI)
      
      -- Reseta as flags de controle
      fAtualizaDado   = true
      fAdicionaCaract = false
      fRolagEsq       = false
      fRolagDir       = false
      fErro           = false
      
      if (iTecla == RCKEY_CANCEL) then 
         return RET_CANCELADO, 0 
      elseif (iTecla == RCKEY_ENTER) then
         if (tParam.iQtdeCarDig >= tParam.iTamMin) then
            return RET_OK, tParam.sDado
         else
            fErro = true
         end 
      elseif (iTecla == RCKEY_CLEAR) then
         if (tParam.iQtdeCarDig > 0 ) then  --retira o último dado digitado
            RemoveCaractereDadoLido(tParam, tCaractEspeciais)
         else
            fErro = true
         end      
      elseif ((iTecla == tParam.iRetPontoCom) and 
              (CaracterePermitido(iTecla, tParam))) then   
         -- ".com"
         if ((tParam.iQtdeCarDig + 4) <= tParam.iTamMax) then
            if (fShift) then
               sStr = ".COM"
            else
               sStr = ".com"
            end
            AdicionaCaractereDadoLido(sStr, tParam, tCaractEspeciais)  
         else
            fErro = true
         end
      elseif (iTecla == tParam.iRetFuncao1) then
         fAtualizaDado = false
         
         if (tTecladoQWERTY[iTecladoSelecionado]) then
            -- Alterna entra teclado maiúsculo e minúsculo
            if (fShift) then
               fShift = false
               iTecladoSelecionado = gtTecladoAlfa.QWERTY_MIN
            else
               fShift = true
               iTecladoSelecionado = gtTecladoAlfa.QWERTY
            end
         else
            fShift = true
            if (iTecladoSelecionado == gtTecladoAlfa.NUMEROS) then
               iTecladoSelecionado = gtTecladoAlfa.SIMBOLOS
            elseif (iTecladoSelecionado == gtTecladoAlfa.SIMBOLOS) then
               iTecladoSelecionado = gtTecladoAlfa.NUMEROS
            end
         end
      elseif (iTecla == tParam.iRetFuncao2) then
         fAtualizaDado = false
         fShift = true
         
         if (tTecladoQWERTY[iTecladoSelecionado]) then
            iTecladoSelecionado = gtTecladoAlfa.NUMEROS   
         else
            iTecladoSelecionado = gtTecladoAlfa.QWERTY
         end
      elseif ((iTecla == tParam.iTeclaRlgEsq) or (iTecla == tParam.iTeclaRlgDir)) then
         if (tParam.iLarguraDado > tParam.iLarguraMaxDados) then
            if (iTecla == tParam.iTeclaRlgEsq) then
               fRolagEsq = true
            else
               if (tParam.iCursor == tParam.iQtdeCarDig) then
                  fErro = true
               else
                  fRolagDir = true
               end
            end
         else            
            fErro = true
         end      
      elseif (CaracterePermitido(iTecla, tParam)) then
         fAdicionaCaract = true
      else
         fErro = true
      end
      
      if (fAdicionaCaract) then
         if (tParam.iQtdeCarDig == tParam.iTamMax) then
            fErro = true
         else
            -- Adiciona o caractere lido à string
            AdicionaCaractereDadoLido(string.char(iTecla), tParam, tCaractEspeciais)
         end
      end
      
      if (fErro) then
         -- Se ocorreu algum erro, o dado exibido permanece do jeito que estava sendo exibido
         Beep (BEEP_WARN)
         fAtualizaDado = false
      end
      
      LogDebug("[sIUTouch] iQtdeCarDig = " .. tParam.iQtdeCarDig,1, I_LOGDEBUG_TIPO_UI)
   until nil
   
   return iRet, tParam.sDado
end



local function ProcessaDadoExibido(tParam, tCaractEspeciais)
   local sChar = ""
   local sDado = tParam.sDado
   
   -- Verifica caractere a caractere se a string possui um caractere especial
   for iIdx = sDado:len(), 1, -1 do   
      sChar = string.sub(sDado, iIdx, iIdx)
      if (tCaractEspeciais[sChar]) then         
         sDado = string.sub(sDado, 1, (iIdx - 1)) .. "~" .. string.sub(sDado, iIdx)      
      end
   end
   
   tParam.sDadoFormat = sDado
end

---
-- Função que processa a rolagem do dado para a direita
--@author Marcelo Tosihiko Sigueoka
--@param tParam Tabela contendo os parâmetros para montagem da tela
--@param tCaractEspeciais Tabela que contém os caracteres que devem ser tratados para serem exibidos na tela
--@return sDadoExibido Dado a ser exibido na tela
local function RolagemDadoDireita(tParam, tCaractEspeciais)
   LogDebug("[sIUTouch] RolagemDadoDireita()", 1, I_LOGDEBUG_TIPO_UI)
  
   tParam.sPosicaoDado = "~R000" -- Posiciona sempre pelo último caractere da direita a ser exibido
   tParam.iCursor = tParam.iCursor + 1
   
   -- Verifica se o caractere a ser exibido é um dos especiais   
   if (tCaractEspeciais[string.sub(tParam.sDado, tParam.iCursor, tParam.iCursor)]) then
      tParam.iCursorFormat = tParam.iCursorFormat + 2
   else
      tParam.iCursorFormat = tParam.iCursorFormat + 1                  
   end
   
   LogDebug("[sIUTouch] iCursor = " .. tParam.iCursor, 1, I_LOGDEBUG_TIPO_UI)
   LogDebug("[sIUTouch] iCursorFormat = " .. tParam.iCursorFormat, 1, I_LOGDEBUG_TIPO_UI)
   
   -- Dado a ser exibido
   return string.sub(tParam.sDadoFormat, 1, tParam.iCursorFormat)  
end


---
-- Recupera a largura de uma string
--@author Marcelo Tosihiko Sigueoka
--@param sSimbolos String cuja largura vai ser medida
--@param sFonte Fonte utilizada ("~Fxx")
--@return iRet Código de retorno
--@return iTamanho Largura da(s) string(s)
function RecuperaTamanhoString(sSimbolos, sFonte)
   LogDebug("[sIU] tsIU.RecuperaTamanhoString()", 1, I_LOGDEBUG_TIPO_UI)
   
   -- Chama módulo externo e retorna
   local iTamanho = 0
   local iRet, iTamanho = ui.graphical_str_size(sSimbolos, sFonte)  
   return iRet, iTamanho
end


---
-- Função que processa a rolagem do dado para a direita
--@author Marcelo Tosihiko Sigueoka
--@param tParam Tabela contendo os parâmetros para montagem da tela
--@param tCaractEspeciais Tabela que contém os caracteres que devem ser tratados para serem exibidos na tela
--@return sDadoExibido Dado a ser exibido na tela
local function RolagemDadoEsquerda(tParam, tCaractEspeciais)
   LogDebug("[sIUTouch] RolagemDadoEsquerda()", 1, I_LOGDEBUG_TIPO_UI)
  
   local iCursor = tParam.iCursor
   local sDadoExibido = tParam.sDadoFormat
   local fAtualizaCursor, fAtualizaDado = false, false
   
   -- Rolagem para a esquerda         
   iCursor = iCursor - 1
   
   local iRet, iTamanho = RecuperaTamanhoString(string.sub(tParam.sDado, 1, iCursor), tParam.sFonteDado)
   if (iRet ~= RET_OK) then 
      return sDadoExibido
   end
    
   if (iTamanho >= tParam.iLarguraMaxDados) then
      -- Posiciona o último caractere do lado direito (string é maior do que a caixa de dados)
      tParam.sPosicaoDado = "~R000"
      fAtualizaCursor = true
      fAtualizaDado   = true 
   else      
      -- O tamanho é menor do que o da caixa de textos
      if (tParam.sPosicaoDado == "~R000") then
         fAtualizaCursor = true
      end
      
      tParam.sPosicaoDado = "~L000" --> Exibe a tela a partir do primeiro caractere, alinhado à esquerda
   end
   
   if (fAtualizaCursor) then
      -- Verifica se o caractere a ser removido é um dos caracteres especiais
      if (tCaractEspeciais[string.sub(tParam.sDado, tParam.iCursor, tParam.iCursor)]) then
         -- remove o caractere mais o "~" que o precede
         tParam.iCursorFormat = tParam.iCursorFormat - 2                
      else
         tParam.iCursorFormat = tParam.iCursorFormat - 1               
      end
      
      tParam.iCursor = iCursor -- Atualiza o cursor
   end
   
   if (fAtualizaDado) then
      sDadoExibido = string.sub(tParam.sDadoFormat, 1, tParam.iCursorFormat)
   end
   
   LogDebug("[sIUTouch] iCursor = " .. tParam.iCursor, 1, I_LOGDEBUG_TIPO_UI)
   LogDebug("[sIUTouch] iCursorFormat = " .. tParam.iCursorFormat, 1, I_LOGDEBUG_TIPO_UI)
   
   return sDadoExibido
end


---
-- Função para capturar strings alfanuméricas
--@author Marcelo Tosihiko Sigueoka
--@param sPrompt Mensagem a ser apresentada na tela
--@param iTamMin Tamanho mínimo permitido para o dado
--@param iTamMax Tamanho máximo permitido para o dado
--@param iTimeout Timeout da tela
--@param iMascara O dado deve ser mascarado (default = 0, sem máscara). Usar ao ler senhas, por exemplo
--@param sDadoDefault Dado atual
--@param iCaracPermit Caracteres permitidos para a captura
--@return iRet Código de retorno
--@return sDado Dado lido
local function RecebeStringAlfaNumerica(sPrompt, iTamMin, iTamMax, iTimeout, iMascara, sDadoDefault, iCaracPermit)
   LogDebug("[sIUTouch] RecebeStringAlfaNumerica()", 1, I_LOGDEBUG_TIPO_UI)
   
   -- Cria tabela de parâmetros com variáveis de controle da tela
   local tParam = {}
   tParam.sDado         = ""                  -- Dado "puro"
   tParam.sDadoFormat   = ""                  -- Dado processado de forma a poder ser exibido na tela
   tParam.sPosicaoDado  = "~L000"             -- Posição do dado dentro da caixa de textos
   tParam.sFonteDado    = "~F01"              -- Fonte utilizada para o dado
   tParam.iQtdeCarDig   = ""                  -- Quantidade de caracteres do dado
   tParam.iMascara      = 0                   -- 1, caso o dado deva ser mascarado
   tParam.iCursor       = 0                   -- Cursor, indica qual é o último símbolo que está sendo exibido na tela
   tParam.iCursorFormat = 0                   -- Cursor do dado formatado, usado para se exibir na tela
   tParam.iTamMin       = iTamMin             -- Tamanho mínimo dos dados   
   tParam.iTamMax       = iTamMax             -- Tamanho máximo dos dados
   tParam.iTimeout      = iTimeout
   tParam.iLarguraDado  = 0                   -- Largura atual da string de dados, em pixels
   tParam.iLarguraMaxDados = 290              -- largura máxima dos dados, em pixels
   tParam.iTeclaRlgEsq  = RCKEY_O4            -- Tecla para rolagem de dados esquerda
   tParam.iTeclaRlgDir  = RCKEY_O5            -- Tecla para rolagem de dados direita
   tParam.iRetPontoCom  = RCKEY_O6            -- Tecla ".com"
   tParam.iRetFuncao1   = RCKEY_O7            -- "função" da 3ª linha de teclas (shift, símbolos e números)
   tParam.iRetFuncao2   = RCKEY_O8            -- "função" da 4ª linha de teclas (letra ou números)   
   tParam.iCaracPermit  = iCaracPermit or 0   -- Identifica quais são os caracteres permitidos
   
   -- Teclados QWERTY
   local tTecladoQWERTY = {
      [gtTecladoAlfa.QWERTY]     = true,
      [gtTecladoAlfa.QWERTY_MIN] = true, 
   }
   
   -- Monta e armazena todos os tipos de teclado
   local tTeclados = {}
   tTeclados[gtTecladoAlfa.QWERTY]     = TecladoAlfa(gtTecladoAlfa.QWERTY    , tTecladoQWERTY, tParam.iRetFuncao1, tParam.iRetFuncao2, tParam.iRetPontoCom)
   tTeclados[gtTecladoAlfa.QWERTY_MIN] = TecladoAlfa(gtTecladoAlfa.QWERTY_MIN, tTecladoQWERTY, tParam.iRetFuncao1, tParam.iRetFuncao2, tParam.iRetPontoCom)
   tTeclados[gtTecladoAlfa.NUMEROS]    = TecladoAlfa(gtTecladoAlfa.NUMEROS   , tTecladoQWERTY, tParam.iRetFuncao1, tParam.iRetFuncao2, tParam.iRetPontoCom)
   tTeclados[gtTecladoAlfa.SIMBOLOS]   = TecladoAlfa(gtTecladoAlfa.SIMBOLOS  , tTecladoQWERTY, tParam.iRetFuncao1, tParam.iRetFuncao2, tParam.iRetPontoCom)
   
   -- Inicializa as variáveis
   local sFormato = "~B097" ..                                                         -- Fundo horizontal
                    "~U030~L015~F01" .. sPrompt ..                    
                    string.format("~R040~I050{~I058~K%03x}", tParam.iTeclaRlgEsq) ..   -- Tecla de rolagem para a direita (não tem tratamento!)
                    string.format("~R010~I050{~I059~K%03x}", tParam.iTeclaRlgDir) ..   -- Tecla de rolagem para a esquerda (não tem tratamento!)
                    "~U055~L015" ..
                    string.format("~#FFFFFF%03d020{", tParam.iLarguraMaxDados) .. 
                                  tParam.sFonteDado .. "%s}" ..                        -- Caixa de entrada de dados                     
                    string.format("~U074~L015~#545454%03d001", tParam.iLarguraMaxDados)
   
   if (sDadoDefault == nil) then
      sDadoDefault = ""         
   else      
      sDadoDefault = Trim(sDadoDefault)
      local iRet = RET_OK
      iRet, tParam.iLarguraDado = RecuperaTamanhoString(sDadoDefault, tParam.sFonteDado) -- Verifica a largura atual do dado
      --[[if (iRet ~= RET_OK) then  
		printer.print("PARAM INVALIDO ---- " .. sDadoDefault)
         return RET_PARAM_INVALIDO, nil
      end--]]
   end
   
   tParam.sDado       = sDadoDefault
   tParam.iQtdeCarDig = sDadoDefault:len()
   tParam.iCursor     = tParam.iQtdeCarDig
   
   LogDebug("[sIUTouch] sDadoDefault = " .. sDadoDefault,1, I_LOGDEBUG_TIPO_UI)
   
   -- Monta a tabela que define quais são os caracteres que merecem tratamento especial para serem exibidos na tela
   local tCaractEspeciais = {
      ["{"] = true, 
      ["}"] = true, 
      ["~"] = true,
   }
   
   -- Verifica se o dado deve ou não ser exibido
   if ((iMascara) and (iMascara == 1)) then
      tParam.iMascara = 1
      tParam.sDadoFormat = string.rep("*", tParam.iQtdeCarDig)
   else
      tParam.iMascara = 0
      ProcessaDadoExibido(tParam, tCaractEspeciais)
   end
   
   tParam.iCursorFormat = tParam.sDadoFormat:len()
   
   local iRet, sDado = ExecutaTelaAlfaNumerica(sFormato, tParam, tTeclados, tTecladoQWERTY, tCaractEspeciais)
   MontaBarraStatus(false) -- Atualiza a barra de Status para o formato vertical antes de retornar desta tela
   return iRet, sDado
end

---
-- Lê um valor do teclado.
--@author Marcelo Tosihiko Sigueoka
--@param sMsg Mensagem exibida na primeira linha (Default = "").
--@param iTamMin Tamanho mínimo do valor (Default = 0).
--@param xFormat Tamanho máximo do valor (Se numérico) OU Formato da entrada (Se string - Default = "@@...@@")
--@param iMascara O dado deve ser mascarado (default = 0, sem máscara). Usar ao ler senhas, por exemplo
--@param iAlfa Aceita dados não numéricos (default = 0, só números)
--@param iAlinhaEsq Alinhado à esquerda (default = 0, alinhado à direita)
--@param sDado Dado capturado (default = vazio)
--@param iSemPontos Indica se mostra pontinhos na área da entrada do dado (default = 0, mostra pontinhos)
--@param iLimpaTela Indica se a tela deve ser apagada antes de apresentar o prompt (default = 1, apaga)
--@param iLinha Número da linha onde deve ser apresentado o prompt (default = 1)
--@param iTimeout Tempo para coleta do dado default = TEMPO_OPERADOR em ms
--@param iLinhaInput Define a linha para a captura do valor
--@param fTecladoNumerico Indica se mostra o teclado numérico no display (default = true)
--@param iCaracPermit Caracteres permitidos para a captura
--@return iRet Código de retorno
--@return sDado Dado lido
local function RecebeStringTouch (sMsg, iTamMin, xFormat, iMascara, iAlfa, 
                            iAlinhaEsq, sDado, iSemPontos, iLimpaTela,
                            iLinha, iTimeout, iLinhaInput, fTecladoNumerico, iCaracPermit, fFooter)
   local sDsp = ""
   local iTamMax, iMasc = 0, 0
   
   -- Inicializa variáveis
   if type(xFormat) == "number" then
      iTamMax = xFormat
   else
      sDsp = xFormat
      if (xFormat == "@@@.@@@.@@@.@@@") then
         iMasc   = gtOpcaoMasc.IP
         iTamMax = 12
      elseif (xFormat == "@.@@@.@@@.@@*,**") then
         iMasc   = gtOpcaoMasc.VALOR
         iTamMax = 12
      elseif (xFormat == "@.@@@.@@*,**") then
         iMasc   = gtOpcaoMasc.VALOR
         iTamMax = 9
      elseif (xFormat == "@@.@@*,**") then
         iMasc   = gtOpcaoMasc.VALOR
         iTamMax = 7   
      elseif (xFormat == "@@:@@") then
         iMasc   = gtOpcaoMasc.HORA
         iTamMax = 4
      elseif (xFormat == "@@/@@") then
         iMasc   = gtOpcaoMasc.VENC
         iTamMax = 4
      elseif (xFormat == "(@@)@@@@@@@@@") then
         iMasc   = gtOpcaoMasc.CELULAR
         iTamMax = 11
      elseif (xFormat == "@@@.@@@.@@@-@@") then
         iMasc   = gtOpcaoMasc.CPF
         iTamMax = 11
      elseif (xFormat == "@@@@@@@@@@@-@") then
         iMasc   = gtOpcaoMasc.CONTACORRENTE
         iTamMax = 12
      elseif (xFormat == "@@@@@-@@@") then
         iMasc   = gtOpcaoMasc.CEP
         iTamMax = 8
      else
         iTamMax = xFormat:len()
         sDsp = ""
      end
   end
   
   if (iTamMin == nil) then
      iTamMin = 0
   end

   if (fTecladoNumerico == nil) then
      fTecladoNumerico = true
   end

   -- Verifica tamanho minimo e maximo
   if ( (iTamMax < 1) or (iTamMin < 0) or (iTamMin > iTamMax) ) then
      return RCRET_INVPARAM;
   end

   if (iAlinhaEsq == nil) then
      iAlinhaEsq = 0 -- default é alinhado à direita
   end

   if (iTimeout == nil) then
      iTimeout = TEMPO_OPERADOR
   end

   if (iAlfa == nil) then
      iAlfa = 0
   end
   
   local iRet = RET_OK
   if (iAlfa > 0) then
      iRet, sDado = RecebeStringAlfaNumerica(sMsg, iTamMin, iTamMax, iTimeout, iMascara, sDado, iCaracPermit)
   else   
      -- Recebe string numérica
      iRet, sDado = RecebeStringNumerica(sMsg, iTamMin, xFormat, iMascara, 
                                        iAlinhaEsq, sDado, iTimeout, fTecladoNumerico, iMasc, iTamMax, sDsp, fFooter)
   end
   
   return iRet, sDado
end


function graph.RecebeString (sTitulo, sPrompt, iTamMin, xFormat, iMascara, iAlfa, 
                            iAlinhaEsq, sDado, iSemPontos, iLimpaTela,
                            iLinha, iTimeout, iLinhaInput, fTecladoNumerico, iCaracPermit,
							fFooter)
   
   MontaBarraStatus(false)
   
   local iRet = RET_OK
   
   --if (PLATF_DISPL_TOUCH) then
      iRet, sDado = RecebeStringTouch (sPrompt, iTamMin, xFormat, iMascara, iAlfa, 
                            iAlinhaEsq, sDado, iSemPontos, iLimpaTela,
                            iLinha, iTimeout, iLinhaInput, fTecladoNumerico, iCaracPermit,
							fFooter)
   
   
   return iRet, sDado     
end


function graph.Input (tParams)
	LogDebug('estou na graph.Input', 1, I_LOGDEBUG_TIPO_UI) -- DS, 1P
	local iMascara 			= 0
	local fFooter 			= true
	local iAlpha 			= 0
   local fTecladoNumerico  = true
	local mascaraOuTamMaximo = 10

	
	--se for senha, mascara e nao coloca o teclado na tela
	if tParams.fCampoSenha then
		iMascara = 1
		fFooter = false
		fTecladoNumerico = false
	end
	
	
	if (tParams.fEValor) then
		mascaraOuTamMaximo = "@.@@@.@@@.@@*,**"
	elseif(tParams ~= nil and tParams.iTamanhoMax ~= nil) then
		mascaraOuTamMaximo = tParams.iTamanhoMax	
	end
	
	local iRet, sValor = graph.RecebeString(tParams.sTitulo,            --sTitulo, 
											tParams.sTexto, 			--sPrompt, 
											tParams.iTamanhoMin, 		--iTamMin, 
											mascaraOuTamMaximo, 		--xFormat,
											iMascara, 					--iMascara, 
											--0, 						--iAlfa, 
											tParams.iAlfa,				--iAlfa, 
											0, 							--iAlinhaEsq, 
											tParams.sTextoInput, 		--sDado, 
											nil, 						--iSemPontos, 
											nil, 						--iLimpaTela,
											nil, 						--iLinha, 
											tParams.iTempo, 			--iTimeout, 
											nil, 						--iLinhaInput, 
											fTecladoNumerico, 			--fTecladoNumerico, 
											nil, 						--iCaracPermit,
											fFooter )					--fFooter	
	
	iTecla = -1
	
	LogDebug('graph.Input=' .. iRet, 1, I_LOGDEBUG_TIPO_UI)
	
	if(iRet == RET_OK) then
		LogDebug('Sucesso no input: ' .. sValor, 1, I_LOGDEBUG_TIPO_UI)
	else--(iRet == RET_CANCELADO) then
		iRet = HF_BUTTON_KEYBOARD_REJECT_BUTTON
	--else
		--LogDebug('Erro no input: ' .. iRet, 1 , I_LOGDEBUG_TIPO_UI)
		--sValor = HF_BUTTON_KEYBOARD_REJECT_BUTTON
	end
	
	return {iRet, sValor} 
	

end

















---
-- Monta um botão com um item de menu.
--@author Marcelo Tosihiko Sigueoka
--@param iTipoMenu Tipo de Menu a ser exibido
--@param sLabel Nome do item do Menu
--@param iIdxItem Índice do Menu que será colocado antes do item 
--@param fSemTeclaAtalho True, caso não deva ser utilizado tecla de atalho
--@param fTeclaAtalhoApp True, caso o Menu deva usar teclas de atalho definidas por itens anteriormente montados
--@param fBotaoDefault True, caso este botão seja o default -> troca a imagem do botão
--@param tTeclasAtalhoPermitidas Tabela contendo as teclas de atalho que o menu acatará
--@return iRet Código de retorno
local function MontaBotaoMenu(iTipoMenu, sLabel, iIdxItem, fSemTeclaAtalho, fTeclaAtalhoApp, fBotaoDefault, tTeclasAtalhoPermitidas)
   local iIdxTeclaAtalho = iIdxItem -- Tecla de atalho é o próprio número do item
   
   if (not fSemTeclaAtalho) then   
      if (not fTeclaAtalhoApp) then
         -- Verifica se o primeiro caractere é um número
         local sSeparador = "."
         if (tonumber(string.sub(sLabel, 1, 1))) then
            sSeparador = sSeparador .. " " -- Coloca um espaço entre o ponto e o label
         end
         
		 -- Checagem do Menu Principal. Se true número do texto no label do btn administra deve ser 0. (P08)
		 if (sLabel == "administra") then
			 sLabel = iIdxItem-2 .. sSeparador .. sLabel 
		 else
			 sLabel = iIdxItem .. sSeparador .. sLabel 
		 end
		 
         --sLabel = iIdxItem .. sSeparador .. sLabel 
      else
         -- Pega o primeiro caractere como Índice          
         local iIdxAux = tonumber(string.sub(sLabel, 1, 1))         
         if (iIdxAux) then 
            -- Se o segundo dígito for número, não permite tecla de atalho também...
            if (tonumber(string.sub(sLabel, 2, 2))) then
               fSemTeclaAtalho = true
            else
               iIdxTeclaAtalho = iIdxAux 
            end
         else
            fSemTeclaAtalho = true -- Não deve ter tecla de atalho -> Não está definido
         end
      end      
   end
   
   LogDebug("[sIUTouch] Botao " .. iIdxItem .. " = " .. sLabel, 1, I_LOGDEBUG_TIPO_UI)
   
   
   local iCodTeclaRetorno = 0
   
   if (not fSemTeclaAtalho) then  
      -- 48 = 0x30 + Tecla
      iCodTeclaRetorno = 48 + iIdxTeclaAtalho      
	  --iCodTeclaRetorno = tostring(iIdxTeclaAtalho)
   else
      -- Mapeia um código diferente para não permitir o uso do teclado físico
      -- 64 = 0x40 + Tecla
      iCodTeclaRetorno = 64 + iIdxTeclaAtalho      
   end
      
   -- Mapeia o retorno a partir da tecla de retorno 
   -- Retorna o Índice do item escolhido      
   tTeclasAtalhoPermitidas[iCodTeclaRetorno] = iIdxItem 
   
   -- %s para imprimir o Label do Menu, %x para definir a tecla de retorno do item de menu (iIdxItem) 
   local sScrBotaoMenu = "" 
   if (iTipoMenu == gtTipoTela.MENU) then
      if (not fBotaoDefault) then
         sScrBotaoMenu = "~I009{~L003~F01~$0~W%s~K%03x}" -- Botão pequeno branco (2 por linha)
      else
         sScrBotaoMenu = "~I038{~L003~F01~$1~W%s~K%03x}" -- Botão pequeno preto (2 por linha)
      end
   else -- gtTipoTela.MENU_BT_GRANDE
      if (not fBotaoDefault) then
         sScrBotaoMenu = "~I007{~L004~F01~$0~W%s~K%03x}" -- Botão grande branco(1 por linha)
      else
         sScrBotaoMenu = "~I008{~L004~F01~$1~W%s~K%03x}" -- Botão grande preto (1 por linha)
      end
   end
   
   local sBotao = string.format(sScrBotaoMenu, sLabel, iCodTeclaRetorno)
   
   return sBotao
end










---
-- Monta o menu para ser apresentado em tela
--@author Marcelo Tosihiko Sigueoka
--@param iTipoMenu Tipo de Menu a ser exibido
--@param tMenu Tabela contendo os dados referentes ao Menu a ser montado
--@param fSemTeclaAtalho True, caso não deva ser utilizado tecla de atalho
--@param fTeclaAtalhoApp True, caso o Menu deva usar teclas de atalho definidas por itens anteriormente montados
--@return iRet Código de retorno
--@return tLinhaItensMenu Tabela contendo o menu
--@return tTeclasAtalhoPermitidas Tabela contendo as teclas de atalho que o menu acatará
--@return fMenuItemUnico True se o menu tiver apenas um item
local function MontaScriptItensMenu(iTipoMenu, tMenu, fSemTeclaAtalho, fTeclaAtalhoApp)
   LogDebug("[sIUTouch] MontaScriptItensMenu()", 1, I_LOGDEBUG_TIPO_UI)
   
   local tLinhaItensMenu, tTeclasAtalhoPermitidas = {}, {}
   local sPosBotaoColEsquerda = "~L015"
   local sPosBotaoColDireita  = "~R015"
   local sPosicaoProxBotao = sPosBotaoColEsquerda
   local sBotao = ""
   local sLabelMenu = ""
   local iIdxTabela, iIdxItem = 1, 1
   local fIncrementaLinha, fBotaoDefault = false, false
   
   -- Monta o menu baseado no segundo elemento em diante de tMenu
   for iMenuIndex, tMenuItem in ipairs(tMenu) do
      if (iMenuIndex > 1) then -- Pula o primeiro elemento, que é o titulo do menu
         --printer.print("----- Criando MENU - " .. tostring(iMenuIndex) .. " - " .. tostring(tMenuItem))
         iIdxItem = iMenuIndex - 1 -- Índice do item
         
         if ((type(tMenuItem) == "string") or (type(tMenuItem) == "number")) then 
            -- Apenas o display (o retorno sera a posicao, e nao o fluxo)            
            sLabelMenu = tMenuItem
            
         elseif (type(tMenuItem) == "table") then 
            -- Tabela onde o primeiro elemento é o display, e o segundo o fluxo associado
         
            if ((type(tMenuItem[1]) == "string") or (type(tMenuItem[1]) == "number")) then
               -- Nao existe diferença entre o display para 2x16 e 2x20
               sLabelMenu = tMenuItem[1]
            else
               return RET_PARAM_INVALIDO, nil, nil, nil
            end            
         else
            return RET_PARAM_INVALIDO, nil, nil, nil
         end
         
         if (not tLinhaItensMenu[iIdxTabela]) then
            tLinhaItensMenu[iIdxTabela] = ""
         end
         
         fBotaoDefault = false
         if (tMenu.fAtivaBotDefault) then
            -- Verifica se deve "ativar" o botão default -> troca a imagem do botão para que ele se destaque dentre as opções do menu
            if (iIdxItem == tMenu.Default) then fBotaoDefault = true end
         end
         
         -- Posição + Definição do Botão + Retorno do botão (é o próprio índice do item)
         tLinhaItensMenu[iIdxTabela] = tLinhaItensMenu[iIdxTabela] .. sPosicaoProxBotao .. 
                                       MontaBotaoMenu(iTipoMenu, sLabelMenu, iIdxItem, fSemTeclaAtalho, fTeclaAtalhoApp, fBotaoDefault, tTeclasAtalhoPermitidas)
         
         if (iTipoMenu == gtTipoTela.MENU) then
            -- Menu com botão pequeno
            if (fIncrementaLinha) then
               sPosicaoProxBotao = sPosBotaoColEsquerda
               fIncrementaLinha = false
               iIdxTabela = iIdxTabela + 1
            else
               sPosicaoProxBotao = sPosBotaoColDireita
               fIncrementaLinha = true
            end          
         else -- if (iTipoMenu == gtTipoTela.MENU_BT_GRANDE) then
            -- Menu com botão grande
            sPosicaoProxBotao = sPosBotaoColEsquerda
            fIncrementaLinha = true
            iIdxTabela = iIdxTabela + 1                  
         end
      end
   end
   
   local fMenuItemUnico = false
   if (iIdxItem == 1) then fMenuItemUnico = true end
   
   return RET_OK, tLinhaItensMenu, tTeclasAtalhoPermitidas, fMenuItemUnico
end


---
-- Monta a barra de botões inferior da tela de infomações.
--@author Marcelo Tosihiko Sigueoka
--@param tParam Parâmetros para montar a barra de botões
--@param tTeclasAtalhoPermitidas Tabela contendo as teclas que a função acatará
--@return iRet Código de retorno
local function MontaBarraInferior(tParam, tTeclasAtalhoPermitidas)
   -- Posição dos botões (CUIDADO! EXISTEM ALGUNS BOTÕES COM AJUSTES PRÓPRIOS NO POSICIONAMENTO!)
   local sBotoesAcao = GeraBotoesBarraInferior(tParam.tBotoesInferiores, tParam.fMostraSetas, tTeclasAtalhoPermitidas)
   
   --********************* SETAS *********************   
   if (tParam.fMostraSetas) then
      -- Define o posicionamento e a imagem dos botões de "subir" e "descer"
      local sBotaoSetaCima, sBotaoSetaBaixo, sPosicao = "", "", ""
      
      -- Posições HORIZONTAIS do botão      
      if ((tParam.tBotoesInferiores) and (tParam.tBotoesInferiores.fBotaoVoltar) and
          (tParam.tBotoesInferiores.fBotaoMenuIni)) then
         sPosicao = "~D009"
         sBotaoSetaCima  = "~L070" 
         sBotaoSetaBaixo = "~L124"
      else
         sPosicao = "~D011"
         sBotaoSetaCima  = "~L123"
         sBotaoSetaBaixo = "~R015"         
      end
      
      -- Imagem dos botões
      sBotaoSetaCima  = sBotaoSetaCima .. "~I006"
      sBotaoSetaBaixo = sBotaoSetaBaixo .. "~I006"
      
      -- Define as imagens das setas e os labels dos botões
      --[[
	  if (tParam.fSetaCima) then
         -- Seta I034, Cor da fonte 0 e Retorno 'RCKEY_PREV'
         sBotaoSetaCima = sBotaoSetaCima .. 
                          string.format("{~U004~I018~D004~F01~$0"  .. "~K%03x}", RCKEY_PREV)         
      else
         sBotaoSetaCima = sBotaoSetaCima .. "{~U004~I034~D004~F01~$1"   .. "}"
      end
      
      if (tParam.fSetaBaixo) then
         sBotaoSetaBaixo = sBotaoSetaBaixo .. 
                           string.format("{~U004~I017~D004~F01~$0"  .. "~K%03x}", RCKEY_NEXT)                                    
      else
         sBotaoSetaBaixo = sBotaoSetaBaixo .. "{~U004~I033~D004~F01~$1" .. "}"
      end
	  ]]--
	  if (tParam.fSetaCima) then
         -- Seta I034, Cor da fonte 0 e Retorno 'RCKEY_PREV'
         sBotaoSetaCima = sBotaoSetaCima .. 
                          string.format("{~I018~D004~F01~$0"  .. "~K%03x}", RCKEY_PREV)         
      else
         sBotaoSetaCima = sBotaoSetaCima .. "{~I034~D004~F01~$1"   .. "}"
      end
      
      if (tParam.fSetaBaixo) then
         sBotaoSetaBaixo = sBotaoSetaBaixo .. 
                           string.format("{~I017~D004~F01~$0"  .. "~K%03x}", RCKEY_NEXT)                                    
      else
         sBotaoSetaBaixo = sBotaoSetaBaixo .. "{~I033~D004~F01~$1" .. "}"
      end
      
      sBotoesAcao = sBotoesAcao .. sPosicao .. sBotaoSetaCima .. sBotaoSetaBaixo     
   end
   
   return sBotoesAcao
end



---
-- Monta a barra de rolagem em telas que necessitem dessa funcionalidade
--@author Marcelo Tosihiko Sigueoka
--@param iTipoExibicao Tipo de tela a ser montada (ver variável gtTipoTela)
--@param tParam Parâmetros para a montagem do Menu
--@return sBarraScroll Barra de rolagem 
local function MontaBarraRolagem(iTipoExibicao, tParam)
   local sBarraScroll = "~U034~R006~I002" -- Barra cinza FIXA na lateral
   local iPosMinBarra, iPosMaxBarra = 0, 0
   local iPosBarra = 0 -- Posição da barra MÓVEL, em pixels, em relação ao eixo X superior
         
   if ((iTipoExibicao == gtTipoTela.MENU) or (iTipoExibicao == gtTipoTela.MENU_BT_GRANDE)) then
      if (tParam.sTitulo ~= "") then 
         sBarraScroll = sBarraScroll .. "~#FFFFFF010056" -- Cobre parte da barra cinza         
         iPosMinBarra = 95 -- Menu com título
      else
         iPosMinBarra = 38 -- Menu sem título
      end
      
      iPosMaxBarra = 149
   elseif (iTipoExibicao == gtTipoTela.RELAT_TELA) then 
      sBarraScroll = sBarraScroll .. "~#FFFFFF010020~D070~#FFFFFF010020" -- Cobre parte da barra cinza         
      iPosMinBarra = 57
      iPosMaxBarra = 129
   elseif (iTipoExibicao == gtTipoTela.INFORMACOES) then
      if (tParam.sTitulo ~= "") then 
         sBarraScroll = sBarraScroll .. "~#FFFFFF010020" -- Cobre parte da barra cinza         
         iPosMinBarra = 57 -- Menu com título
      else
         iPosMinBarra = 38 -- Menu sem título
      end
      
      iPosMaxBarra = 149
   end
   
   if (tParam.iPrimeiraLinha == 1) then         
      -- 1ª tela 
      iPosBarra = iPosMinBarra
   elseif (tParam.iUltimaLinha == tParam.iNumLinhasInformacao) then
      -- Última tela 
      iPosBarra = iPosMaxBarra         
   else         
      -- Calcula quantas linhas o usuário pode percorrer no menu
      local iQtdeLinhasMostrar = tParam.iNumLinhasInformacao - tParam.iNumLinhasMaximo
      
      -- (iPosMaxBarra - iPosMinBarra) / iQtdeLinhasMostrar = Pixels por linha percorrida
      -- Calcula tudo junto para não perder a precisão
      -- Define a posição da barra MÓVEL - move-se proporcionalmente ao número de linhas percorridas
      iPosBarra = iPosMinBarra + ((iPosMaxBarra - iPosMinBarra) * (tParam.iPrimeiraLinha - 1))/iQtdeLinhasMostrar
   end
   
   -- Define a barra MÓVEL
   sBarraScroll = sBarraScroll .. string.format("~U%03d~R004~I003", iPosBarra) 
   
   return sBarraScroll
end

---
-- Monta a tela com a informação a ser apresentada
--@author Marcelo Tosihiko Sigueoka
--@param iTipoExibicao Tipo de tela a ser montada (ver variável gtTipoTela)
--@param tLinhasInformacao Tabela contendo as linhas de informação a serem exibidas
--@param tParam Parâmetros para a montagem do Menu
--@return sMenuScr Menu a ser exibido
local function MontaScrExibicao(iTipoExibicao, tLinhasInformacao, tParam, tTeclasAtalhoPermitidas) 
   LogDebug("[sIUTouch] MontaScrExibicao()", 1, I_LOGDEBUG_TIPO_UI)
   
   local sMenuScr = ""
   
   -- Monta título
   if ((tParam.sTitulo) and (tParam.sTitulo ~= "")) then
      sMenuScr = "~C~U030~F03" .. tParam.sTitulo
   end
   
   if ((tParam.sDescricao) and (tParam.sDescricao ~= "")) then
      sMenuScr = sMenuScr .. "~U060~L015~F02" .. tParam.sDescricao
   end
   
   -- Monta barra lateral
   if (tParam.fMostraSetas) then
      sMenuScr = sMenuScr .. MontaBarraRolagem(iTipoExibicao, tParam)
   end
      
   -- Posicionamento dos botões em relação ao eixo X superior da tela
   local iPosLinhaVertical, iDeltaPixels = 0, 0
   
   -- Posicionamento das informações na tela
   if ((iTipoExibicao == gtTipoTela.MENU) or (iTipoExibicao == gtTipoTela.MENU_BT_GRANDE)) then
      -- Posicionamento dos itens do MENU
      iPosLinhaVertical = 34
      if (tParam.iNumLinhasMaximo == 3) then
         -- Se o máximo que pode ser apresentado em tela são 3 linhas de Menu, começa a partir do 2
         iPosLinhaVertical = 90 
      end  
      iDeltaPixels = 56
   elseif (iTipoExibicao == gtTipoTela.RELAT_TELA) then      
      -- Posicionamento do Relatório em Tela
      iPosLinhaVertical = 57
      iDeltaPixels = 12
      sMenuScr = sMenuScr .. "~F06"
   elseif (iTipoExibicao == gtTipoTela.INFORMACOES) then
      -- Posicionamento da Tela de Informações
      if ((tParam.sTitulo) and (tParam.sTitulo ~= "")) then
         iPosLinhaVertical = 57
      else
         iPosLinhaVertical = 27
      end
      iDeltaPixels = 19      
   end
   
   -- Monta Botões com os itens do Menu
   for iTblIdx = tParam.iPrimeiraLinha, tParam.iUltimaLinha, 1 do
      if (tLinhasInformacao[iTblIdx]) then         
         sMenuScr = sMenuScr .. string.format("~U%03d", iPosLinhaVertical) .. 
                    tLinhasInformacao[iTblIdx]  
         iPosLinhaVertical = iPosLinhaVertical + iDeltaPixels 
      else
         break
      end
   end
   
   -- Verifica se deve exibir uma pergunta na tela de informações
   if ((tParam.sPergunta) and (tParam.sPergunta ~= "")) then
      sMenuScr = sMenuScr .. "~C~U235~F03" .. tParam.sPergunta
   end
   
   -- Monta botões inferiores
   sMenuScr = sMenuScr .. MontaBarraInferior(tParam, tTeclasAtalhoPermitidas)
   
   return sMenuScr
end  

---
-- Apresenta uma tela com scroll e aguarda uma tecla por um tempo configurável
--@author Marcelo Tosihiko Sigueoka
--@param iTipoExibicao Tipo de tela a ser montada (ver variável gtTipoTela)
--@param tParam Parâmetros para exibição das informações na tela
--@param tLinhaInformacao Tabela contendo as informações a serem exibidas
--@param tTeclasAtalhoPermitidas Tabela contendo as teclas que a função acatará
--@param iTimeout Timeout da espera por uma tecla, em ms
--@return iRet Código de retorno
--@return iIdxSel Código do item selecionado
local function ExibeTelaScroll(iTipoExibicao, tParam, tLinhaInformacao, tTeclasAtalhoPermitidas, iTimeout)
   local iRet, iTecla = RET_OK, 0
   local sMenuScr = "" 
   local fAtualizaTela = true
   
   if (not iTimeout) then iTimeout = TEMPO_OPERADOR end
   
   while (true) do
      if (fAtualizaTela) then
         if (iTecla == RCKEY_NEXT) then
            if ((tParam.iUltimaLinha + 1) <= tParam.iNumLinhasInformacao) then
               LogDebug("RCKEY_NEXT fAtualizaTela = true", 1, I_LOGDEBUG_TIPO_UI)
               tParam.iPrimeiraLinha = tParam.iPrimeiraLinha + 1
               tParam.iUltimaLinha   = tParam.iUltimaLinha + 1
            else      
               Beep (BEEP_WARN)
            end
         elseif (iTecla == RCKEY_PREV) then
            if ((tParam.iPrimeiraLinha - 1) >= 1) then
               LogDebug("RCKEY_PREV fAtualizaTela = true", 1, I_LOGDEBUG_TIPO_UI)
               tParam.iPrimeiraLinha = tParam.iPrimeiraLinha - 1
               tParam.iUltimaLinha   = tParam.iUltimaLinha - 1               
            else
               Beep (BEEP_WARN)
            end         
         end
      
         -- Verifica se deve mostrar seta para cima
         if (tParam.iPrimeiraLinha == 1) then 
            tParam.fSetaCima = false
         else 
            tParam.fSetaCima = true 
         end
         
         -- Verifica se deve mostrar seta para baixo      
         if (tParam.iUltimaLinha == tParam.iNumLinhasInformacao) then 
            tParam.fSetaBaixo = false
         else 
            tParam.fSetaBaixo = true 
         end
         
         -- Monta a tela
         sMenuScr = MontaScrExibicao(iTipoExibicao, tLinhaInformacao, tParam, tTeclasAtalhoPermitidas) 
            
         iRet = GeraTelaScript(sMenuScr) 
         if (iRet ~= RET_OK) then return iRet, 0 end
      end
      
      iRet, iTecla = EsperaTecla(tTeclasAtalhoPermitidas, iTimeout, tParam.fMostraSetas)
      if (iRet ~= RET_OK) then return iRet, 0 end
      
      fAtualizaTela = false
      -- Verifica se o usuário quer ver mais informações
      if ((tParam) and (tParam.fMostraSetas) and ((iTecla == RCKEY_NEXT) or (iTecla == RCKEY_PREV))) then 
         fAtualizaTela = true            
      else
         return iRet, iTecla
      end
   end
   
   return iRet, 0
end


-- Função responsável pela montagem e execução de uma tela específica que pode ter rolagem
--@author Marcelo Tosihiko Sigueoka
--@param iTipoExibicao Tipo de tela a ser montada (ver variável gtTipoTela)
--@param sTitulo Título a ser exibido na tela
--@param sPergunta Pergunta a ser exibida na tela
--@param tLinhasInformacao Tabela contendo as linhas de informação a serem apresentadas
--@param tTeclasAtalhoPermitidas Tabela contendo as teclas de atalho que o menu acatará
--@param tBotoesInferiores Tabela contendo as definições dos botões que serão mostrados na barra inferior do Menu
--@param iTimeout Timeout do menu, em ms
--@return iRet Código de retorno
--@return iIdxSel Código do item selecionado
local function ExecutaTelaRolagem(iTipoExibicao, tLinhasInformacao, tTeclasAtalhoPermitidas, 
                                      tBotoesInferiores, iTimeout, sTitulo, sPergunta, sDescricao)
   LogDebug("[sIUTouch] ExecutaTelaRolagem()", 1, I_LOGDEBUG_TIPO_UI)
   
   -- Monta tabela de parâmetros de controle para a montagem da tela
   local tParam = {}
   tParam.iPrimeiraLinha = 1 
   tParam.iUltimaLinha = 1
   tParam.iNumLinhasMaximo = 0                       -- Número de linhas máximo que pode ser apresentado em uma mesma tela
   tParam.iNumLinhasInformacao = #tLinhasInformacao  -- Número de linhas de informação
   tParam.fMostraSetas = false
   tParam.fSetaCima = false
   tParam.fSetaBaixo = false   
   tParam.tBotoesInferiores = tBotoesInferiores  -- Armazena os botões que devem aparecer na barra inferior à tela 
   tParam.sTitulo = ""
   tParam.sPergunta = ""
   tParam.sDescricao = ""
   
   if ((sTitulo) and (sTitulo ~= "")) then tParam.sTitulo = Trim(sTitulo) end
   if ((sPergunta) and (sPergunta ~= "")) then tParam.sPergunta = Trim(sPergunta) end
   if ((sDescricao) and (sDescricao ~= "")) then tParam.sDescricao = Trim(sDescricao) end

   if ((iTipoExibicao == gtTipoTela.MENU) or (iTipoExibicao == gtTipoTela.MENU_BT_GRANDE)) then
      if ((tParam.sTitulo ~= "") or (tParam.sDescricao ~= "")) then
         tParam.iNumLinhasMaximo = DISP_TOUCH_MENU_MAX_COM_TIT -- Máximo de 6 (ou 3, botão grande) itens de Menu apresentados em tela 
      else
         tParam.iNumLinhasMaximo = DISP_TOUCH_MENU_MAX_SEM_TIT -- Máximo de 8 (ou 4, botão grande) itens de Menu apresentados em tela
      end
   elseif (iTipoExibicao == gtTipoTela.RELAT_TELA) then
      tParam.iNumLinhasMaximo = DISP_LONG_TOUCH_LIN
   elseif (iTipoExibicao == gtTipoTela.INFORMACOES) then
      tParam.iNumLinhasMaximo = DISP_TOUCH_MAX_ARIAL_19 -- Fontes ARIAL 16px (ARIAL19.SFD) e ARIAL Bold 16px (ARIALB19.SFD)
      if (tParam.sTitulo ~= "") then
         tParam.iNumLinhasMaximo = tParam.iNumLinhasMaximo - 2
      end
   end
    
   -- Verifica qual será a última linha de menu a ser apresentada
   if (tParam.iNumLinhasInformacao > tParam.iNumLinhasMaximo) then
      -- Número de linhas é MAIOR do que o máximo possível de ser apresentado
      tParam.iUltimaLinha = tParam.iNumLinhasMaximo
      tParam.fMostraSetas = true
   else
      -- Todo o Menu cabe em uma tela
      tParam.iUltimaLinha = tParam.iNumLinhasInformacao
   end
   
   return ExibeTelaScroll(iTipoExibicao, tParam, tLinhasInformacao, tTeclasAtalhoPermitidas, iTimeout)
end




---
-- Função responsável pela montagem de Menu em terminais touch
--@author Marcelo Tosihiko Sigueoka
--@param tMenu Tabela contendo os dados necessários para a montagem do Menu
--@param fSemTeclaAtalho True, caso não deva ser utilizado tecla de atalho
--@param fTeclaAtalhoApp True, caso o Menu deva usar teclas de atalho definidas por itens anteriormente montados
--@param iTamMaxItemMenu Tamanho Máximo do item de menu
--@param iTempoRol Tempo de rolagem do label do menu
--@return iRet Código de retorno
--@return iMenuSelected Item ou fluxo do menu selecionado
--@return Cartao Objeto que representa o cartão em processamento
--@return fFallBack True, caso a transação esteja em fallback
local function ExecutaMenu(tMenu, fSemTeclaAtalho, fTeclaAtalhoApp, iTamMaxItemMenu, iTempoRol)
   assert(type(tMenu) == "table", "Parametro deve ser tabela")
   
   LogDebug("[sIUTouch] Menu()", 1, I_LOGDEBUG_TIPO_UI)
   
   local iTipoMenu = gtTipoTela.MENU -- Menu com botões pequenos (2 botões por linha)
   
   --botoes grandes
   if (tMenu.fBotoesGrandes) then
      iTipoMenu = gtTipoTela.MENU_BT_GRANDE -- Menu com botões grandes (1 botão por linha)
   end
   
   -- Monta os itens do MENU a ser apresentado em tela
   local iRet, tLinhaItensMenu, tTeclasAtalhoPermitidas, fMenuItemUnico = MontaScriptItensMenu(iTipoMenu, tMenu, fSemTeclaAtalho, fTeclaAtalhoApp) 
   if (iRet ~= RET_OK) then return iRet end
   
   if (tMenu.fBotaoVoltar) then
      -- Mapeia o botão "voltar", caso o menu tenha ele...
      tTeclasAtalhoPermitidas[PLATF_TECLA_VOLTAR] = PLATF_TECLA_VOLTAR
   end
   
   if (tMenu.fBotaoMenuIni) then
      -- Mapeia o botão "menu inicial", caso o menu tenha ele...
      tTeclasAtalhoPermitidas[PLATF_TECLA_MENU] = PLATF_TECLA_MENU
   end   
   
   if (tMenu.fBotaoFuncao) then
	  -- Mapeia o botão "funcoes", caso o menu tenha ele...
      tTeclasAtalhoPermitidas[PLATF_TECLA_FUNC] = PLATF_TECLA_FUNC
   end
   
   if (fMenuItemUnico) then
      -- Se o Menu tiver apenas 1 item, verifica se deve exibi-lo (tMenu.Default < 0)
      if ((tMenu.Default) and (tMenu.Default >= 0)) then return RET_OK, 1 end
   end
   
   --[[
   local tBotoesInferiores = {}
   if (tMenu.fBotaoVoltar) then tBotoesInferiores.fBotaoVoltar = true end
   if (tMenu.fBotaoMenuIni) then tBotoesInferiores.fBotaoMenuIni = true end
   ]]
   
   return ExecutaTelaRolagem(iTipoMenu, tLinhaItensMenu, tTeclasAtalhoPermitidas, tMenu, TEMPO_OPERADOR, tMenu[1], nil, tMenu.sDescricao)   
end

function InvalidaEstadoMenu() 
   gtEstadoMenu[gtEstadoMenu.iEstado] = {} -- reseta o estado atual
   -- Volta os estados da máquina para os estados válidos imediatamente antes
   gtEstadoMenu.iEstado = gtEstadoMenu.iEstadoAnterior
   gtEstadoMenu.iEstadoAnterior = gtEstadoMenu.iEstadoAnterior - 1
end

---
-- Função responsável pela montagem de Menu
--@author Marcelo Tosihiko Sigueoka
--@param tMenu Tabela contendo os dados necessários para a montagem do Menu
--@param Cartao Objeto que representa o cartão em processamento
--@param fFallBack True, caso a transação esteja em fallback
--@param fSemTeclaAtalho True, caso não deva ser utilizado tecla de atalho
--@param fTeclaAtalhoApp True, caso o Menu deva usar teclas de atalho definidas por itens anteriormente montados
--@param iTamMaxItemMenu Tamanho Máximo do item de menu
--@param iTempoRol Tempo de rolagem do label do menu
--@return iRet Código de retorno
--@return iMenuSelected Item ou fluxo do menu selecionado
--@return Cartao Objeto que representa o cartão em processamento
--@return fFallBack True, caso a transação esteja em fallback
function graph.Menu(tParams)
	--printer.print('estou na  graph.Menu') -- DSP
   local tMenu, Cartao, fFallBack, fSemTeclaAtalho, fTeclaAtalhoApp, iTamMaxItemMenu, iTempoRol;
   
   if tParams.sTitulo == nil then
		tParams.sTitulo = ''
   end
   
   --adicionando titulo
   tMenu = {tParams.sTitulo}
   
   if(tParams.tBotoesRodape and tParams.tBotoesRodape[1] == "voltar") then
	LogDebug('tem botao voltar', 1, I_LOGDEBUG_TIPO_UI)
	tMenu.fBotaoVoltar = true
   end
   
   if(tParams.tBotoesRodape and tParams.tBotoesRodape[2] == "menu inicial") then
	LogDebug('tem botao menu inicial', 1, I_LOGDEBUG_TIPO_UI)
	tMenu.fBotaoMenuIni = true
   end
   
   if (tParams.tBotoesRodape and tParams.tBotoesRodape[2] == "funcoes") then
		LogDebug("tem botao funcoes", 1, I_LOGDEBUG_TIPO_UI)
		tMenu.fBotaoFuncao = true
   end
   
   if tParams.fBotoesGrandes then
		tMenu.fBotoesGrandes = true
   end
   
   --adicionando opcoes do menu
   for i = 1, #tParams.tItens do
	table.insert(tMenu,tParams.tItens[i])	
   end
   
   Cartao = nil
   fFallBack = false
   fSemTeclaAtalho = false
   
   LogDebug("[sIU] graph.Menu()", 1, I_LOGDEBUG_TIPO_UI)
   
   MontaBarraStatus(false)
   
   local iMenuStatus, iMenuSelected = RET_OK, 0
   
   if (#tMenu == 2) then -- Título + 1 item
      -- Se o Menu tiver apenas 1 item, verifica se deve exibi-lo (tMenu.Default < 0)
      if ((tMenu.Default) and (tMenu.Default >= 0)) then 
         InvalidaEstadoMenu()
      end
   end    
   
   iMenuStatus, iMenuSelected = ExecutaMenu(tMenu, fSemTeclaAtalho, fTeclaAtalhoApp, iTamMaxItemMenu, iTempoRol)
      
   if (iMenuStatus == RET_OK)  then
      --if (not PLATF_DISPL_MONOCR) then
         -- Plataformas monocromáticas não possuem suporte ao "voltar"
         if ((tMenu.fBotaoMenuIni) and (iMenuSelected == PLATF_TECLA_MENU)) then
            -- Caso o Menu permita o botão "menu inicial" e ele foi apertado, volta para ele
            return RET_MENU_INICIAL, nil, nil, nil
         end      

         if ((tMenu.fBotaoVoltar) and (iMenuSelected == PLATF_TECLA_VOLTAR)) then
            return RET_MENU_VOLTAR, nil, nil, nil
         end    
      --end
		
      if (type(tMenu[iMenuSelected + 1]) == "table") then
         -- O retorno e' o segundo elemento do indice selecionado
         return RET_OK, tMenu[iMenuSelected + 1][2], Cartao, fFallBack
      else
         -- Nao existe um nome de fluxo na tabela de menus, 
         -- retorna apenas o número da posicao escolhida
         return RET_OK, iMenuSelected, Cartao, fFallBack
      end
   end
   
   return iMenuStatus, nil, nil, nil
end



---
-- Apresenta um texto na tela. 
--@author Marcelo Tosihiko Sigueoka
--@param sMsg String a ser apresentada na tela
--@return iRet Código de retorno
function graph.Mensagem(tParams)
   
   LogDebug("graph.Mensagem()", 1, I_LOGDEBUG_TIPO_UI)
   
   local sMsg = ""
   local sTela = ""
   
   --quebrando string com '\n'
   if (not tParams.sTexto:find("\n") and tParams.sTexto:len() >= DISP_TOUCH_MAX_ARIAL_19) then
		LogDebug('quebrar string:' .. tParams.sTexto, 1, I_LOGDEBUG_TIPO_UI)
		tParams.sTexto = hutil.WordWrap(DISP_TOUCH_MAX_ARIAL_19, tParams.sTexto)	
		LogDebug('quebrar string depois:' .. tParams.sTexto, 1, I_LOGDEBUG_TIPO_UI)
	end
   
   MontaBarraStatus(false)
   
	--caso seja passado apenas um texto como parametro
	if type(tParams) == "string" then
		sTela = "~D000~#FFFFFF240064" .. "~U158~F00" .. tParams
		return GeraTelaScript(sTela)
	end	
	
	-- Cria animacao
	--TODO testes exaustivos! usa thread!
	--[[
	if (tParams.fAnimacao) then
		if (not statusAnimacao) then	
			--printer.print("--------- CRIA ANIMACAO - " .. " fAnimacao = " .. tostring(tParams.fAnimacao) .. " statusAnimacao = " .. tostring(statusAnimacao))
			statusAnimacao = true
			graph.CriaAnimacao()
		end	
	else
		if (statusAnimacao) then
			--printer.print("--------- DESLIGA ANIMACAO - " .. " fAnimacao = " .. tostring(tParams.fAnimacao) .. " statusAnimacao = " .. tostring(statusAnimacao))
			statusAnimacao = false
			graph.FinalizaAnimacao()
		end		
	end
	]]--
	
	-- Cria barra de progresso
	if (tParams.fProgressBar) then
		-- multipla por 2.2 porque o tamanho da barra de progresso é de 220 e o download vai de 0 a 100%
		local coeficiente = tParams.iProgress * 2.2
		local width = string.format("%03d", coeficiente);
		
		if (tParams.iProgress > 100) then
			coeficiente = tParams.iProgress * 2.2
			width = string.format("%03d", coeficiente);
		end
		local logo = "~U036~I001"
		progressBarBG = "~D080~#B1B1B1220014" .. logo .. "~D000~#FFFFFF240064" .. "~U158~F00" .. tParams.sTexto	.. "~D080~L010~#FF7F27" .. width .. "014"	
		return GeraTelaScript(progressBarBG)
		
	end
	
	sMsg = tParams.sTexto
   
	--imagens
	if tParams.fImagemAnimada and bImagemAnim then
		sTela = "~U036~I100"			--bandeiras
	elseif tParams.fImagemRede == false then
		sTela = ""						--sem img
	else
		sTela = "~U036~I001"			--default (logo rede)	
	end	 
	
	--trocando a imagem animada (tela inicial)
	if bImagemAnim then
		bImagemAnim = false
	else
		bImagemAnim = true
	end
	
	--texto
   if (tParams.dialogInformacaoSistema) then
      local iDistanciaTopoInicial = 5

      local tLinhasTexto = Split(sMsg, "\n")
      sMsg = ""

      local iPasso = 1
      local iTamanhoLinha = 20
      for k, v in pairs(tLinhasTexto) do
         local tLinha = Split(v, "-")

         sMsg = sMsg .. "~U" .. string.format("%.3d", iDistanciaTopoInicial + (iTamanhoLinha * iPasso))
         sMsg = sMsg .. "~L010~F03" .. tLinha[1] .. ":"
         sMsg = sMsg .. "~R010~F04" .. tLinha[2] .. "\n"

         iPasso = iPasso + 1
      end

      sTela = sTela .. sMsg
   else
	  sTela = sTela .. "~U158~F00" .. sMsg 
   end
   
	--com rodape
	if tParams.tBotoesRodape ~= nil then
		--tela inicial
		if (tParams.tBotoesRodape[1] == "menu inicial") then
			tBotoesInferiores = {}
			tBotoesInferiores.fBotaoMenuIni = true
			tBotoesInferiores.fBotaoFuncao = true
			tTeclasAtalhoPermitidas = {}
			tTeclasAtalhoPermitidas[PLATF_TECLA_FUNC] = PLATF_TECLA_FUNC
			tTeclasAtalhoPermitidas[PLATF_TECLA_MENU] = PLATF_TECLA_MENU
		--sim ou nao
      elseif (tParams.tBotoesRodape[1] == "cancela") then
         tBotoesInferiores = {}
         tBotoesInferiores.fBotaoCancela = true
         tTeclasAtalhoPermitidas = {}
         tTeclasAtalhoPermitidas[RCKEY_ENTER] = RCKEY_ENTER
         tTeclasAtalhoPermitidas[RCKEY_CANCEL] = RCKEY_CANCEL
		else
			tBotoesInferiores = {}
			tBotoesInferiores.fBotaoSim = true
			tBotoesInferiores.fBotaoNao = true
			tTeclasAtalhoPermitidas = {}
			tTeclasAtalhoPermitidas[RCKEY_ENTER] = RCKEY_ENTER
		end

		sTela = sTela .. GeraBotoesBarraInferior(tBotoesInferiores, nil, tTeclasAtalhoPermitidas) 

	--sem rodape
	else
		sTela = sTela .. "~D000~#FFFFFF240064"
	end
   
   --Criando timer   
	local ret = GeraTelaScript(sTela)
	if (ret == RET_OK) then
		
      local eventos
		if tParams.fLerCartao then
			LogDebug('fLerCartao TRUE', 1, I_LOGDEBUG_TIPO_UI)
         eventos = 0xFFFF
      else
         eventos = 0x000C
		end
		
		iTecla = -1
		local iTempo = tParams.iTempo
		if (tParams.fTrataTempo or iTempo) then
			--printer.print('tratando tempo na graph.Mensagem:' .. iTempo)
			--while ((iTecla ~= KEY_CANCEL) and (iTecla ~= PLATF_TECLA_MENU) and (iTecla ~= PLATF_TECLA_FUNC)) do 
				--if(iTempo) then
					--iTecla = keyboard.getkeystrokenb(iTempo)
			
			--fechando bc para nao concorrer com teclado...
			--tBc.fFechar()
			if(iGuiMode ~= S_GUI_MODE_WIN)then
			   -- testando função nova para aguardar por eventos (timeout, magnetico, tecla, etc)
			   iTecla, track1, track2, track3 = ui.graphical_wait_events(iTempo, eventos)
			   --printer.print("iTecla: " .. tostring(iTecla))

            -- TODO: As constantes de tecla estão trocadas e 
            -- os métodos não estão com os retornos padronizados
            if iTecla ~= nil and tonumber(iTecla) ~= nil and tonumber(iTecla) >= 48 and tonumber(iTecla) <= 57 then

               -- Converte para ficar igual às constantes KEY 
               iTecla = tonumber(iTecla) - 0x30 + 1
            end

			else
            if iTempo then
   			   iTecla = ui.graphical_getkeystroke(iTempo)
            else
               iTecla = ui.graphical_getkeystroke(iTimeout)
            end

            --TODO: REMOVER. SIMULACAO DO CHIP COM A TECLA '.' NO TELIUM e '#' no simulador pc
            if iTecla == 13 or iTecla == 21 then
               iTecla = HF_CHIP_EVENT
            end
         end
			--break
				---else
				--	iTecla = keyboard.getkeystrokenb()
				--end
			--if iTecla then
			--	printer.print('tecla:' .. iTecla)
			--end
			--end
			--iTecla = 12
			--mapeamento de teclas
			--REMAPEAMENTO TIMEOUT
			if not iTecla then
				iTecla = HF_TIMEOUT_EVENT
			--REMAPEAMENTO DAS TECLAS DE MENU INICIAL
			elseif iTecla == PLATF_TECLA_MENU then
				iTecla = HF_BUTTON_FIRST_BUTTON
			elseif iTecla == PLATF_TECLA_FUNC or iTecla == KEY_MENU then
				iTecla = HF_BUTTON_SECOND_BUTTON
			--REMAPEAMENTO DAS TECLAS DE SIM E NÃO
			elseif iTecla == RCKEY_ENTER then
				iTecla = HF_BUTTON_SECOND_BUTTON
			elseif iTecla == RCKEY_CANCEL then
				iTecla = HF_BUTTON_FIRST_BUTTON
			--0 a 9
			elseif iTecla >= KEY_ZERO and iTecla <= KEY_NINE then
				iTecla = iTecla - 1
				--LogDebug(key), 1	
			end
			
			if (iTecla ~= HF_TIMEOUT_EVENT) then
				--BeepClick()
			end
			
			LogDebug('iTecla Traduzida:' .. iTecla, 1, I_LOGDEBUG_TIPO_UI)
			LogDebug('tipo:' .. type(iTecla), 1, I_LOGDEBUG_TIPO_UI)
			
			--return ret, iTecla
			return iTecla, track1, track2, track3
		end
		
	else
		return ret, 0
	end
   
	--return GeraTelaScript(sTela)
	
end



---
-- Gera a tela de senha em terminais touch
--@author Marcelo Tosihiko Sigueoka
--@param iNumCaracteres Quantidade de caracteres ("asteriscos") que devem ser desenhados na tela.
--@param fLimpaTela True, caso a tela deva ser apagada antes de ser colocada na tela, False, caso deva ser sobreposta
--@param sTitulo Título da tela de senha
--@param sMensagem Mensagem a ser exibida na tela, já com a a formatação (posição e fontes definidas)
--@param sPosCaixaSenha Posição da caixa de senha na tela
--@param fDadoAberto True, caso o dado deva ser exibido aberto
--@param sSenhaLida Senha para exibição às claras
--@return iRet Código de retorno
local function GeraTelaSenha(iNumCaracteres, fLimpaTela, sTitulo, sMensagem, sPosCaixaSenha, fDadoAberto, sSenhaLida)
   local sTela = ""
   
   LogDebug("[sIUTouch] tsIUTouch.GeraTelaSenha()", 1, I_LOGDEBUG_TIPO_UI)
   
   if ((iNumCaracteres == 0) or (fLimpaTela))then
      --******** Desenha a tela de senha ********
      if (not sTitulo) then sTitulo = "" end
      
      --******** Título ********
      sTela = "~D000~I041~U027~F03" .. sTitulo .. sMensagem
              
   else -- (iNumCaracteres == 0) 
      sTela = "~!" -- Não atualiza a tela toda, apenas a parte da caixa de senha
   end
   
   --******** Caixa de senha ********   
   -- Desenha os caracteres na tela
   sTela = sTela .. sPosCaixaSenha
   if (not fDadoAberto) then
      -- Mascarado
      sTela = sTela .. "~C~I043{~D009~F08~$3" .. string.rep("x", iNumCaracteres) .. "}"
   else
      if (iNumCaracteres ~= 0) then
         sTela = sTela .. "~C~I043{~D009~F08~$3" .. sSenhaLida .. "}"
      else
         sTela = sTela .. "~C~I043"
      end
   end   
   
   -- Desenha a tela 
   return GeraTelaScript(sTela)
end


function graph.InputSenhaAberta(tParams)
	--printer.print('estou no graph.InputSenhaAberta')  -- DSP - DEBUG

   local sTitulo = tParams.sTitulo
   local sMensagem = tParams.sTexto
   local iQtdeDigSenha = tParams.iTamanhoMin
   local fDadoAberto = false
   --Se você quiser que o numero apareça na tela, é só mandar o fDadoAberto como true no tTela.params
   if (tParams.fDadoAberto ~= nil) then
      fDadoAberto = tParams.fDadoAberto
   end


   local iRet, iQtdeDigLido, iTentativas, iTecla = RET_OK, 0, 1, 0
   local fWarn, fLimpaTela = false, true
   local sSenhaLida, sSenha, sPosCaixaSenha = "", "", ""
   local tIUPlataf = {}
   
   if (sMensagem == nil) then
		sMensagem = ''
   end

   if (iQtdeDigSenha == nil) then
      iQtdeDigSenha = 0
   end
   
   -- Posiciona a mensagem e a caixa de senha na tela
   --if (PLATF_DISPL_TOUCH) then
      sMensagem = "~U155~L015~F02" .. sMensagem
      sPosCaixaSenha = "~D065"
      tIUPlataf = tsIUTouch
   --elseif (PLATF_DISPL_GRAFICO) then
   --   sMensagem = "~U140~L015~F08" .. sMensagem 
   --   sPosCaixaSenha = "~D020" 
   --   tIUPlataf = tsIUGrafico
   --end
   
   repeat
      fWarn = false      
      
      -- Gera a tela de senha      
      GeraTelaSenha(iQtdeDigLido, fLimpaTela, sTitulo, sMensagem, sPosCaixaSenha, fDadoAberto, sSenhaLida)
      
      -- Lê a tecla
      iRet, iTecla = EsperaTecla2(TEMPO_OPERADOR)
      if (iRet ~= RET_OK) then 
		 return {HF_BUTTON_KEYBOARD_REJECT_BUTTON, nil} 
	  end
      
      fLimpaTela = false
      
      if (iTecla == RCKEY_CANCEL) then
		 iRet = HF_BUTTON_KEYBOARD_REJECT_BUTTON
		 return {iRet, nil} 
      elseif (iTecla == RCKEY_ENTER) then 
         if (iQtdeDigLido >= iQtdeDigSenha) then
            LogDebug("[sIUTouch] sSenhaLida = " .. sSenhaLida, 1, I_LOGDEBUG_TIPO_UI)
			iRet = RET_OK
			return {iRet, sSenhaLida} 
         else
            fWarn = true
         end         
      elseif ((iTecla >= RCKEY_0) and (iTecla <= RCKEY_9)) then
         if (iQtdeDigLido < iQtdeDigSenha) then 
            iQtdeDigLido = iQtdeDigLido + 1         
            sSenhaLida = sSenhaLida .. string.char(iTecla) -- Atualiza a senha lida
         else
            fWarn = true
         end
      elseif (iTecla == RCKEY_CLEAR) then      
         if (iQtdeDigLido > 0) then
            iQtdeDigLido = iQtdeDigLido - 1 
            
            -- Apaga o último dígito
            if (iQtdeDigLido == 0) then
               sSenhaLida = ""
            else
               sSenhaLida = string.sub(sSenhaLida, 1, iQtdeDigLido)
            end
         else   
            fWarn = true
         end
      else         
         fWarn = true -- Tecla não permitida
      end
      
      if (fWarn) then
         Beep(BEEP_WARN)
      end     
   
   until nil
   
   iRet = -1
   return {iRet, nil}    
end



---
-- Quebra a mensagem em linhas (acabam em "\r") e retorna elas em uma tabela -> ALTERADO PARA "\n"
--@author Marcelo Tosihiko Sigueoka
--@param sMsg Buffer contendo as linhas (acabam em "\r") -> ALTERADO PARA "\n"
--@param tLinhasMsg Tabela contendo as linhas. Cada posição da tabela representa uma linha
--@return iNumLinhas Número de linhas
local function QuebraLinhasMsg(sMsg)
   local iNumLinhas = 0
   local tLinhasMsg = {}
   
   -- Coloca um "\r" no final para que o gmatch possa achar todas as linhas -> ALTERADO PARA "\n"
   if (string.sub(sMsg, sMsg:len()) ~= "\n") then sMsg = sMsg .. "\n" end
   
   for sLinha in string.gmatch(sMsg, "(.-)(\n)") do 
      iNumLinhas = iNumLinhas + 1
      tLinhasMsg[iNumLinhas] = "~L000" .. sLinha
      LogDebug(string.format("tLinhasMsg[%03d] = %s", iNumLinhas, tLinhasMsg[iNumLinhas]), 1, I_LOGDEBUG_TIPO_UI)
   end
   if (iNumLinhas == 0) then 
      iNumLinhas = 1 -- Não achou nenhum "\r" -> ALTERADO PARA "\n"
      tLinhasMsg[iNumLinhas] = "~L000" .. sMsg
      LogDebug(string.format("tLinhasMsg[%03d] = %s", iNumLinhas, sMsg),1, I_LOGDEBUG_TIPO_UI)
   end
   LogDebug("[sIU] iNumLinhas = " .. iNumLinhas, 1, I_LOGDEBUG_TIPO_UI)
   
   return tLinhasMsg, iNumLinhas
end


---
-- Exibe o relatório na tela (terminais touch)
--@author Marcelo Tosihiko Sigueoka
--@param iOpcaoMenu Indica a opção do relatório a ser impresso
--@param sNomeTabela Nome da tabela a ser usada na impressão
--@param tRelatorio Tabela contendo os dados do relatório a ser impresso
--@param tInfImp Tabela que contém informações de controle sobre a impressão
--@param iTimeout Tempo de timeout da tela
function graph.ExibeRelatorioTela(sTitRelatorio, sRelatorio, tTeclaRetorno, tBotoesInferiores, iTimeout)
   local tLinhasMsg = QuebraLinhasMsg(sRelatorio)
   
   if (not iTimeout) then
      iTimeout = TEMPO_OPERADOR
   end
      
   return ExecutaTelaRolagem(gtTipoTela.RELAT_TELA, tLinhasMsg, tTeclaRetorno, tBotoesInferiores, iTimeout, sTitRelatorio, gtMsg.MSGMNU_DESCARTAR_IMP, nil)
end

---
-- Função que inicia uma animação, sobreposta a uma mensagem exibida em tela
--@author Marcelo Tosihiko Sigueoka
--@param tAnimacao Tabela contendo os scripts e os timeouts que definem a animação a ser gerada
--@param iQtdeAnim Quantidade de scripts existentes para se gerar a animação
--@param fResetaPosInicio Caso seja false, inicia uma nova animação a partir do ponto em que a animação anterior parou
--@return iRet Código de retorno
function IniciaAnimacao(tAnimacao, iQtdeAnim, fResetaPosInicio)
   LogDebug("[sIU] tsIU.IniciaAnimacao()", 1)
   
   -- Indica se a posição de início da animação deve ser resetada - Default = true
   local iResetaPos = 1
   if (not fResetaPosInicio) then
      iResetaPos = 0
   end
   --tsBas.SetaParametroInt (iResetaPos, TAG_DSPL_CLEAR, pEntrada)
   
   -- Quantidade de Scripts usado na animação
   --tsBas.SetaParametroInt (iQtdeAnim, TAG_DSPL_NUM_SCRIPTS, pEntrada)
   
   -- Seta cada script e o respectivo timeout (em ms)
   for iIdxAnim = 1, iQtdeAnim do    
      LogDebug("[sIU] sScript[" .. iIdxAnim .. "] = " .. tAnimacao[iIdxAnim].sScript, 1, I_LOGDEBUG_TIPO_UI)
      --tsBas.SetaParametroStr (tAnimacao[iIdxAnim].sScript, TAG_DSPL_MSG, pEntrada)
      --tsBas.SetaParametroInt (tAnimacao[iIdxAnim].iTimeout, TAG_DSPL_ANIM_TIMEOUT, pEntrada)
   end
   
   gfAnimacaoAtiva = true -- Seta variável global de controle
   
   -- Chama módulo externo e retorna
   --printer.print("------------ ui.graphical_anim_start(iResetaPos,iQtdeAnim,tAnimacao) = " .. tostring(iResetaPos) .. " = " .. tostring(iQtdeAnim) .. " = " .. tostring(#tAnimacao))
   return ui.graphical_anim_start(iResetaPos,iQtdeAnim,tAnimacao)
      
end

---
-- Função que finaliza uma animação
--@author Marcelo Tosihiko Sigueoka
--@param não há
--@return iRet Código de retorno
function graph.FinalizaAnimacao()
   LogDebug("[sIU] tsIU.FinalizaAnimacao()", 1, I_LOGDEBUG_TIPO_UI)
  
   gfAnimacaoAtiva = false -- Seta variável global de controle
   
   -- Chama módulo externo e retorna
   return ui.graphical_anim_end()
   --return AP_USR.RCDEV_DSPL_iExec (CMD_DSPL_ANIM_END, pEntrada, pSaida)
end




---
-- Função que configura um frame de animação
--@author Marcelo Tosihiko Sigueoka
--@param tAnimacao Tabela contendo os frames para a animação
--@param iIdxAnim Índice do frame dentro da tabela de animação
--@param sScript Tela a ser desenhada
--@param iTimeout Timeout para a tela
--@return iQtdeFrames Quantidade de frames que forma a animação
local function SetaFrameAnimacao(tAnimacao, iIdxAnim, sScript, iTimeout)
   tAnimacao[iIdxAnim] = {}
   tAnimacao[iIdxAnim].sScript = sScript
   tAnimacao[iIdxAnim].iTimeout = iTimeout
   iIdxAnim = iIdxAnim + 1
   return iIdxAnim
end


---
-- Função que configura uma animação
--@author Marcelo Tosihiko Sigueoka
--@param não há
--@return tAnimacao Tabela contendo os frames para a animação
--@return iQtdeFrames Quantidade de frames que forma a animação
local function SetaAnimacao()
   local iIdxAnim, iTimeout = 1, 400 
   local sConfigScr = "~!~D035"
   
   if (PLATF_DISPL_TOUCH) then
      sConfigScr = "~!~D083"
   elseif (PLATF_DISPL_GRAFICO) then
      sConfigScr = "~!~D035"
   end
   
   local tAnimacao = {}   
   
   iIdxAnim = SetaFrameAnimacao(tAnimacao, iIdxAnim, sConfigScr .. "~I200", iTimeout)
   iIdxAnim = SetaFrameAnimacao(tAnimacao, iIdxAnim, sConfigScr .. "~I201", iTimeout)
   iIdxAnim = SetaFrameAnimacao(tAnimacao, iIdxAnim, sConfigScr .. "~I202", iTimeout)
   iIdxAnim = SetaFrameAnimacao(tAnimacao, iIdxAnim, sConfigScr .. "~I203", iTimeout)
   
   return tAnimacao, #tAnimacao
end

---
-- Verifica se uma mensagem deve ser exibida juntamente com uma animação
--@author Marcelo Tosihiko Sigueoka
--@param sMsg Mensagem a ser exibida na tela
--@return fMostraAnimacao True, caso a animação deva ser exibida, False, caso contrário
--[[
local function MsgComAnimacao(sMsg)   
   local tMsgComAnimacao = {
      [gtMsg.MSGDSP_PROCESSANDO]      = true,
      [gtMsg.MSGDSP_AGUARDE]          = true,
      [gtMsg.MSGDSP_VERIFICANDO_LOTE] = true,
	  [gtMsg.MSGDSP_ATUALIZANDO]      = true,
   }
   
   if (tMsgComAnimacao[string.lower(Trim(sMsg))]) then
      return true
   end
   
   return false
end 
--]]

---
-- Apresenta um texto na tela. Verifica se uma animação deve ser exibida ao mesmo tempo.  
--@author Marcelo Tosihiko Sigueoka
--@param sMsg String a ser apresentada na tela
--@return iRet Código de retorno
--[[
function graph.ExibeMensagem(sMsg)
   local fAnimacao = false
   local fResetaAnimacao = not gfAnimacaoAtiva 
   
   --******* Controles para start/stop da thread de animacação *******
   if (MsgComAnimacao(sMsg)) then
      fAnimacao = true -- A animação deve ser exibida
      
      if ((gfAnimacaoAtiva) and (gsUltMsgAnimacao == sMsg)) then
         -- Evita que mensagens repetidas atrapalhem a animação
         return RET_OK
      end
      
      gsUltMsgAnimacao = sMsg  -- Armazena a mensagem que será exibida
   end
   
   --******* Exibe mensagem *******
   local iRet = graph.Mensagem({sTitle = "",sTexto = sMsg, fImagemRede = true})

   
   --******* Controles para start/stop da thread de animacação *******
   if (fAnimacao) then
      local tAnimacao, iQtdeAnim = SetaAnimacao()      
      IniciaAnimacao(tAnimacao, iQtdeAnim, fResetaAnimacao)      
   end
   
   return iRet
end
--]]

---
-- Apresenta um texto na tela. Verifica se uma animação deve ser exibida ao mesmo tempo.  
--@author Marcelo Tosihiko Sigueoka
--@param sMsg String a ser apresentada na tela
--@return iRet Código de retorno
function graph.CriaAnimacao()
   --local fAnimacao = false
   local fResetaAnimacao = not gfAnimacaoAtiva 
   
   --******* Controles para start/stop da thread de animacação *******
   --[[
   if (MsgComAnimacao(sMsg)) then
      fAnimacao = true -- A animação deve ser exibida
      
      if ((gfAnimacaoAtiva) and (gsUltMsgAnimacao == sMsg)) then
         -- Evita que mensagens repetidas atrapalhem a animação
         return RET_OK
      end
      
      gsUltMsgAnimacao = sMsg  -- Armazena a mensagem que será exibida
   end
   
   --******* Exibe mensagem *******
   local iRet = graph.Mensagem({sTitle = "",sTexto = sMsg, fImagemRede = true})
	--]]
   
   --******* Controles para start/stop da thread de animacação *******
  -- if (fAnimacao) then
      local tAnimacao, iQtdeAnim = SetaAnimacao()      
      IniciaAnimacao(tAnimacao, iQtdeAnim, fResetaAnimacao)      
   --end
   
   return iRet
end

function Split(sTexto, sSeparador)
        local tCampos = {}
        local sPadrao = string.format("([^%s]+)", sSeparador)

        sTexto:gsub(sPadrao, function(c) tCampos[#tCampos+1] = c end)

        return tCampos
end