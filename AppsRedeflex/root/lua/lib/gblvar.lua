---
-- Arquivo de variáveis globais
--@author Marcelo Tosihiko Sigueoka
--@release POS.07.00
--@copyright Redecard

-- Valor de uma transação CLTS -> usada no callback
gsValorCTLS = ""

-- Máquina de estados do menu (utilizado no botão "voltar")
gtEstadoMenu = {}
gtEstadoMenu.iEstado = 0
gtEstadoMenu.iEstadoAnterior = -1

-- Tabela contendo constantes para controle do tipo de relatório a ser impresso
gtOpcaoRel = {}
gtOpcaoRel.FINALIZ         = 1 
gtOpcaoRel.RESUMIDO        = 2
gtOpcaoRel.DETALHADO       = 3
gtOpcaoRel.REIMPRESSAO     = 4   
gtOpcaoRel.FNLZ_LOTE_CHEIO = 5
gtOpcaoRel.ESTORNO         = 6

-- Tabela usada para o retorno de alguns menus
gtOpcaoMenu = {}
gtOpcaoMenu.SIM             = 1
gtOpcaoMenu.NAO             = 2
gtOpcaoMenu.IMPRIME_SIMUL   = 100
gtOpcaoMenu.NOVA_SIMUL      = 101
gtOpcaoMenu.CONTRATAR_SIMUL = 102
gtOpcaoMenu.NOVO_VALOR      = 103

-- Tabela usada para definir os tipos de exibição na função ExibeTelaScroll
gtTipoTela = {}
gtTipoTela.DEFAULT        = 1  -- Exibe a tela enviada 
gtTipoTela.RELAT_TELA     = 2  -- Função de Relatório em Tela
gtTipoTela.MENU           = 3  -- Função Menu com botões pequenos (2 botões por linha)
gtTipoTela.MENU_BT_GRANDE = 4  -- Função Menu com botões grandes (1 botão por linha)
gtTipoTela.INFORMACOES    = 5  -- Função que apresenta informações sobre o terminal na tela
gtTipoTela.MENU_SIMPLES   = 6  -- Função de Menu Simples (apenas 2 itens)

-- Tabela contendo constantes para o tipo de mascara de entrada de dados
gtOpcaoMasc = {}
gtOpcaoMasc.IP              = 1 
gtOpcaoMasc.VALOR           = 2 -- valor
gtOpcaoMasc.HORA            = 3 -- hora @@:@@
gtOpcaoMasc.VENC            = 4 -- vencimento @@/@@
gtOpcaoMasc.CELULAR         = 5 -- número do celular 
gtOpcaoMasc.CPF             = 6 -- número do CPF
gtOpcaoMasc.CONTACORRENTE   = 7 -- número do Conta corrente
gtOpcaoMasc.CEP             = 8 -- número do CEP

gfTrocouOperadora = false    -- utilizado para se trocar a APN na inicialização
gfParamComAlterados = false  -- utilizado para se atualizar a aplicação de Serviços com dados novos de inicialização
gfResetaContTmpOcio = false  -- utilizado para verificar se o contador de tempo ocioso deve ou não ser resetado
gfPriApagaBrilho    = true   -- utilizado para controlar a intensidade do brilho, na primeira vez o terminal diminui o brilho em 12s e depois em 20s
giBrilhoCont        = 0      -- contador para controlar quantas vezes a aplicação entrou na função de callback

giMostraStatusEthernet = 0 -- se 0 desabilita
                           -- se 1 exibe cabo conectado, 
                           -- se 2 exibe DHCP ou IP FIXO, 
                           -- se 3 exibe segurança,
                           -- se 4 exibe inicialização/baixa tecnica

-- Tabela global contendo os dados para serem usados na tela de senha, no callback
gtInfTelaSenha = {}
gtInfTelaSenha.iTran      = 0
gtInfTelaSenha.sValor     = ""
gtInfTelaSenha.iParcelas  = 0
gtInfTelaSenha.sValorParc = ""
gtInfTelaSenha.sMensagem  = ""
gtInfTelaSenha.sNumCelular= ""

-- Título usado em telas de senha de transaçõe específicas
gsTitTelaSenha = ""
  
-- Tabela global contendo os dados para gerar as telas idles
gtInfTelaIdle = {}
gtInfTelaIdle.iNumMsgs       = 0       -- Número de mensagens setadas para serem apresentadas na tela
gtInfTelaIdle.iIdProxMsg     = 0       -- Índice da próxima mensagem a ser apresentada na tela 

-- Tabela global contendo flags de controle para exibição de telas de bateria
gtTelasBateria = {}
gtTelasBateria.fIdleBatFraca  = false   -- True, caso o nível da bateria esteja baixa
gtTelasBateria.fIdlePrimCarga = false   -- True, caso a bateria não esteja "inicializada"
gtTelasBateria.fAvisoBatFraca = false   -- True, caso a tela de aviso de bateria fraca já tenha sido setada na tela de idle
gtTelasBateria.fExibirBatFraca= false   -- True, caso a tela de aviso de bateria fraca deva ser exibida
gtTelasBateria.fExibirBatCrit = false   -- True, caso a tela de aviso de bateria crítica deva ser exibida

-- Dados default para Ethernet
if debug then
   -- PKI de testes 
   gsPKI       = "64739481" 
else
   -- PKI de produção
   gsPKI       = "78617807"
end
giNII       = 997
gsIP1       = "189002006195"  -- IP primário de inicialização
gsIP1CERT   = "189002006195"  -- IP primário Lyra para obter o certificado SSL
gsIP2       = "177154132225"  -- IP secundário de inicialização
gsIP2CERT   = "177154132225"  -- IP secundário Lyra para obter o certificado SSL
gsPORTA     = "22021"         -- Porta de inicialização
gsPORTACERT = "7221"          -- Porta Lyra para obter o certificado SSL
gsLISTCERT  = "LIST.CRT"
gsPRIVKEY1  = "PRIVKEY1.KEY"
gsPRIVKEY2  = "PRIVKEY2.KEY"
gsROOTCERT  = "LYRACAROOT.DAT"
gsREGION    = "Haute-Garonne"
gsLYRADD    = "0202028008"    -- Fixo
gsCOUNTRY   = "BR"
gsUltimoIP  = ""              -- último IP de conexão
gfBalanceamento = false       -- se true faz o balanceamento entre o IP primário e secundário
gfRenew_SSL  = false          -- renovação de certificado SSL, deve-se usar o mesmo ip do certificado SSL
giDiasVencer = 180            -- Dias para expiração do certificado
giDiasVencerMsg = 30          -- Dias para expiração do certificado e começa a exibir mensagem de aviso
giBytes_Enviados = 0          -- Número de bytes enviados numa mensagem para calcular a velocidade de envio
gsIP_Utilizado1 = ""          -- IP 1 utilizado para a comunicação Ethernet - usado para estatísticas
gsIP_Utilizado2 = ""          -- IP 2 utilizado para a comunicação Ethernet - usado para estatísticas

-- Constantes de tempo
giTEMPO_MSG_ALERTA     =  3000   --  3 segundos

-- Nome de Arquivos sempre em maiúsculo e até 8 caracteres
gsNOTES = "NOTES.DAT"

gsUltMsgErro = ""  -- última mensagem de erro mostrada pelo terminal (geralmente de telecom...)

-- Flag para controle de start/stop da thread de animação
gfAnimacaoAtiva = false     -- Flag que indica se a Thread de animação está ativa ou não

-- Variável que armazena a última mensagem com animação
gsUltMsgAnimacao = "" 

gsIconeModoCom = "" -- Ícone do modo comunicação que deve ser exibido na barra de status do terminal

-- Tabela contendo constantes para o tipo de teclado
gtTecladoAlfa = {}
gtTecladoAlfa.QWERTY     = 1
gtTecladoAlfa.QWERTY_MIN = 2
gtTecladoAlfa.NUMEROS    = 3
gtTecladoAlfa.SIMBOLOS   = 4

-- Define quais caracteres são permitidos para a digitação no teclado alfanumérico
gtTeclCaract = {}
gtTeclCaract.MAIUSC_NUM = 1  -- Permite apenas letras maiúsculas e números

-- Tabela contendo os parâmetros utilizados para a conexão com o host
gtParamCom = {}

-- Tabela que contém dados para cálculo das estatísticas de Serviço (Recarga de Celular)
gtEstatServ = {}



--Erros utilizados somente nos scripts Lua
RCRET_LUA_BASE			= 50000
RET_LUA_BASE            = RCRET_LUA_BASE
RET_FUNCAO_INVALIDA     = (RET_LUA_BASE +  1)
RET_NAO_PERMITIDO       = (RET_LUA_BASE +  2)
RET_LOTE_CHEIO          = (RET_LUA_BASE +  3)
RET_SENHA_INVALIDA      = (RET_LUA_BASE +  4)
RET_CARTAO_INVALIDO     = (RET_LUA_BASE +  5)
RET_CARTAO_PROBLEMA     = (RET_LUA_BASE +  6)
RET_TRAN_NAO_EXISTE     = (RET_LUA_BASE +  7)
RET_CARTAO_VENCIDO      = (RET_LUA_BASE +  8)
RET_MOEDA_INVALIDA      = (RET_LUA_BASE +  9)
RET_VALOR_INVALIDO      = (RET_LUA_BASE + 10)
RET_VERSAO_INCORRETA    = (RET_LUA_BASE + 11)
RET_CONFIGURE_COMUNIC   = (RET_LUA_BASE + 12)
RET_CONFIGURE_TERMINAL  = (RET_LUA_BASE + 13)
RET_INICIALIZE          = (RET_LUA_BASE + 14)
RET_ERRO_TRILHA_MAG     = (RET_LUA_BASE + 15)
RET_TERMINAL_BLOQUEADO  = (RET_LUA_BASE + 16)
RET_EFETUE_TESTE_COMUN  = (RET_LUA_BASE + 17)
RET_FINALIZE_TERMINAL   = (RET_LUA_BASE + 18)
RET_ERRO_DO_HOST        = (RET_LUA_BASE + 19)
RET_ERRO_TABELAS_INIC   = (RET_LUA_BASE + 20)
RET_TRANS_IGUAL_ANT     = (RET_LUA_BASE + 21)
RET_LOTE_VAZIO          = (RET_LUA_BASE + 22)
RET_ERR_EMV_NO_CHIP     = (RET_LUA_BASE + 23)
RET_ERR_EMV_NO_APL      = (RET_LUA_BASE + 24)
RET_ERR_EMV_NEGADA      = (RET_LUA_BASE + 25)
RET_ERR_EMV_RETIRADO    = (RET_LUA_BASE + 26)
RET_ERR_EMV_BLOQUEADO   = (RET_LUA_BASE + 27)
RET_ERR_EMV             = (RET_LUA_BASE + 28)
RET_ERR_EMV_REFERIDA    = (RET_LUA_BASE + 29)
RET_ERR_EMV_APL_INV     = (RET_LUA_BASE + 30)
RET_ERR_EMV_APL_BLOQ    = (RET_LUA_BASE + 31)
RET_ERR_SEM_DESFZTO     = (RET_LUA_BASE + 32)
RET_NAO_PERMITE_CHIP    = (RET_LUA_BASE + 33)
RET_SEM_TOM_DISC        = (RET_LUA_BASE + 34)
RET_ERRCFG_DEBVISTA     = (RET_LUA_BASE + 35)
RET_SEM_CUPOM           = (RET_LUA_BASE + 36)
RET_ERR_TELECARGA       = (RET_LUA_BASE + 37)
RET_CARTAO_INCORRETO    = (RET_LUA_BASE + 38)
RET_CARTAO_COM_CHIP     = (RET_LUA_BASE + 39)
RET_NAO_PERMITE_DIG     = (RET_LUA_BASE + 40)
RET_USE_VOUCHER         = (RET_LUA_BASE + 41)
RET_ERR_PCALL           = (RET_LUA_BASE + 42)
RET_FIM_VOUCHER         = (RET_LUA_BASE + 43)
RET_ERR_TRILHA          = (RET_LUA_BASE + 44)
RET_ERRO_TARJA          = (RET_LUA_BASE + 45)
RET_NAO_HA_MSG          = (RET_LUA_BASE + 46)
RET_TEL_AUSENTE         = (RET_LUA_BASE + 47)
RET_TERM_INOPERANTE     = (RET_LUA_BASE + 48)
RET_ERREMV_MAGNETICO    = (RET_LUA_BASE + 49)
RET_ERR_EMV_MODO_INV    = (RET_LUA_BASE + 50)
RET_FUNCAO_INATIVA      = (RET_LUA_BASE + 51)
RET_FALHA_ATUALIZ_SENHA = (RET_LUA_BASE + 52)
RET_ERR_EMV_NO_APL_CTLS = (RET_LUA_BASE + 53)
RET_SEM_TRS_IMP         = (RET_LUA_BASE + 54)
RET_OPER_NAO_IDENTIF    = (RET_LUA_BASE + 55)
RET_PAUSA_TELECARGA     = (RET_LUA_BASE + 56)
RET_ERR_ATUALIZACAO     = (RET_LUA_BASE + 57)
RET_MENU_INICIAL        = (RET_LUA_BASE + 58)
RET_MENU_VOLTAR         = (RET_LUA_BASE + 59)
RET_SERV_NAO_DISP       = (RET_LUA_BASE + 60)