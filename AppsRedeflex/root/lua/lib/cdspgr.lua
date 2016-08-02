---
-- Arquivo de mensagens para display, para terminais gr�ficos
--@author Marcelo Tosihiko Sigueoka
--@release pos.08.00
--@copyright Rede
-- 
 
-- MSGMEN - Mensagem menu
-- MSGTIT - Mensagem titulo
-- MSGDSP - Mensagem display
-- MSGINP - Mensagem input
-- MSGERR - Mensagem erro
 
-- Tabela usada mensagem em display
gtMsg = {}
gtMsg.MSGMNU_FECHAMENTO_EMISSOR = "fechamento emissor"
gtMsg.MSGMNU_CONF_PRE_AUT       = "confirmar"
gtMsg.MSGMNU_INICIALIZACAO      = "inicializa��o"
gtMsg.MSGMNU_CARTAO             = "cart�o"
gtMsg.MSGMNU_DINHEIRO           = "dinheiro"
gtMsg.MSGMNU_CREDITO            = "cr�dito"
gtMsg.MSGMNU_DEBITO             = "d�bito"
gtMsg.MSGMNU_CREDIARIO          = "credi�rio" 
gtMsg.MSGMNU_DISTRIBUTION       = "distribui��o"
gtMsg.MSGMNU_ADMINISTRATIVO     = "administra"
gtMsg.MSGMNU_TECNICO            = "t�cnico"
gtMsg.MSGMNU_ATENDIMENTO        = "atendimento"
gtMsg.MSGMNU_PRE_AUTORIZACAO    = "pr�"
gtMsg.MSGMNU_RESUMO_VENDAS      = "resumo vendas"
gtMsg.MSGMNU_RELATORIOS         = "relat�rios"
gtMsg.MSGMNU_CAPTURA_CREDITO    = "captura cr�dito"
gtMsg.MSGMNU_CORPORATIVO        = "corporativo"
gtMsg.MSGMNU_ESTORNO            = "estorno"
gtMsg.MSGMNU_FINALIZACAO        = "finaliza��o"
gtMsg.MSGMNU_REIMPRESSAO        = "reimpress�o"
gtMsg.MSGMNU_VOUCHER            = "voucher"
gtMsg.MSGMNU_CONSULTA_SERASA    = "consulta � cheque"
gtMsg.MSGMNU_BAIXA_CAMPO        = "t�cnico campo"
gtMsg.MSGMNU_BAIXA_CENTRAL      = "central atendimento"
gtMsg.MSGMNU_MENU_P_LABEL       = "private label"
gtMsg.MSGMNU_RAV                = "rav"
gtMsg.MSGMNU_BAIXA_TECNICA      = "baixa t�cnica"
gtMsg.MSGMNU_MENU_PRE_AUT       = "pr�-autoriz"
gtMsg.MSGMNU_VOUCHER_FROTA      = "voucher frota"
gtMsg.MSGMNU_VOUCHER_TROC_SENHA = "troca de senha"
gtMsg.MSGMNU_VOUCHER_RELAT      = "relat�rio"
gtMsg.MSGMNU_VOUCHER_ABAST      = "abastecer"
gtMsg.MSGMNU_VOUCHER_TROC_OLEO  = "troca de �leo"
gtMsg.MSGMNU_VOUCHER_LAVAGEM    = "lavagem"
gtMsg.MSGMNU_VOUCHER_PEDAGIO    = "ped�gio"
gtMsg.MSGMNU_VOUCHER_OUTROS     = "outros"
gtMsg.MSGMNU_MENU_CONSULTAS     = "consulta � cheque" 
gtMsg.MSGMNU_FONESHOP           = "celular"
gtMsg.MSGMNU_MENU_OUTRAS_OPCOES = "outras op��es"

gtMsg.MSGMNU_APAGA_LOTE         = "apaga lote"
gtMsg.MSGMNU_APAGA_DESFAZIMENTO = "apaga desfazimento"
gtMsg.MSGMNU_APAGA_TUDO         = "apaga tudo"
gtMsg.MSGMNU_IMPRIME_LOG        = "imprime log"
gtMsg.MSGMNU_APAGA_CERTIF       = "apaga certificado"

gtMsg.MSGMNU_SIMULACAO          = "simular"
gtMsg.MSGMNU_CONTRATACAO        = "contratar"
gtMsg.MSGMNU_NOVA_SIMULACAO     = "nova simula��o"
gtMsg.MSGMNU_IMP_SIMULACAO      = "imprime simula��o"

gtMsg.MSGMNU_CANCELA            = "cancela"
gtMsg.MSGMNU_SUBIR              = "subir"
gtMsg.MSGMNU_DESCER             = "descer"
gtMsg.MSGMNU_VOLTAR             = "voltar"
gtMsg.MSGMNU_FUNCAO             = "fun��o"
gtMsg.MSGMNU_MENU               = "menu"    
gtMsg.MSGMNU_INICIAL            = "inicial"
gtMsg.MSGMNU_CONFIRMA           = "confirma"
gtMsg.MSGMNU_OK                 = "ok"
gtMsg.MSGMNU_AGORA              = "agora"
gtMsg.MSGMNU_AGENDAR            = "agendar"
gtMsg.MSGMNU_AVANCAR            = "avan�ar"

gtMsg.MSGMNU_ESCOLHA_OPCAO      = "escolha uma op��o:"
gtMsg.MSGMNU_ESCOLHA_DIA        = ""
gtMsg.MSGMNU_ESCOLHA_OPERADORA  = "escolha a operadora:"
gtMsg.MSGMNU_TIPO_COMUNICACAO   = "tipo de comunica��o"
gtMsg.MSGMNU_REDE_LOCAL         = "\rrede local\r\r"

gtMsg.MSGMNU_ACHEI_RECHEQUE     = "achei-recheque"

gtMsg.MSGMNU_DIAL               = "dial"
gtMsg.MSGMNU_GPRS               = "GPRS"
gtMsg.MSGMNU_GSM                = "GSM"
gtMsg.MSGMNU_WNB                = "WNB"
gtMsg.MSGMNU_EPACK              = "e-pack"
gtMsg.MSGMNU_MODO_DIAL          = "modem mode dial"
gtMsg.MSGMNU_MODO_EPACK         = "modem mode e-pack"
gtMsg.MSGMNU_ETHERNET           = "ethernet"

gtMsg.MSGMNU_NOTES              = "novidades"
gtMsg.MSGMNU_PAGAMENTOS         = "pagamentos"
gtMsg.MSGMNU_ATUALIZA           = "atualizar"
gtMsg.MSGDSP_VLR                = "vlr:%12.12s\r"
gtMsg.MSGDSP_VALOR              = "valor:%10.10s\r"
gtMsg.MSGDSP_VALOR_PARCIAL      = "digite o valor parcial\r" ..
                                  "desejado:"
gtMsg.MSGDSP_TECLADO            = "tecla? %10.10s\r"

gtMsg.MSGMNU_AVISTA             = "� vista"
gtMsg.MSGMNU_PARCELADO_ADM      = "parc. emissor"
gtMsg.MSGMNU_PARCELADO_EST      = "parc. estabel"
gtMsg.MSGMNU_CAPTURA            = "captura"
gtMsg.MSGMNU_PENDENTES          = "pendentes"

gtMsg.MSGMNU_PROX_TRANS         = "pr�xima transa��o"
gtMsg.MSGMNU_SELEC_ATUAL        = "selecionar atual"
gtMsg.MSGMNU_SELECIONAR         = "selecionar"
gtMsg.MSGMNU_CANCELAR           = "cancelar"
gtMsg.MSGMNU_PROX_ITEM          = "pr�ximo"

gtMsg.MSGMNU_CANCELAMENTO       = "cancel. pr�"
gtMsg.MSGMNU_CONSULTA           = "consulta"

gtMsg.MSGMNU_NAO                = "n�o"
gtMsg.MSGMNU_SIM                = "sim"
gtMsg.MSGMNU_HOJE               = "hoje"
gtMsg.MSGMNU_PROXIMO            = "pr�ximo dia �til"
gtMsg.MSGMNU_PARCELADO          = "parcelado"
gtMsg.MSGMNU_PRE                = "pr�"
gtMsg.MSGMNU_PRE_DATADO         = "pr�-datado"
gtMsg.MSGMNU_ROTATIVO           = "rotativo"
gtMsg.MSGMNU_VENDA              = "venda"
gtMsg.MSGMNU_TOM                = "tom"
gtMsg.MSGMNU_PULSO              = "pulso"
gtMsg.MSGMNU_DHCP               = "DHCP"
gtMsg.MSGMNU_IPFIXO             = "IP fixo"

gtMsg.MSGMNU_REIMP_ESPECIAL     = "transa��o espec�fica"
gtMsg.MSGMNU_REIMP_ULTIMA       = "�ltima transa��o"
gtMsg.MSGMNU_VIA_ESTAB          = "estabelecimento"
gtMsg.MSGMNU_VIA_CLIENTE        = "cliente"
gtMsg.MSGMNU_VIA_AMBAS          = "ambas"
gtMsg.MSGMNU_VIA_NENHUMA        = "nenhuma"

gtMsg.MSGMNU_CANCELAR_TRS       = "cancelar transa��o"
gtMsg.MSGMNU_MOV_PENDENTE       = "mover para pendentes"

--  menu p/ ausencia de CVC2 
gtMsg.MSGMNU_NAO_POSSUI         = "n�o possui"
gtMsg.MSGMNU_ILEGIVEL           = "ileg�vel"

-- Menu de informa��es
gtMsg.MSGMNU_MAC_ADDRESS        = "MAC address:" 
gtMsg.MSGMNU_MASCARA            = "m�scara da rede:" 
gtMsg.MSGMNU_GATEWAY            = "gateway da rede:" 
gtMsg.MSGMNU_IPPOS              = "IP do POS:"

-- --------------- Menus Relatorios -----------------
-- M�ximo 13 caracteres         =  1234567890123
gtMsg.MSGMNU_REL_RESUMIDO       = "resumido"
gtMsg.MSGMNU_REL_DETALHADO      = "detalhado"
gtMsg.MSGMNU_ULT_FINALIZ        = "�ltima finaliza��o"
gtMsg.MSGMNU_REL_ESTORNO        = "estorno"

-- --------------- Menus rav ------------------------
gtMsg.MSGMNU_ANTECIPACAO        = "antecipa��o"
gtMsg.MSGMNU_CONS_ANTECIP       = "consulta"
gtMsg.MSGMNU_RAV_TOTAL          = "rav total"
gtMsg.MSGMNU_RAV_PARCIAL        = "rav parcial"
gtMsg.MSGMNU_CONF_ANTEC         = "confirma antecipa��o"
gtMsg.MSGMNU_IMPRIMIR           = "imprimir"
gtMsg.MSGMNU_CONFIRMA_RAV       = "confirma"
gtMsg.MSGMNU_NAO_CONFIRMA_RAV   = "n�o confirma"
gtMsg.MSGMNU_RAV_RESGATE        = "resgate de senha"
gtMsg.MSGMNU_RAV_AVULSO         = "rav avulso"
gtMsg.MSGMNU_RAV_AUTOMATICO     = "rav autom�tico"
gtMsg.MSGMNU_SALDO_DISP         = "saldo dispon�vel"

gtMsg.MSGMNU_RAV_TX_DESC        = "taxa per�odo:"
gtMsg.MSGMNU_RAV_MES            = "taxa m�s:"
gtMsg.MSGMNU_RAV_DATA_RECEB     = "data de recebimento:"
gtMsg.MSGMNU_RAV_RECEBIMENTO    = "recebimento:"
gtMsg.MSGMNU_RAV_RECEB          = "valor a receber:"

-- --------------- Menus Integrados ------------------
gtMsg.MSGMNU_ADMINISTRATIVO_2   = "administra"

-- --------------- Menus Finaliza��o ------------------
gtMsg.MSGMNU_DESCARTAR_IMP      = "descartar impress�o?"

gtMsg.MSGMNU_DESCARTAR_IMP2     = "deseja descartar\r" .. 
                                  "impress�o?"
                                  
gtMsg.MSGMNU_FINALIZ_AUT        = "finaliza��o autom�tica"

gtMsg.MSGMNU_DESEJA_ATUALIZ     = "deseja atualizar o\r" .. 
                                  "terminal agora?"

gtMsg.MSGMNU_NOVA_TELECARGA     = "deseja realizar\r"    ..
                                  "uma nova telecarga?"         

gtMsg.MSGMNU_VER_RELEASE_NOTES  = "deseja conhecer as novas\r" .. 
                                  "fun��es?"
                                  
--____________________________________________________________________________

--   T�tulos de menu
   
--   1 �nica linha
--_____________________________________________________________________________


gtMsg.MSGTIT_MENU_PRINCIPAL     = ""
gtMsg.MSGTIT_CANCEL2            = "cancelamento"
gtMsg.MSGTIT_GIGA_TESTE         = "giga de teste"
gtMsg.MSGTIT_CONFIGURACAO       = "configura��o"
gtMsg.MSGTIT_CONFIGURACAO_WNB   = "configura��o WNB"
gtMsg.MSGTIT_CONSULTAS          = "consultas"
gtMsg.MSGTIT_OUTRAS_OPCOES      = "outras op��es" 
gtMsg.MSGTIT_P_LABEL            = "private label"
gtMsg.MSGTIT_CONTINGENCIA       = "conting�ncia"
gtMsg.MSGTIT_CAPTURA_CREDITO    = "captura cr�dito"
gtMsg.MSGTIT_CREDITO            = "cr�dito"
gtMsg.MSGTIT_DEBITO             = "d�bito"
gtMsg.MSGTIT_CREDIARIO          = "credi�rio"
gtMsg.MSGTIT_CREDIARIO_CONTRAT  = "contrata��o"
gtMsg.MSGTIT_CREDIARIO_CONSULT  = "simula��o"
gtMsg.MSGTIT_DISTRIBUTION       = "distribui��o"
gtMsg.MSGTIT_VOUCHER            = "voucher"
gtMsg.MSGTIT_VOUCHER_FROTA      = "voucher frota"
gtMsg.MSGTIT_PRE_AUTORIZACAO    = "pr�-autoriza��o"
gtMsg.MSGTIT_CONF_PRE_AUT       = "confirma��o"
gtMsg.MSGTIT_TECNICO            = "t�cnico"
gtMsg.MSGTIT_FECHAMENTO_EMISSOR = "fechamento emissor"
gtMsg.MSGTIT_INICIALIZACAO      = "inicializa��o"
gtMsg.MSGTIT_TESTE_COMUNICACAO  = "teste de comunica��o"
gtMsg.MSGTIT_FINALIZACAO        = "relat�rios"
gtMsg.MSGTIT_RESUMO_VENDAS      = "resumo de vendas"
gtMsg.MSGTIT_BAIXA_TECNICA      = "baixa t�cnica"
gtMsg.MSGTIT_PESQUISA_DOCUMENTO = "pesquisa documento"
gtMsg.MSGTIT_ESTORNO            = "estorno"
gtMsg.MSGTIT_REIMPRESSAO        = "reimpress�o"
gtMsg.MSGTIT_FONESHOP           = "celular"
gtMsg.MSGTIT_FONESHOP_CAPT      = "transa��o"
gtMsg.MSGTIT_TROCA_SENHA        = "troca de senha do lojista"
gtMsg.MSGTIT_CREDLOJA           = "cred.consumidor"

gtMsg.MSGTIT_RAV                = "rav"
gtMsg.MSGTIT_TIPO_COMUNICACAO   = gtMsg.MSGTIT_CONFIGURACAO
gtMsg.MSGTIT_TIPO_COMUNICACAO2  = "tipo de comunica��o?"
gtMsg.MSGTIT_CONSULTA           = "consulta"
gtMsg.MSGTIT_ADMINISTRATIVO     = "administra"

gtMsg.MSGTIT_IMP_VIA_CLIENTE    = "imprimir via\r" ..
                                  "do cliente?"
gtMsg.MSGTIT_IMP_VIA_ESTAB      = "imprimir comprovante?"
gtMsg.MSGTIT_IMP_QUAL_VIA       = "imprimir qual via?"
gtMsg.MSGTIT_IMP_DESCART_VIA    = "deseja descartar\r" ..
                                  "via do cliente?"

gtMsg.MSGTIT_QUEDA_ENERGIA      = "queda de energia"                                  
gtMsg.MSGTIT_QUEDA_ENERGIA2     = "estornar AUTE: %06d"                                  

gtMsg.MSGTIT_TERM_CONECTADO     = "terminal conectado?"   

gtMsg.MSGTIT_TENTAR_NOVAMENTE   = "tentar novamente?"

gtMsg.MSGTIT_TENTAR_NOV_ATUALIZ = "realizar nova tentativa de\r" .. 
                                  "atualiza��o?"

gtMsg.MSGTIT_REALIZAR_CARGA     = "realizar carga:\r"    ..
                                  "<1> sim\r"            ..
                                  "<2> n�o"

gtMsg.MSGTIT_REALIZAR_CARGA2    = "realizar o download?"

gtMsg.MSGTIT_CARGA_CHAVES       = "     inje��o\r"       ..
                                  "    de chaves"
gtMsg.MSGTIT_ANTEC_VENDA        = "antecipa��o de vendas"
gtMsg.MSGTIT_ANTEC_HOJE         = "antecipa��o hoje"
gtMsg.MSGTIT_ANTEC_PROX         = "antecipa��o pr�ximo"
gtMsg.MSGTIT_VEL_COMUNIC        = "velocid.comunic"
gtMsg.MSGTIT_RELATORIOS         = "relat�rios"
gtMsg.MSGTIT_SELEC_APP          = "selecione aplic"
gtMsg.MSGTIT_CONF_APP           = "confirma aplica��o:"
gtMsg.MSGTIT_VOUCHER_ABAST      = "abastecimento"

-- Recarga de celular
gtMsg.MSGTIT_RECARGA_CEL        = "recarga celular"
gtMsg.MSGTIT_RECARGA_CEL2       = "recarga de celular"
gtMsg.MSGMNU_SELECIONE_OPER     = "selecione operadora:"
gtMsg.MSGINP_NUM_CELULAR        = "ddd + n. celular:"
gtMsg.MSGINP_NUM_CELULAR2       = "celular:"
gtMsg.MSGINP_CONF_NUM_CELULAR   = "confirme ddd + n. celular:"
gtMsg.MSGERR_NUM_CEL_INCORRETO  = "n. do celular\r" ..
                                  "incorreto"
gtMsg.MSGMNU_VALOR_RECARGA      = "valor da recarga:"
gtMsg.MSGMNU_RECARGA_CEL        = "recarga celular"

--____________________________________________________________________________
--   Nomes das opera��es
--____________________________________________________________________________
gtMsg.MSGOPE_INICIALIZACAO      = "inicializa��o"
gtMsg.MSGOPE_TELECARGA          = "telecarga"
gtMsg.MSGOPE_TESTE_COMUNICACAO  = "teste comunic."
gtMsg.MSGOPE_CANCELAMENTO       = "estorno"
gtMsg.MSGOPE_INIT_SSL           = "ssl init"


--   Mensagem apresentadas durante a comunica��o com a rede

gtMsg.MSGDSP_AGUARDANDO_LINHA   = "  linha em uso"
gtMsg.MSGDSP_AGUARDANDO_TOM     = "sem tom discagem"
gtMsg.MSGDSP_AGUARDE            = "aguarde"
gtMsg.MSGDSP_DISCANDO           = "discando %d"
gtMsg.MSGDSP_CONECTANDO         = "conectando"
gtMsg.MSGDSP_DISCANDO_GSM       = "discando"
gtMsg.MSGDSP_PROCESSANDO        = "processando"
gtMsg.MSGDSP_IMPRIMINDO         = "imprimindo"
gtMsg.MSGDSP_IMPRIM_LOTE_CHEIO  = "lote cheio\r"      ..
                                  "imprimindo"
gtMsg.MSGDSP_PFV_AGUARDE        = "por favor,\r"      ..
                                  "aguarde um\r"      ..
                                  " instante"
gtMsg.MSGDSP_COBRANCA_USO       = "a conting�ncia\r"  ..
                                  "dial pode gerar\r" ..
                                  "cobran�a de uso\r" ..
                                  "da linha telef�nica."

gtMsg.MSGDSP_AGUARDE_REBOOT     = "aguarde...\r"      ..
                                  "reiniciando o terminal"

gtMsg.MSGDSP_AGUARDE_REINICIANDO= "aguarde... \r"     ..
                                  "reiniciando o\r"   ..
                                  "terminal"
gtMsg.MSGDSP_REGISTRANDO        = "registrando"

gtMsg.MSGDSP_DESTAQUE_PRI_VIA   = "destaque a via 1\r"..
                                  "pressione entra"

gtMsg.MSGDSP_DESTAQUE_IMPRESSAO = "destaque a\r"      ..
                                  "impress�o"

gtMsg.MSGDSP_PENDENTE_FONESHOP  = "celular: (%02s)%s-%s\r"

gtMsg.MSGDSP_POSICAO_VENDA      = "%s\r"              ..
                                  "%02s itens\r"      ..
                                  "%s"

gtMsg.MSGDSP_CARGA_APLICATIVO   = "realizando o download\r"     ..
                                  "de nova aplica��o"
gtMsg.MSGDSP_PAUSAR_CARGA       = "para pausar o download\r" ..
                                  "pressione a tecla entra"

                                 -- msg em mai�sculo
gtMsg.MSGDSP_CARGA_APLICATIVO_OK= "terminal atualizado\r" .. 
                                  "com sucesso"
gtMsg.MSGDSP_DOWNLOAD_OK        = "download conclu�do!"
gtMsg.MSGDSP_INIT_SSL_OK        = "ssl init ok"
gtMsg.MSGDSP_APAGADO_CERTIF     = "certificado ssl\r" ..
                                  "apagado"

gtMsg.MSGDSP_EFETUE_BX_TECNICA  = "    efetue\r"      ..
                                  " baixa t�cnica"
gtMsg.MSGDSP_MOV_PENDENTE       = "transa��o movida\r"..
                                  "para pendentes"
gtMsg.MSGDSP_NRO_SIMCARD        = "n�mero do SIM card:\r"

gtMsg.MSGDSP_DIAS_VENCER        = "faltam %02d dias\r"   ..
                                  "p/ o certificados\r"  ..
                                  "vencer.\r"            ..
                                  "contate rede"
gtMsg.MSGDSP_DIAS_VENCER_DISC   = "faltam %02d dias\r"   ..
                                  "p/ o certificados\r"  ..
                                  "vencer. aguarde,\r"   ..
                                  "discando..."
gtMsg.MSGDSP_ATUALIZ_TERMINAL   = "existe uma atualiza��o\r" .. 
                                  "para o seu terminal"
gtMsg.MSGDSP_SERA_ATUALIZ       = "seu terminal ser�\r"     ..
                                  "atualizado na pr�xima\r" ..
                                  "finaliza��o"
gtMsg.MSGDSP_AGUARDE_ATUAL      = "aguarde, seu\r"  .. 
                                  "terminal ser�\r" .. 
                                  "atualizado"
gtMsg.MSGDSP_MANTER_LIGADO      = "mantenha ligado\r"    ..
                                  "a tomada durante\r"   ..
                                  "todo o processo"

gtMsg.MSGTIT_ATUALIZ_PENDENTE   = "atualiza��o pendente!"
gtMsg.MSGDSP_ATUALIZ_PENDENTE   = "conclua a atualiza��o\r" ..
                                  "antes de iniciar\r" ..
                                  "um novo download"

                                  
--____________________________________________________________________________
--   Mensagens de erro
--____________________________________________________________________________


gtMsg.MSGRETCON_NAOATENDE       = "linha n�o atende"

gtMsg.MSGRETCON_OCUPADO         = "linha ocupada"

gtMsg.MSGRET_CANCELADO          = "opera��o cancelada"
gtMsg.MSGRET_TIMEOUT            = "opera��o cancelada"
gtMsg.MSGRET_ERR_ARQUIVOS       = "problema\r"           ..
                                  "arquivos"
gtMsg.MSGRET_ERR_RELOGIO        = "problema\r"           ..
                                  "rel�gio"
gtMsg.MSGRET_ERR_BUZZER         = "problema\r"           ..
                                  "buzzer"
gtMsg.MSGRET_ERR_DISPLAY        = "problema\r"           ..
                                  "display"
gtMsg.MSGRET_ERR_TECLADO        = "problema\r"           ..
                                  "teclado"
gtMsg.MSGRET_ERR_IMPRESSORA     = "problema\r"           ..
                                  "impressora"
gtMsg.MSGRET_IMPR_SEM_PAPEL     = "favor trocar a\r"     ..
                                  "bobina de papel"
gtMsg.MSGRET_ERR_LEITORMAG      = "problema\r"           ..
                                  "leitor magn�tico"
gtMsg.MSGRET_FUNCAO_INVALIDA    = "fun��o inativa"

gtMsg.MSGRET_NAO_PERMITIDO      = "opera��o n�o\r"       ..
                                  "permitida"
gtMsg.MSGRET_LOTE_CHEIO         = "lote cheio\r"         ..
                                  "\r"                   ..
                                  "finalize\r"           ..
                                  "terminal"
gtMsg.MSGRET_LOTE_VAZIO         = "lote vazio"

gtMsg.MSGRET_SEM_TRS_IMP        = "n�o existem transa��es\r" ..
                                  "a serem impressas"

gtMsg.MSGRET_NAO_HA_MSG         = "n�o h� msgs."

gtMsg.MSGRET_SENHA_INVALIDA     = "senha inv�lida\r"     ..
                                  "tente novamente"
gtMsg.MSGRET_SENHA_INV_CANCEL   = "senha inv�lida\r"     ..
                                  "opera��o cancelada"

gtMsg.MSGRET_CARTAO_INVALIDO    = "cart�o inv�lido"

gtMsg.MSGRET_CARTAO_PROBLEMA    = "cart�o com problema"
gtMsg.MSGRET_TRAN_NAO_EXISTE    = "transa��o n�o existe"

gtMsg.MSGRET_CARTAO_VENCIDO     = "cart�o vencido"

gtMsg.MSRET_CARTAO_COM_CHIP     = "use chip para\r"      ..
                                  "esta transa��o" 

gtMsg.MSGRET_MOEDA_INVALIDA     = "moeda inv�lida"

gtMsg.MSGRET_VALOR_INVALIDO     = "valor inv�lido"

gtMsg.MSGRET_VERSAO_INCORRETA   = "vers�o incorreta"

gtMsg.MSGRET_CONFIGURE_COMUNIC  = "execute func. 77"

gtMsg.MSGRET_CONFIGURE_TERMINAL = "terminal n�o\r"       ..
                                  "configurado"
gtMsg.MSGRET_INICIALIZE         = "inicialize \r"        ..
                                  "terminal"
gtMsg.MSGRET_ERRO_TRILHA_MAG    = "erro de leitura\r"    ..
                                  "tente novamente"

gtMsg.MSGRET_TEL_AUSENTE        = "n�m.tel.ausente\r"    ..
                                  "ligue rede"

-- Se o PAN ou Service code ou data de validade forem diferentes.
gtMsg.MSGRET_ERRO_TARJA         = "erro de leitura\r"..
                                  "     tarja"

gtMsg.MSGRET_ERR_TRILHA         = "erro param.\r"..
                                  "trilhas"

gtMsg.MSGRET_TERMINAL_BLOQUEADO = "fechado\r"..
                                  "digite a senha"
gtMsg.MSGRET_EFETUE_TESTE_COMUN = "efetue\r"..
                                  "teste comunic."
gtMsg.MSGRET_FINALIZE_TERMINAL  = "finalize o\r"..
                                  "terminal"

gtMsg.MSGRET_ERRO_DO_HOST       = "rede %2.2s\r"..
                                  "%s"
gtMsg.MSGRET_ERRO_REDE          = "ligue para rede\r"..
                                  "informe c�d. %2.2s"
gtMsg.MSGRET_ERRO_TABELAS_INIC  = "erro tabelas\r"..
                                  "inicialize"
gtMsg.MSGRET_ERRCOM_HARDWARE    = "erro interno\r"..
                                  "do modem"
gtMsg.MSGRET_ERRCOM_SEMCONEXAO  = "tente de novo-lc"

gtMsg.MSGRET_ERRCOM_PROTOCOLO   = "tente de novo-mi"

gtMsg.MSGRET_ERRCOM_ISO8583     = "tente de novo-id"

gtMsg.MSGRET_ERRCOM_TIMEOUTRESP = "tente de novo-to"

gtMsg.MSGRET_ERRCOM_TIMEOUTDESF = "tente de novo-nd"

gtMsg.MSGRET_ERRCON_SOCKET      = "    aguarde\r"     ..
                                  "  conex�o - 01"

gtMsg.MSGRET_ERRCON_ETN_NONET         = "   ethernet\r" ..
                                        "  desconectada\r" ..
                                        " verifique cabo\r" ..
                                        "  de internet"
gtMsg.MSGRET_ERRCON_ETN_NONET2        = "   ethernet\r" ..
                                        " desconectada\r" ..
                                        "   aguarde,\r" ..
                                        " discando..."
gtMsg.MSGRET_ERRCON_ETN_IPDINAMIC     = "    falha ip\r" ..
                                        "    din�mico\r" ..
                                        "  contate seu\r" ..
                                        "  adm. de rede"
gtMsg.MSGRET_ERRCON_ETN_IPDINAMIC2    = "    falha ip\r" ..
                                        "    din�mico\r" ..
                                        "    aguarde,\r" ..
                                        "  discando..."
gtMsg.MSGRET_ERRCON_ETN_IPCONFLITO    = "conflito de ip\r" ..
                                        " na rede local\r" ..
                                        "  contate seu\r" ..
                                        "  adm. de rede"
gtMsg.MSGRET_ERRCON_ETN_IPCONFLITO2   = "conflito de ip\r" ..
                                        " na rede local\r" ..
                                        "    aguarde,\r" ..
                                        "  discando..."
gtMsg.MSGRET_ERRCON_ETN_GATINDISP     = "gateway da rede\r" ..
                                        "n�o dispon�vel\r" ..
                                        "  contate seu\r" ..
                                        "  adm. de rede"
gtMsg.MSGRET_ERRCON_ETN_GATINDISP2    = "gateway da rede\r" ..
                                        "n�o dispon�vel\r" ..
                                        "aguarde discando"
gtMsg.MSGRET_ERRCON_ETN_TEMPOEXCEDIDO = "   falha tcp\r" ..
                                        " tempo excedido\r" ..
                                        "%15.15s\r" ..
                                        "contate adm rede"
gtMsg.MSGRET_ERRCON_ETN_TEMPOEXCEDIDO2= "   falha tcp\r" ..
                                        " tempo excedido\r" ..
                                        "%15.15s\r" ..
                                        "aguarde discando"

gtMsg.MSGRET_ERRCON_ETN_DESTINDISP    = "   falha tcp\r"    ..
                                        "destino indisp.\r" ..
                                        "%15.15s\r"         ..
                                        "contate adm rede"
gtMsg.MSGRET_ERRCON_ETN_DESTINDISP2   = "    falha tcp\r"..
                                        "destino indisp.\r"..
                                        "%15.15s\r"..
                                        "aguarde discando"
gtMsg.MSGRET_ERRCON_ETN_LOOPINTERNET  = "   falha tcp\r"..
                                        "looping internet\r"..
                                        "%15.15s\r"..
                                        "contate adm rede"
gtMsg.MSGRET_ERRCON_ETN_LOOPINTERNET2 = "   falha tcp\r"..
                                        "looping internet\r"..
                                        "%15.15s\r"..
                                        "aguarde discando"
gtMsg.MSGRET_ERRCON_ETN_SSLINDISP     = "  servi�o ssl\r"..
                                        "  indispon�vel\r"..
                                        "%15.15s\r"..
                                        "contate adm rede"
gtMsg.MSGRET_ERRCON_ETN_SSLINDISP2    = "  servi�o ssl\r"..
                                        "  indispon�vel\r"..
                                        "%15.15s\r"..
                                        "aguarde discando"
gtMsg.MSGRET_ERRCON_ETN_CERTSSL       = "     falha\r"..
                                        "certificado ssl\r"..
                                        "contate rede"
gtMsg.MSGRET_ERRCON_ETN_CERTSSL2      = "     falha\r"..
                                        "certificado ssl\r"..
                                        "    aguarde,\r"..
                                        " discando..."
gtMsg.MSGRET_ERRCON_ETN_GENERIC       = "    falha de\r"..
                                        "  comunica��o\r"..
                                        "%15.15s\r"..
                                        "contate rede"
gtMsg.MSGRET_ERRCON_ETN_GENERIC2      = "    falha de\r"..
                                        "  comunica��o\r"..
                                        "%15.15s\r"..
                                        "aguarde discando"
gtMsg.MSGRET_ERRCON_ETN_CERTEXP       = "  certificado\r"..
                                        "    expirado\r"..
                                        "contate rede"
gtMsg.MSGRET_ERRCON_ETN_CERTEXP2      = "  certificado\r"..
                                        "    expirado\r"..
                                        "    aguarde,\r"..
                                        "  discando..."
gtMsg.MSGRET_ERRCON_ETN_FILATCP       = "    falha de\r"..
                                        "    fila tcp\r"..
                                        "contate rede"
gtMsg.MSGRET_ERRCON_ETN_FILATCP2      = "    falha de\r"    ..
                                        "    fila tcp\r"    ..
                                        "    aguarde,\r"    ..
                                        "  discando..."
gtMsg.MSGRET_ERRCON_ETN_CERTINDISP    = "certificado ssl\r" ..
                                        "    ausente\r"     ..
                                        "   reinicie o\r"   ..
                                        "    terminal"
gtMsg.MSGRET_ERRCON_ETN_CERTINDISP2   = "certificado ssl\r" ..
                                        "    ausente\r"     ..
                                        "    aguarde,\r"    ..
                                        "  discando..."

gtMsg.MSGRET_ERRCON_SDLC        = "tente de novo-ce"

gtMsg.MSGRET_ERRCON_SINCRONIZ   = "tente de novo-ce"

gtMsg.MSGRET_ERRCON_NAOATENDE   = "tente de novo-na"

gtMsg.MSGRET_ERRCON_OCUPADO     = "tente de novo-lo"

gtMsg.MSGRET_ERRCON_SEMTOMDISC  = "sem tom discagem"

gtMsg.MSGRET_ERRCON_SEMLINHA    = "linha em uso"

gtMsg.MSGRET_ERRCON_HARDWARE    = "erro interno\r"    ..
                                  "do modem"
gtMsg.MSGRET_ERRCON_COMBASE     = "erro de conex�o\r" ..
                                  "com a base"
gtMsg.MSGRET_ERRCON_REGPPP      = "falha ppp"

gtMsg.MSGRET_ERRCON_REGGPRS     = "aguarde\r"         ..
                                  "conex�o - 02"

gtMsg.MSGRET_ERRCON_REGGSM      = "sem conex�o\r"     ..
                                  "com a rede"
gtMsg.MSGRET_ERRCON_SENHASIMCARD= "erro no pin"

gtMsg.MSGRET_ERRCON_SIMBLOQUEADO= "sim bloqueado"

gtMsg.MSGRET_ERRCON_ERROSIMCARD = "problema ou\r"     ..
                                  "erro no sim"
gtMsg.MSGRET_ERRCON_SEMSIMCARD  = "sim card\r"        ..
                                  "ausente"
gtMsg.MSGRET_ERRCON_EPACK       = "tente de novo-ce"

gtMsg.MSGRET_ERRCON_GSMASYNC    = "tente de novo-ce"

gtMsg.MSGRET_ERRCON_PFV_LIGUE   = "por favor, ligue para\r" ..
                                  "  rede e informe\r"      ..
                                  "    c�digo %s"

gtMsg.MSGRET_ERRCON_PFV_REFACA  = "por favor,refa�a\r"   ..
                                  "  a transa��o.\r"     ..
                                  " c�digo %s"

gtMsg.MSGRET_ERRCON_PFV_LIGUE_CME="por favor, ligue\r"   ..
                                  "  para a rede\r"    ..
                                  "  e informe o\r"      ..
                                  " c�digo %s.%02d-cme"

gtMsg.MSGRET_ERRCON_PFV_REFACA_CME= "por favor,refa�a\r" ..
                                    "  a transa��o.\r"   ..
                                    " c�digo %s.%02d-cme"

gtMsg.MSGDSP_ERR_INIT_SSLC      = "falha\r"           ..
                                  "certificado ssl\r" ..
                                  "contate rede"

gtMsg.MSGRET_TRANS_IGUAL_ANT    = "transa��o n�o realizada\r"..
                                  "id�ntica a anterior"
gtMsg.MSGRET_ERRPIN_HARDWARE    = "problema pin-pad\r"   ..
                                  "oper. cancelada"
gtMsg.MSGRET_ERRPIN_CHAVE       = "erro de chave\r"   ..
                                  "ligar rede"
gtMsg.MSGRET_ERREMV_NO_CHIP     = "func.chip inativ\r"   ..
                                  " passe o cart�o"
gtMsg.MSGRET_ERREMV_MAGNETICO   = "retire e passe\r"   ..
                                  "o cart�o"
gtMsg.MSGRET_ERREMV_NO_APL      = "aplica��o n�o\r"   ..
                                  "suportada"
gtMsg.MSGRET_ERREMV_NO_APL_CTLS = "aplica��o n�o\r"   ..
                                  "suportada\r"   ..
                                  "insira ou passe\r"   ..
                                  "o cart�o"
gtMsg.MSGRET_ERREMV_NEGADA      = "transa��o negada\r"   ..
                                  "ligue emissor"
gtMsg.MSGRET_ERREMV_RETIRADO    = "cart�o\r"   ..
                                  "retirado"
gtMsg.MSGRET_ERREMV_BLOQUEADO   = "cart�o bloqueado\r\r" ..
                                  "ligue emissor!"
gtMsg.MSGRET_ERREMV_MODO_INV    = "modo inv�lido\r"   ..
                                  "insira ou passe\r"   ..
                                  "o cart�o"
                             
gtMsg.MSGRET_ERREMV_APL_INV     = "aplic. inv�lida!"

gtMsg.MSGRET_ERREMV_APL_BLOQ    = "aplica��o bloqueada\r\r" ..
                                  "ligue emissor!"

gtMsg.MSGRET_ERR_EMV            = "erro emv"
gtMsg.MSGRET_ERREMV_HARDWARE    = "erro interno\r"       ..
                                  "pin-pad"

gtMsg.MSGRET_ERR_SEM_DESFZTO    = "n�o h� desfazto"

gtMsg.MSGRET_NAO_PERMITE_DIG    = "transa��o n�o\r"   ..
                                  "permite digitado"
gtMsg.MSGRET_NAO_PERMITE_CHIP   = "transa��o n�o\r"   ..
                                  "permite chip"
gtMsg.MSGRET_ERRCFG_DEBVISTA    = "erro transa��o\r"  ..
                                  "ligue atend\r"     ..
                                  "rede"
gtMsg.MSGRET_SEM_CUPOM          = "fun��o inv�lida"

gtMsg.MSGRET_ERR_TELECARGA      = "download n�o\r"   ..
                                  "conclu�do"
gtMsg.MSGRET_ERR_CARGA          = "carga aplicativo\r"   ..
                                  "n�o realizada"
gtMsg.MSGRET_ERR_ATUALIZACAO    = "atualiza��o\r"   ..
                                  "n�o realizada"

gtMsg.MSGRET_USE_VOUCHER        = "utilize\r"   ..
                                  "fun��o voucher"

gtMsg.MSGRET_FIM_VOUCHER        = "imprima o relat�rio\r" ..
                                  "de voucher antes\r"    ..
                                  "de finalizar"
                                  
gtMsg.MSGRET_PARAM_INVALIDO     = "par�metro\r"   ..
                                  "inv�lido" 

gtMsg.MSGRET_FALHA_ATUALIZ_SENHA= "    falha na\r"       ..
                                  " troca de senha\r"    ..
                                  " tente novamente"

gtMsg.MSGRET_OPER_NAO_IDENTIF   = "operadora do\r"     ..
                                  "sim card n�o\r"     ..
                                  "identificada\r"

gtMsg.MSGRET_SERV_NAO_DISP      = "servi�o\r"          ..
                                  "n�o dispon�vel"  

gtMsg.MSGERR_GENERICO           = "erro "

gtMsg.MSGRET_TENTE_NOVAMENTE    = "tente novamente"
                                  
--   Mensagens de erros especificos Telecom gprs
gtMsg.MSGERR_ERRCON_A0          = "a.0"
gtMsg.MSGERR_ERRCON_A1          = "a.1"
gtMsg.MSGERR_ERRCON_A2_262      = "a.2-262"
gtMsg.MSGERR_ERRCON_A3_015      = "a.3-015"
gtMsg.MSGERR_ERRCON_A4          = "a.4"
gtMsg.MSGERR_ERRCON_A5          = "a.5"
gtMsg.MSGERR_ERRCON_A6_010      = "a.6-010"
gtMsg.MSGERR_ERRCON_A7_013      = "a.7-013"
gtMsg.MSGERR_ERRCON_C11_X       = "c1.1."
gtMsg.MSGERR_ERRCON_C12_X       = "c1.2."
gtMsg.MSGERR_ERRCON_C13_X       = "c1.3."
gtMsg.MSGERR_ERRCON_C14_X       = "c1.4."
gtMsg.MSGERR_ERRCON_C21_X       = "c2.1."
gtMsg.MSGERR_ERRCON_C22_X       = "c2.2."
gtMsg.MSGERR_ERRCON_C23_X       = "c2.3."
gtMsg.MSGERR_ERRCON_C24_X       = "c2.4."
gtMsg.MSGERR_ERRCON_C25_X       = "c2.5."
gtMsg.MSGERR_ERRCON_G1_132      = "g1.1-132"
gtMsg.MSGERR_ERRCON_G1_148      = "g1.1-148"
gtMsg.MSGERR_ERRCON_G1_149      = "g1.1-149"
gtMsg.MSGERR_ERRCON_G1_4        = "g1.4"
gtMsg.MSGERR_ERRCON_G2_1        = "g2.1"
gtMsg.MSGERR_ERRCON_G2_2        = "g2.2"
gtMsg.MSGERR_ERRCON_G2_3        = "g2.3"
gtMsg.MSGERR_ERRCON_G2_4        = "g2.4"
gtMsg.MSGERR_ERRCON_G2_5        = "g2.5"
gtMsg.MSGERR_ERRCON_G2_6        = "g2.6"
gtMsg.MSGERR_ERRCON_G4_1        = "g4.1"
gtMsg.MSGERR_ERRCON_G4_2        = "g4.2"
gtMsg.MSGERR_ERRCON_G4_3        = "g4.3"

--   Entrada de dados - Senha
gtMsg.MSGINP_SENHA_TECNICO      = "senha t�cnico:"

gtMsg.MSGINP_SENHA_INICIALIZACAO= "senha inicializa��o:"

gtMsg.MSGINP_SENHA_LOJISTA      = "senha lojista:"

gtMsg.MSGINP_SENHA              = "senha:"

gtMsg.MSGINP_NOVA_SENHA         = "digite senha nova:"
                                  
gtMsg.MSGINP_REPITA_SENHA       = "repita senha:"

gtMsg.MSGINP_DIGITE_SENHA       = "digite a senha:"
                                  
gtMsg.MSGINP_SENHA_LOJISTA_ATUAL= "senha lojista:"
                                  
gtMsg.MSGINP_DIGITE_REFERIDA    = "%s"
                                  
--   Entrada de dados - Configura��o

gtMsg.MSGINP_NUMERO_OS          = "n�mero de OS:"
gtMsg.MSGINP_NUMERO_TERMINAL    = "n�mero do terminal:"
gtMsg.MSGINP_ID_TERMINAL        = "id. terminal"
gtMsg.MSGINP_FONE_INICIALIZACAO = "fone inicializa��o"
gtMsg.MSGINP_FONE_INICIALIZACAO2= "fone inic. sec"
gtMsg.MSGINP_FONE_TELECARGA     = "fone carga aplic"
gtMsg.MSGINP_TIME_OUT_RESPOSTA  = "time-out resp"
gtMsg.MSGINP_TENTATIVAS_CONEXAO = "tent. conex�o"
gtMsg.MSGINP_NII                = "NII:"
gtMsg.MSGINP_CODIGO_ACESSO_PABX = "c�digo acesso PABX:"
gtMsg.MSGINP_MODO_DISCAGEM      = "\rmodo de discagem:\r\r"
gtMsg.MSGINP_AUTORIZACAO        = "c�digo autoriza��o:"
gtMsg.MSGINP_COD_PESSOAL        = "c�digo pessoal"

gtMsg.MSGINP_PREAUTORIZACAO     = "n�mero de\r" ..
                                  "pr�-autoriza��o:"
gtMsg.MSGINP_OCORRENCIA         = "n�mero ocorr�ncia:"
gtMsg.MSGINP_HI                 = "n�mero habilita��o:"
gtMsg.MSGINP_ESTABELECIMENTO    = "n�mero estabelecimento:"
gtMsg.MSGINP_ITEM               = "item:"
gtMsg.MSGINP_CONDICOES_PAGAMENTO= "cond. pagto:"
gtMsg.MSGINP_VENCIMENTO         = "vencto. pular:"
gtMsg.MSGINP_VELOCIDADE         = "velocidade\r\r"
gtMsg.MSGINP_NUMERO_TENTATIVAS  = "n�mero de tentativas"
gtMsg.MSGINP_INTERVALO_ENVIO    = "intervalo de envio"
gtMsg.MSGINP_INTERVALO_HEART    = "intervalo de heart beat"
gtMsg.MSGINP_NRO_DOCUMENTO      = "n�mero documento:"
gtMsg.MSGINP_APN                = "apn:"
gtMsg.MSGINP_BALANCEAMENTO      = "2 �lt. dig. do terminal:"

gtMsg.MSGINP_VALOR              = "digite o valor:"
gtMsg.MSGINP_VALOR_SENHA        = "valor:"
gtMsg.MSGINP_PARCELAS           = "parcelas:"
gtMsg.MSGINP_IPDESTINO1         = "IP prim�rio:" 

gtMsg.MSGINP_PORTA_DESTINO1     = "porta prim�ria:"

gtMsg.MSGINP_IPDESTINO2         = "IP secund�rio:"

gtMsg.MSGINP_PORTA_DESTINO2     = "porta secund�ria:"

gtMsg.MSGINP_IP_CERTIF_SSL1     = "IP certificado\r" ..
                                  "SSL prim�rio:"
gtMsg.MSGINP_PORTA_CERTIF_SSL1  = "porta prim�ria SSL:"
gtMsg.MSGINP_IP_CERTIF_SSL2     = "IP certificado\r" ..
                                  "SSL secund�rio:"
gtMsg.MSGINP_PORTA_CERTIF_SSL2  = "porta secund�ria SSL:"
gtMsg.MSGINP_IP_POS             = "IP do POS:"
gtMsg.MSGINP_MASC_REDE_LOCAL    = "m�scara da rede local:"
gtMsg.MSGINP_GATEWAY            = "gateway da rede local:"

gtMsg.MSGINP_CODIGO_ACESSO      = "digite a senha do rav:"
gtMsg.MSGINP_ID_PORTADOR        = "celular do cliente:"

gtMsg.MSGINP_SENHA_ATUAL        = "digite a senha\r" ..
                                  "atual:"

gtMsg.MSGINP_SENHA_NOVA         = "digite a nova\r" ..
                                  "senha:"

gtMsg.MSGINP_SENHA_CONFIRMA     = "confirme a nova\r" ..
                                  "senha:"

gtMsg.MSGINP_CONTING_DIAL       = "\rhabilitar conting�ncia dial?\r\r"
gtMsg.MSGINP_DETECTA_LINHA      = "\rdetectar linha?\r\r"

--   Mensagens de sucesso apresentadas no final da opera��o

gtMsg.MSGDSP_CONFIGURACAO_OK    = "configura��o\r"     ..
                                  "gravada"
                                  
gtMsg.MSGDSP_OP_EFET_TECLE_ENTER= "opera��o efetuada\r" ..
                                  "tecle entra\r"
                                
gtMsg.MSGDSP_TRANSACAO_ACEITA   = "transa��o\r"          ..
                                  "aceita"

gtMsg.MSGDSP_TRANSACAO_APROVADA = "transa��o\r"          ..
                                  "aprovada"

gtMsg.MSGDSP_TRANSACAO_COMPLETA = "transa��o\r"          ..
                                  "completa"

gtMsg.MSGDSP_TESTE_COMUNIC_OK   = "teste de comunica��o\r" .. 
                                  "transa��o\r"            .. 
                                  "completada"

gtMsg.MSGDSP_OPERACAO_COMPLETADA= "op. completada"

gtMsg.MSGDSP_CONCLUIDO          = "conclu�do"

gtMsg.MSGDSP_INFO_TERMINAL      = "%s\r"                 .. -- Par�metro: n�mero do terminal
                                  "%-11.11s"                -- Par�metro: vers�o da aplica��o

gtMsg.MSGDSP_TRANS_EFETUADA     = "transa��o\r"          ..
                                  "efetuada e\r"         ..
                                  "conclu�da"

gtMsg.MSGDSP_INFO_TRANSF        = "%s\r"                 ..
                                  "informa��es\r"        ..
                                  "transferidas"

gtMsg.MSGDSP_TENTE_DE_NOVO      = "%s\r"                 ..
                                  " tente de novo"

gtMsg.MSGINP_MOSTRA_LOTE        = "lote: %06d"

gtMsg.MSGINP_SALDO_VOUCHER      = "%-16.16s\r"           ..
                                  "transa��o aprovada\r" ..
                                  "saldo dispon�vel\r"   ..
                                  "%-16.16s"

gtMsg.MSGDSP_CARGA_CHV_COMPL    = " inje��o chaves\r"    ..
                                  "trans.completada"

gtMsg.MSGDSP_SENHA_ATUALIZ_OK   = "senha atualizada\r"   ..
                                  "  com sucesso"

gtMsg.MSGDSP_TERM_FINALIZ_OK    = "terminal finalizado\r" ..
                                  "com sucesso"

--   Mensagens usadas durante transacoes com cartao                                 
gtMsg.MSGDSP_INSIRA_CARTAO      = "insira o cart�o"

gtMsg.MSGDSP_PASSE_CARTAO       = "passe o cart�o"

gtMsg.MSGDSP_DIGITE_CARTAO      = "digite o cart�o"

gtMsg.MSGDSP_RETIRE_CARTAO      = "retire o cart�o"

gtMsg.MSGDSP_INSIRA_PASSE_IDLE  = "insira ou passe\r"          ..
                                  "o cart�o"

gtMsg.MSGDSP_INSIRA_PASSE_CARTAO= "insira ou passe\r"    ..
                                  "o cart�o"

gtMsg.MSGDSP_SEM_CONTATO_VALOR  = "pagamento por\r"      ..
                                  "aproxima��o dispon�vel"

gtMsg.MSGDSP_SEM_CONTATO_VALOR2 = "digite o valor, insira\r" ..
                                  "ou passe o cart�o"

gtMsg.MSGDSP_PASSE_DIGITE_CARTAO= "passe ou digite\r"    ..
                                  "o cart�o"

                                 --1234567890123456  
gtMsg.MSGDSP_PASSE_INSIRA_DIGITE= "passe, insira ou\r"   ..
                                  "digite o cart�o"

gtMsg.MSGDSP_APRX_INS_PASSE_CART= "aproxime o cart�o aqui,\r" .. 
                                   "insira ou passe o cart�o"
                                  
gtMsg.MSGDSP_INCIALIZE_POS_TEC_1= "inicialize o pos\r"   ..  
                                  "tecle 1"

gtMsg.MSGINP_NUMERO_CARTAO      = "n�mero do cart�o:"

gtMsg.MSGINP_QUATRO_DIGITOS     = "digite 4 �ltimos d�gitos:"

gtMsg.MSGINP_CODIGO_SEGURANCA   = "c�digo seguran�a:"
gtMsg.MSGINP_CODIGO_SEGURANCA2  = "c�digo de seguran�a:\r\r"

gtMsg.MSGINP_DATA_VALIDADE      = "validade (mm/aa):"

gtMsg.MSGINP_DATA               = "data (ddmmaa):"

gtMsg.MSGINP_HORA_TELECARGA     = "informe hh:mm:"

gtMsg.MSGINP_NUMERO_PARCELAS    = "n�mero de parcelas:"

gtMsg.MSGINP_AUTO_POWER         = "power off(minutos):"

gtMsg.MSGDSP_DATA_INVALIDA      = "data inv�lida"

gtMsg.MSGDSP_FUNCAO             = "fun��o:"
gtMsg.MSGDSP_VALOR_PARCELA      = "valor parcela:"
gtMsg.MSGDSP_VALOR_TOTAL        = "valor total:"
gtMsg.MSGDSP_COD_VEICULO        = "c�digo ve�culo:"
gtMsg.MSGDSP_COD_CONDUTOR       = "c�digo condutor:"
gtMsg.MSGDSP_COD_COMBUSTIVEL    = "c�digo combust�vel:"
gtMsg.MSGDSP_LITRAGEM           = "litragem:"
gtMsg.MSGDSP_KM                 = "quilometragem:"
gtMsg.MSGDSP_ERR_LITRAGEM       = "digite a\r"           ..
                                  "litragem"
gtMsg.MSGDSP_ERR_QUILOMETRAGEM  = "digite a\r"           ..
                                  "quilometragem"
gtMsg.MSGDSP_ERR_COMBUSTIVEL    = "digite o c�digo\r"    ..
                                  "do combust�vel"
gtMsg.MSGDSP_ERR_PREENCHER      = "favor preencher\r"    ..
                                  "esta informa��o"

gtMsg.MSGDSP_ERR_NAO_CONCLUIDA  = "transa��o n�o\r"      ..
                                  "conclu�da"

--   Titulos de transacoes (Exibidas durante mensagem Insira/passe cartao)

--   mdg -> Mensagem display grande


--                              =  1234567890123456
gtMsg.MSGGDE_PRE_AUTORIZACAO    = "pr�-autoriza��o"
gtMsg.MSGGDE_CAPTURA            = "captura cr�dito"
gtMsg.MSGGDE_P_LABEL            = "private label"
gtMsg.MSGGDE_DEBITO             = "d�bito"
gtMsg.MSGGDE_DEB_DISTRIB        = "distribui��o"
gtMsg.MSGGDE_CREDITO            = "cr�dito"
gtMsg.MSGGDE_CONFIRMACAO_PRE_AUT= "confirma��o"
gtMsg.MSGGDE_VOUCHER            = "voucher"
gtMsg.MSGGDE_VOUCHER_FROTA      = "voucher frota"
gtMsg.MSGGDE_VOUCHER_TROCA_SENHA= "troca de senha"
gtMsg.MSGGDE_BAIXA_TECNICA      = "baixa t�cnica"
gtMsg.MSGGDE_SERASA             = "consulta � cheque"
gtMsg.MSGGDE_CANCELAMENTO       = "cancelamento"
gtMsg.MSGGDE_CANCELAMENTO_PRE   = "cancelamento"
gtMsg.MSGGDE_RESUMO             = "resumo de vendas"
gtMsg.MSGGDE_SEM_TITULO         = ""
gtMsg.MSGGDE_FINALIZACAO        = "finaliza��o"
gtMsg.MSGGDE_RAV                = "rav"
gtMsg.MSGGDE_FECHAMENTO_EMISSOR = "fechamento emissor"
gtMsg.MSGGDE_FONESHOP           = "celular"
gtMsg.MSGGDE_FONESHOP_CAPT      = "transa��o"
gtMsg.MSGGDE_CREDIARIO          = "credi�rio"


--   Mensagens exibidas ao lado do emissor na digitacao de valores
   
--   mdp -> Mensagem display pequeno

gtMsg.MSGPEQ_CANC               = gtMsg.MSGGDE_CANCELAMENTO_PRE
gtMsg.MSGPEQ_CAP_PARC_ADM       = "cap ad"
gtMsg.MSGPEQ_CAP_PARC_EST       = "cap es"
gtMsg.MSGPEQ_CAP_VISTA          = "cap-cr"
gtMsg.MSGPEQ_CHEQUE             = "cheque"
gtMsg.MSGPEQ_CONF               = "confirmar pr�-auto"
gtMsg.MSGPEQ_CONS               = "  cons"
gtMsg.MSGPEQ_CRED               = "cr�dito � vista"
gtMsg.MSGPEQ_DEB_PRE            = "d�bito pr�-datado"
gtMsg.MSGPEQ_DEB_VISTA          = "d�bito � vista"
gtMsg.MSGPEQ_PARC               = ""
gtMsg.MSGPEQ_PARC_ADM           = "cr�dito parc. emiss" 
gtMsg.MSGPEQ_PARC_EST           = "cr�dito parc. estab"
gtMsg.MSGPEQ_PRE_AUT            = gtMsg.MSGMNU_PRE_AUTORIZACAO
gtMsg.MSGPEQ_CREDIARIO          = "credi�rio"
gtMsg.MSGPEQ_PRIV_LABEL         = "private label"
gtMsg.MSGPEQ_VAZIA              = ""

-- serasa
gtMsg.MSGTIT_SERASA             = "consulta � cheque"
gtMsg.MSGMNU_PEND_FINANCEIRA    = "pefin"
gtMsg.MSGINP_NUMERO_CHEQUE      = "n�mero cheque:"
gtMsg.MSGINP_NUMERO_BANCO       = "n�mero do banco:"
gtMsg.MSGINP_NUMERO_AGENCIA     = "n�mero da ag�ncia:"
gtMsg.MSGINP_NUMERO_CONTA       = "C/C:"
gtMsg.MSGINP_CNPJ_CPF           = "CNPJ/CPF:"
gtMsg.MSGINP_DDD                = "ddd:"
gtMsg.MSGINP_TELEFONE           = "telefone:"
gtMsg.MSGINP_SERASA_BLOCO1      = "bloco 1:"
gtMsg.MSGINP_SERASA_BLOCO2      = "bloco 2:"
gtMsg.MSGINP_SERASA_BLOCO3      = "bloco 3:"
gtMsg.MSGDSP_DADO_INVALIDO      = "dado inv�lido"
gtMsg.MSGDSP_CPF_INVALIDO       = "cpf inv�lido"
gtMsg.MSGDSP_COD_INVALIDO       = "c�digo inv�lido"

-- rav
gtMsg.MSGTIT_RESGATE_SENHA      = "resgate de senha"
gtMsg.MSGTIT_RAV_TOTAL          = "rav total"
gtMsg.MSGTIT_RAV_PARCIAL        = "rav parcial"
gtMsg.MSGTIT_RAV_AUTOMATICO     = "rav autom�tico"
gtMsg.MSGINP_RAV_CPF            = "digite o cpf do\r" ..
                                  "propriet�rio:"
gtMsg.MSGINP_RAV_AGENCIA        = "digite a ag�ncia do\r" ..
                                  "domic�lio banc�rio:"
gtMsg.MSGINP_RAV_CONTA          = "digite a conta corrente\r" ..
                                  "do domic�lio banc�rio:"
gtMsg.MSGINP_RAV_CEP            = "digite o cep do\r" ..
                                  "propriet�rio:"
gtMsg.MSGDSP_RAV_TOTAL_OK       = "rav total efetuado\r" ..
                                  "com sucesso"
gtMsg.MSGDSP_RAV_PARCIAL_OK     = "rav parcial efetuado\r" ..
                                  "com sucesso"
gtMsg.MSGDSP_RAV_AUTO_OK        = "rav autom�tico\r" ..
                                  "efetuado com\r"   ..
                                  "sucesso"
gtMsg.MSGDSP_SENHA_RESGATADA    = "senha resgatada\r" ..
                                  "com sucesso"
gtMsg.MSGDSP_RAV_DESEJA_AVULSO  = "deseja realizar\r" ..
                                  "rav avulso?"
gtMsg.MSGDSP_SALDO_DISP         = "saldo dispon�vel:\r" ..
                                  "R$ %s\r"               ..
                                  "confirma?"
gtMsg.MSGDSP_SALDO_DISP_DATA    = "valor a receber hoje:\r\r" ..
                                  "%s\r"                    ..
                                  "R$%13.13s"

-- posi��o de vendas
gtMsg.MSGDSP_SEM_MAIS_TOTAIS    = "sem mais totais"
gtMsg.MSGDSP_VERIFICANDO_LOTE   = "verificando lote\r"   ..
                                  "aguarde um momento"

gtMsg.MSGINP_NUM_AUTENTICA      = "n�mero AUTE:"

gtMsg.MSGINP_NUM_CV             = "n�mero do CV:"

gtMsg.MSGINP_CONFIRMACAO        = "confirmar estorno?"

--   Mensagens para impress�o   (devem ser em mai�sculo e sem acentua��o)

gtMsg.MSGIMP_VIA_ESTAB          = "VIA ESTABELECIMENTO"
gtMsg.MSGIMP_VIA_CLIENTE        = "VIA CLIENTE"
gtMsg.MSGIMP_REIMPRESSO         = "REIMPRESSO"
gtMsg.MSGIMP_QUEDA_ENERGIA      = "QUEDA DE ENERGIA"
gtMsg.MSGIMP_TOT_APROVADO       = "TOT.APROVADO"
gtMsg.MSGIMP_TOTAL              = "TOTAL"
gtMsg.MSGIMP_ASSINATURA         = "ASSINATURA DO CLIENTE"
gtMsg.MSGIMP_SENHA_PESSOAL      = "AUTORIZADA MEDIANTE SENHA PESSOAL"
gtMsg.MSGIMP_SENHA_PESSOAL_2    = "AUTORIZADO MEDIANTE SENHA PESSOAL"
gtMsg.MSGIMP_TRS_APROV_EMISSOR  = "TRANSACAO APROVADA PELO EMISSOR"
gtMsg.MSGIMP_APENAS_CONSULTA    = "INFORMACAO VALIDA APENAS PARA CONSULTA"
gtMsg.MSGIMP_MSG1               = "RECONHECO E PAGAREI A DIVIDA ACIMA"
gtMsg.MSGIMP_MSG2               = "  TRANSACAO AUTORIZADA MEDIANTE"
gtMsg.MSGIMP_MSG3               = "           CODIGO PESSOAL"
gtMsg.MSGIMP_RAV_HOJE           = "RAV HOJE"
gtMsg.MSGIMP_RAV_PROX           = "RAV PROXIMO DIA"
gtMsg.MSGIMP_BAIXA_TECNICA      = "BAIXA TECNICA"
gtMsg.MSGIMP_SERASA             = "SERASA"
gtMsg.MSGIMP_SEM_TOTAL          = "SEM TOTALIZACAO DE VENDAS"
gtMsg.MSGIMP_CAB_VOUCHER        = " CARTAO    AUTO           VALOR   HORA"
gtMsg.MSGIMP_REL_VOUCHER        = "RELATORIO DE VOUCHER"
gtMsg.MSGTIT_IMP_LIST_LOG       = "LISTAGEM TECNICA"
gtMsg.MSGTIT_IMP_LOGICO         = "NUM.LOGICO:"
gtMsg.MSGTIT_IMP_VERSAO         = "VERSAO APLIC.:"
gtMsg.MSGIMP_TITRAV             = "RAV - RECEBIMENTO ANTECIPADO DE VENDAS"
gtMsg.MSGIMP_RAV_RESGATE        = "RESGATE DE SENHA RAV"
gtMsg.MSGIMP_RAV_SENHA          = "SENHA RAV: %s"
gtMsg.MSGIMP_RAV_MSG1           = "ESTA SENHA PODE SER UTILIZADA PARA"
gtMsg.MSGIMP_RAV_MSG2           = "REALIZACAO DE RAV VIA TERMINAL,"
gtMsg.MSGIMP_RAV_MSG3           = "CENTRAL DE ATENDIMENTO E PORTAL"
gtMsg.MSGIMP_RAV_CONTRATACAO    = "CONTRATACAO RAV AUTOMATICO"
-- Release notes
gtMsg.MSGIMP_TIT_REL_NOTES      = "NOVAS FUNCOES"

-- Mensagens para relat�rio em tela 
gtMsg.MSGDSP_TOTAL_VENDAS       = "total de vendas"
