---
-- Arquivo de mensagens para display, para terminais gráficos
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
gtMsg.MSGMNU_INICIALIZACAO      = "inicialização"
gtMsg.MSGMNU_CARTAO             = "cartão"
gtMsg.MSGMNU_DINHEIRO           = "dinheiro"
gtMsg.MSGMNU_CREDITO            = "crédito"
gtMsg.MSGMNU_DEBITO             = "débito"
gtMsg.MSGMNU_CREDIARIO          = "crediário" 
gtMsg.MSGMNU_DISTRIBUTION       = "distribuição"
gtMsg.MSGMNU_ADMINISTRATIVO     = "administra"
gtMsg.MSGMNU_TECNICO            = "técnico"
gtMsg.MSGMNU_ATENDIMENTO        = "atendimento"
gtMsg.MSGMNU_PRE_AUTORIZACAO    = "pré"
gtMsg.MSGMNU_RESUMO_VENDAS      = "resumo vendas"
gtMsg.MSGMNU_RELATORIOS         = "relatórios"
gtMsg.MSGMNU_CAPTURA_CREDITO    = "captura crédito"
gtMsg.MSGMNU_CORPORATIVO        = "corporativo"
gtMsg.MSGMNU_ESTORNO            = "estorno"
gtMsg.MSGMNU_FINALIZACAO        = "finalização"
gtMsg.MSGMNU_REIMPRESSAO        = "reimpressão"
gtMsg.MSGMNU_VOUCHER            = "voucher"
gtMsg.MSGMNU_CONSULTA_SERASA    = "consulta à cheque"
gtMsg.MSGMNU_BAIXA_CAMPO        = "técnico campo"
gtMsg.MSGMNU_BAIXA_CENTRAL      = "central atendimento"
gtMsg.MSGMNU_MENU_P_LABEL       = "private label"
gtMsg.MSGMNU_RAV                = "rav"
gtMsg.MSGMNU_BAIXA_TECNICA      = "baixa técnica"
gtMsg.MSGMNU_MENU_PRE_AUT       = "pré-autoriz"
gtMsg.MSGMNU_VOUCHER_FROTA      = "voucher frota"
gtMsg.MSGMNU_VOUCHER_TROC_SENHA = "troca de senha"
gtMsg.MSGMNU_VOUCHER_RELAT      = "relatório"
gtMsg.MSGMNU_VOUCHER_ABAST      = "abastecer"
gtMsg.MSGMNU_VOUCHER_TROC_OLEO  = "troca de óleo"
gtMsg.MSGMNU_VOUCHER_LAVAGEM    = "lavagem"
gtMsg.MSGMNU_VOUCHER_PEDAGIO    = "pedágio"
gtMsg.MSGMNU_VOUCHER_OUTROS     = "outros"
gtMsg.MSGMNU_MENU_CONSULTAS     = "consulta à cheque" 
gtMsg.MSGMNU_FONESHOP           = "celular"
gtMsg.MSGMNU_MENU_OUTRAS_OPCOES = "outras opções"

gtMsg.MSGMNU_APAGA_LOTE         = "apaga lote"
gtMsg.MSGMNU_APAGA_DESFAZIMENTO = "apaga desfazimento"
gtMsg.MSGMNU_APAGA_TUDO         = "apaga tudo"
gtMsg.MSGMNU_IMPRIME_LOG        = "imprime log"
gtMsg.MSGMNU_APAGA_CERTIF       = "apaga certificado"

gtMsg.MSGMNU_SIMULACAO          = "simular"
gtMsg.MSGMNU_CONTRATACAO        = "contratar"
gtMsg.MSGMNU_NOVA_SIMULACAO     = "nova simulação"
gtMsg.MSGMNU_IMP_SIMULACAO      = "imprime simulação"

gtMsg.MSGMNU_CANCELA            = "cancela"
gtMsg.MSGMNU_SUBIR              = "subir"
gtMsg.MSGMNU_DESCER             = "descer"
gtMsg.MSGMNU_VOLTAR             = "voltar"
gtMsg.MSGMNU_FUNCAO             = "função"
gtMsg.MSGMNU_MENU               = "menu"    
gtMsg.MSGMNU_INICIAL            = "inicial"
gtMsg.MSGMNU_CONFIRMA           = "confirma"
gtMsg.MSGMNU_OK                 = "ok"
gtMsg.MSGMNU_AGORA              = "agora"
gtMsg.MSGMNU_AGENDAR            = "agendar"
gtMsg.MSGMNU_AVANCAR            = "avançar"

gtMsg.MSGMNU_ESCOLHA_OPCAO      = "escolha uma opção:"
gtMsg.MSGMNU_ESCOLHA_DIA        = ""
gtMsg.MSGMNU_ESCOLHA_OPERADORA  = "escolha a operadora:"
gtMsg.MSGMNU_TIPO_COMUNICACAO   = "tipo de comunicação"
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

gtMsg.MSGMNU_AVISTA             = "à vista"
gtMsg.MSGMNU_PARCELADO_ADM      = "parc. emissor"
gtMsg.MSGMNU_PARCELADO_EST      = "parc. estabel"
gtMsg.MSGMNU_CAPTURA            = "captura"
gtMsg.MSGMNU_PENDENTES          = "pendentes"

gtMsg.MSGMNU_PROX_TRANS         = "próxima transação"
gtMsg.MSGMNU_SELEC_ATUAL        = "selecionar atual"
gtMsg.MSGMNU_SELECIONAR         = "selecionar"
gtMsg.MSGMNU_CANCELAR           = "cancelar"
gtMsg.MSGMNU_PROX_ITEM          = "próximo"

gtMsg.MSGMNU_CANCELAMENTO       = "cancel. pré"
gtMsg.MSGMNU_CONSULTA           = "consulta"

gtMsg.MSGMNU_NAO                = "não"
gtMsg.MSGMNU_SIM                = "sim"
gtMsg.MSGMNU_HOJE               = "hoje"
gtMsg.MSGMNU_PROXIMO            = "próximo dia útil"
gtMsg.MSGMNU_PARCELADO          = "parcelado"
gtMsg.MSGMNU_PRE                = "pré"
gtMsg.MSGMNU_PRE_DATADO         = "pré-datado"
gtMsg.MSGMNU_ROTATIVO           = "rotativo"
gtMsg.MSGMNU_VENDA              = "venda"
gtMsg.MSGMNU_TOM                = "tom"
gtMsg.MSGMNU_PULSO              = "pulso"
gtMsg.MSGMNU_DHCP               = "DHCP"
gtMsg.MSGMNU_IPFIXO             = "IP fixo"

gtMsg.MSGMNU_REIMP_ESPECIAL     = "transação específica"
gtMsg.MSGMNU_REIMP_ULTIMA       = "última transação"
gtMsg.MSGMNU_VIA_ESTAB          = "estabelecimento"
gtMsg.MSGMNU_VIA_CLIENTE        = "cliente"
gtMsg.MSGMNU_VIA_AMBAS          = "ambas"
gtMsg.MSGMNU_VIA_NENHUMA        = "nenhuma"

gtMsg.MSGMNU_CANCELAR_TRS       = "cancelar transação"
gtMsg.MSGMNU_MOV_PENDENTE       = "mover para pendentes"

--  menu p/ ausencia de CVC2 
gtMsg.MSGMNU_NAO_POSSUI         = "não possui"
gtMsg.MSGMNU_ILEGIVEL           = "ilegível"

-- Menu de informações
gtMsg.MSGMNU_MAC_ADDRESS        = "MAC address:" 
gtMsg.MSGMNU_MASCARA            = "máscara da rede:" 
gtMsg.MSGMNU_GATEWAY            = "gateway da rede:" 
gtMsg.MSGMNU_IPPOS              = "IP do POS:"

-- --------------- Menus Relatorios -----------------
-- Máximo 13 caracteres         =  1234567890123
gtMsg.MSGMNU_REL_RESUMIDO       = "resumido"
gtMsg.MSGMNU_REL_DETALHADO      = "detalhado"
gtMsg.MSGMNU_ULT_FINALIZ        = "última finalização"
gtMsg.MSGMNU_REL_ESTORNO        = "estorno"

-- --------------- Menus rav ------------------------
gtMsg.MSGMNU_ANTECIPACAO        = "antecipação"
gtMsg.MSGMNU_CONS_ANTECIP       = "consulta"
gtMsg.MSGMNU_RAV_TOTAL          = "rav total"
gtMsg.MSGMNU_RAV_PARCIAL        = "rav parcial"
gtMsg.MSGMNU_CONF_ANTEC         = "confirma antecipação"
gtMsg.MSGMNU_IMPRIMIR           = "imprimir"
gtMsg.MSGMNU_CONFIRMA_RAV       = "confirma"
gtMsg.MSGMNU_NAO_CONFIRMA_RAV   = "não confirma"
gtMsg.MSGMNU_RAV_RESGATE        = "resgate de senha"
gtMsg.MSGMNU_RAV_AVULSO         = "rav avulso"
gtMsg.MSGMNU_RAV_AUTOMATICO     = "rav automático"
gtMsg.MSGMNU_SALDO_DISP         = "saldo disponível"

gtMsg.MSGMNU_RAV_TX_DESC        = "taxa período:"
gtMsg.MSGMNU_RAV_MES            = "taxa mês:"
gtMsg.MSGMNU_RAV_DATA_RECEB     = "data de recebimento:"
gtMsg.MSGMNU_RAV_RECEBIMENTO    = "recebimento:"
gtMsg.MSGMNU_RAV_RECEB          = "valor a receber:"

-- --------------- Menus Integrados ------------------
gtMsg.MSGMNU_ADMINISTRATIVO_2   = "administra"

-- --------------- Menus Finalização ------------------
gtMsg.MSGMNU_DESCARTAR_IMP      = "descartar impressão?"

gtMsg.MSGMNU_DESCARTAR_IMP2     = "deseja descartar\r" .. 
                                  "impressão?"
                                  
gtMsg.MSGMNU_FINALIZ_AUT        = "finalização automática"

gtMsg.MSGMNU_DESEJA_ATUALIZ     = "deseja atualizar o\r" .. 
                                  "terminal agora?"

gtMsg.MSGMNU_NOVA_TELECARGA     = "deseja realizar\r"    ..
                                  "uma nova telecarga?"         

gtMsg.MSGMNU_VER_RELEASE_NOTES  = "deseja conhecer as novas\r" .. 
                                  "funções?"
                                  
--____________________________________________________________________________

--   Títulos de menu
   
--   1 única linha
--_____________________________________________________________________________


gtMsg.MSGTIT_MENU_PRINCIPAL     = ""
gtMsg.MSGTIT_CANCEL2            = "cancelamento"
gtMsg.MSGTIT_GIGA_TESTE         = "giga de teste"
gtMsg.MSGTIT_CONFIGURACAO       = "configuração"
gtMsg.MSGTIT_CONFIGURACAO_WNB   = "configuração WNB"
gtMsg.MSGTIT_CONSULTAS          = "consultas"
gtMsg.MSGTIT_OUTRAS_OPCOES      = "outras opções" 
gtMsg.MSGTIT_P_LABEL            = "private label"
gtMsg.MSGTIT_CONTINGENCIA       = "contingência"
gtMsg.MSGTIT_CAPTURA_CREDITO    = "captura crédito"
gtMsg.MSGTIT_CREDITO            = "crédito"
gtMsg.MSGTIT_DEBITO             = "débito"
gtMsg.MSGTIT_CREDIARIO          = "crediário"
gtMsg.MSGTIT_CREDIARIO_CONTRAT  = "contratação"
gtMsg.MSGTIT_CREDIARIO_CONSULT  = "simulação"
gtMsg.MSGTIT_DISTRIBUTION       = "distribuição"
gtMsg.MSGTIT_VOUCHER            = "voucher"
gtMsg.MSGTIT_VOUCHER_FROTA      = "voucher frota"
gtMsg.MSGTIT_PRE_AUTORIZACAO    = "pré-autorização"
gtMsg.MSGTIT_CONF_PRE_AUT       = "confirmação"
gtMsg.MSGTIT_TECNICO            = "técnico"
gtMsg.MSGTIT_FECHAMENTO_EMISSOR = "fechamento emissor"
gtMsg.MSGTIT_INICIALIZACAO      = "inicialização"
gtMsg.MSGTIT_TESTE_COMUNICACAO  = "teste de comunicação"
gtMsg.MSGTIT_FINALIZACAO        = "relatórios"
gtMsg.MSGTIT_RESUMO_VENDAS      = "resumo de vendas"
gtMsg.MSGTIT_BAIXA_TECNICA      = "baixa técnica"
gtMsg.MSGTIT_PESQUISA_DOCUMENTO = "pesquisa documento"
gtMsg.MSGTIT_ESTORNO            = "estorno"
gtMsg.MSGTIT_REIMPRESSAO        = "reimpressão"
gtMsg.MSGTIT_FONESHOP           = "celular"
gtMsg.MSGTIT_FONESHOP_CAPT      = "transação"
gtMsg.MSGTIT_TROCA_SENHA        = "troca de senha do lojista"
gtMsg.MSGTIT_CREDLOJA           = "cred.consumidor"

gtMsg.MSGTIT_RAV                = "rav"
gtMsg.MSGTIT_TIPO_COMUNICACAO   = gtMsg.MSGTIT_CONFIGURACAO
gtMsg.MSGTIT_TIPO_COMUNICACAO2  = "tipo de comunicação?"
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
                                  "atualização?"

gtMsg.MSGTIT_REALIZAR_CARGA     = "realizar carga:\r"    ..
                                  "<1> sim\r"            ..
                                  "<2> não"

gtMsg.MSGTIT_REALIZAR_CARGA2    = "realizar o download?"

gtMsg.MSGTIT_CARGA_CHAVES       = "     injeção\r"       ..
                                  "    de chaves"
gtMsg.MSGTIT_ANTEC_VENDA        = "antecipação de vendas"
gtMsg.MSGTIT_ANTEC_HOJE         = "antecipação hoje"
gtMsg.MSGTIT_ANTEC_PROX         = "antecipação próximo"
gtMsg.MSGTIT_VEL_COMUNIC        = "velocid.comunic"
gtMsg.MSGTIT_RELATORIOS         = "relatórios"
gtMsg.MSGTIT_SELEC_APP          = "selecione aplic"
gtMsg.MSGTIT_CONF_APP           = "confirma aplicação:"
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
--   Nomes das operações
--____________________________________________________________________________
gtMsg.MSGOPE_INICIALIZACAO      = "inicialização"
gtMsg.MSGOPE_TELECARGA          = "telecarga"
gtMsg.MSGOPE_TESTE_COMUNICACAO  = "teste comunic."
gtMsg.MSGOPE_CANCELAMENTO       = "estorno"
gtMsg.MSGOPE_INIT_SSL           = "ssl init"


--   Mensagem apresentadas durante a comunicação com a rede

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
gtMsg.MSGDSP_COBRANCA_USO       = "a contingência\r"  ..
                                  "dial pode gerar\r" ..
                                  "cobrança de uso\r" ..
                                  "da linha telefônica."

gtMsg.MSGDSP_AGUARDE_REBOOT     = "aguarde...\r"      ..
                                  "reiniciando o terminal"

gtMsg.MSGDSP_AGUARDE_REINICIANDO= "aguarde... \r"     ..
                                  "reiniciando o\r"   ..
                                  "terminal"
gtMsg.MSGDSP_REGISTRANDO        = "registrando"

gtMsg.MSGDSP_DESTAQUE_PRI_VIA   = "destaque a via 1\r"..
                                  "pressione entra"

gtMsg.MSGDSP_DESTAQUE_IMPRESSAO = "destaque a\r"      ..
                                  "impressão"

gtMsg.MSGDSP_PENDENTE_FONESHOP  = "celular: (%02s)%s-%s\r"

gtMsg.MSGDSP_POSICAO_VENDA      = "%s\r"              ..
                                  "%02s itens\r"      ..
                                  "%s"

gtMsg.MSGDSP_CARGA_APLICATIVO   = "realizando o download\r"     ..
                                  "de nova aplicação"
gtMsg.MSGDSP_PAUSAR_CARGA       = "para pausar o download\r" ..
                                  "pressione a tecla entra"

                                 -- msg em maiúsculo
gtMsg.MSGDSP_CARGA_APLICATIVO_OK= "terminal atualizado\r" .. 
                                  "com sucesso"
gtMsg.MSGDSP_DOWNLOAD_OK        = "download concluído!"
gtMsg.MSGDSP_INIT_SSL_OK        = "ssl init ok"
gtMsg.MSGDSP_APAGADO_CERTIF     = "certificado ssl\r" ..
                                  "apagado"

gtMsg.MSGDSP_EFETUE_BX_TECNICA  = "    efetue\r"      ..
                                  " baixa técnica"
gtMsg.MSGDSP_MOV_PENDENTE       = "transação movida\r"..
                                  "para pendentes"
gtMsg.MSGDSP_NRO_SIMCARD        = "número do SIM card:\r"

gtMsg.MSGDSP_DIAS_VENCER        = "faltam %02d dias\r"   ..
                                  "p/ o certificados\r"  ..
                                  "vencer.\r"            ..
                                  "contate rede"
gtMsg.MSGDSP_DIAS_VENCER_DISC   = "faltam %02d dias\r"   ..
                                  "p/ o certificados\r"  ..
                                  "vencer. aguarde,\r"   ..
                                  "discando..."
gtMsg.MSGDSP_ATUALIZ_TERMINAL   = "existe uma atualização\r" .. 
                                  "para o seu terminal"
gtMsg.MSGDSP_SERA_ATUALIZ       = "seu terminal será\r"     ..
                                  "atualizado na próxima\r" ..
                                  "finalização"
gtMsg.MSGDSP_AGUARDE_ATUAL      = "aguarde, seu\r"  .. 
                                  "terminal será\r" .. 
                                  "atualizado"
gtMsg.MSGDSP_MANTER_LIGADO      = "mantenha ligado\r"    ..
                                  "a tomada durante\r"   ..
                                  "todo o processo"

gtMsg.MSGTIT_ATUALIZ_PENDENTE   = "atualização pendente!"
gtMsg.MSGDSP_ATUALIZ_PENDENTE   = "conclua a atualização\r" ..
                                  "antes de iniciar\r" ..
                                  "um novo download"

                                  
--____________________________________________________________________________
--   Mensagens de erro
--____________________________________________________________________________


gtMsg.MSGRETCON_NAOATENDE       = "linha não atende"

gtMsg.MSGRETCON_OCUPADO         = "linha ocupada"

gtMsg.MSGRET_CANCELADO          = "operação cancelada"
gtMsg.MSGRET_TIMEOUT            = "operação cancelada"
gtMsg.MSGRET_ERR_ARQUIVOS       = "problema\r"           ..
                                  "arquivos"
gtMsg.MSGRET_ERR_RELOGIO        = "problema\r"           ..
                                  "relógio"
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
                                  "leitor magnético"
gtMsg.MSGRET_FUNCAO_INVALIDA    = "função inativa"

gtMsg.MSGRET_NAO_PERMITIDO      = "operação não\r"       ..
                                  "permitida"
gtMsg.MSGRET_LOTE_CHEIO         = "lote cheio\r"         ..
                                  "\r"                   ..
                                  "finalize\r"           ..
                                  "terminal"
gtMsg.MSGRET_LOTE_VAZIO         = "lote vazio"

gtMsg.MSGRET_SEM_TRS_IMP        = "não existem transações\r" ..
                                  "a serem impressas"

gtMsg.MSGRET_NAO_HA_MSG         = "não há msgs."

gtMsg.MSGRET_SENHA_INVALIDA     = "senha inválida\r"     ..
                                  "tente novamente"
gtMsg.MSGRET_SENHA_INV_CANCEL   = "senha inválida\r"     ..
                                  "operação cancelada"

gtMsg.MSGRET_CARTAO_INVALIDO    = "cartão inválido"

gtMsg.MSGRET_CARTAO_PROBLEMA    = "cartão com problema"
gtMsg.MSGRET_TRAN_NAO_EXISTE    = "transação não existe"

gtMsg.MSGRET_CARTAO_VENCIDO     = "cartão vencido"

gtMsg.MSRET_CARTAO_COM_CHIP     = "use chip para\r"      ..
                                  "esta transação" 

gtMsg.MSGRET_MOEDA_INVALIDA     = "moeda inválida"

gtMsg.MSGRET_VALOR_INVALIDO     = "valor inválido"

gtMsg.MSGRET_VERSAO_INCORRETA   = "versão incorreta"

gtMsg.MSGRET_CONFIGURE_COMUNIC  = "execute func. 77"

gtMsg.MSGRET_CONFIGURE_TERMINAL = "terminal não\r"       ..
                                  "configurado"
gtMsg.MSGRET_INICIALIZE         = "inicialize \r"        ..
                                  "terminal"
gtMsg.MSGRET_ERRO_TRILHA_MAG    = "erro de leitura\r"    ..
                                  "tente novamente"

gtMsg.MSGRET_TEL_AUSENTE        = "núm.tel.ausente\r"    ..
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
                                  "informe cód. %2.2s"
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
                                  "  conexão - 01"

gtMsg.MSGRET_ERRCON_ETN_NONET         = "   ethernet\r" ..
                                        "  desconectada\r" ..
                                        " verifique cabo\r" ..
                                        "  de internet"
gtMsg.MSGRET_ERRCON_ETN_NONET2        = "   ethernet\r" ..
                                        " desconectada\r" ..
                                        "   aguarde,\r" ..
                                        " discando..."
gtMsg.MSGRET_ERRCON_ETN_IPDINAMIC     = "    falha ip\r" ..
                                        "    dinâmico\r" ..
                                        "  contate seu\r" ..
                                        "  adm. de rede"
gtMsg.MSGRET_ERRCON_ETN_IPDINAMIC2    = "    falha ip\r" ..
                                        "    dinâmico\r" ..
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
                                        "não disponível\r" ..
                                        "  contate seu\r" ..
                                        "  adm. de rede"
gtMsg.MSGRET_ERRCON_ETN_GATINDISP2    = "gateway da rede\r" ..
                                        "não disponível\r" ..
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
gtMsg.MSGRET_ERRCON_ETN_SSLINDISP     = "  serviço ssl\r"..
                                        "  indisponível\r"..
                                        "%15.15s\r"..
                                        "contate adm rede"
gtMsg.MSGRET_ERRCON_ETN_SSLINDISP2    = "  serviço ssl\r"..
                                        "  indisponível\r"..
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
                                        "  comunicação\r"..
                                        "%15.15s\r"..
                                        "contate rede"
gtMsg.MSGRET_ERRCON_ETN_GENERIC2      = "    falha de\r"..
                                        "  comunicação\r"..
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
gtMsg.MSGRET_ERRCON_COMBASE     = "erro de conexão\r" ..
                                  "com a base"
gtMsg.MSGRET_ERRCON_REGPPP      = "falha ppp"

gtMsg.MSGRET_ERRCON_REGGPRS     = "aguarde\r"         ..
                                  "conexão - 02"

gtMsg.MSGRET_ERRCON_REGGSM      = "sem conexão\r"     ..
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
                                  "    código %s"

gtMsg.MSGRET_ERRCON_PFV_REFACA  = "por favor,refaça\r"   ..
                                  "  a transação.\r"     ..
                                  " código %s"

gtMsg.MSGRET_ERRCON_PFV_LIGUE_CME="por favor, ligue\r"   ..
                                  "  para a rede\r"    ..
                                  "  e informe o\r"      ..
                                  " código %s.%02d-cme"

gtMsg.MSGRET_ERRCON_PFV_REFACA_CME= "por favor,refaça\r" ..
                                    "  a transação.\r"   ..
                                    " código %s.%02d-cme"

gtMsg.MSGDSP_ERR_INIT_SSLC      = "falha\r"           ..
                                  "certificado ssl\r" ..
                                  "contate rede"

gtMsg.MSGRET_TRANS_IGUAL_ANT    = "transação não realizada\r"..
                                  "idêntica a anterior"
gtMsg.MSGRET_ERRPIN_HARDWARE    = "problema pin-pad\r"   ..
                                  "oper. cancelada"
gtMsg.MSGRET_ERRPIN_CHAVE       = "erro de chave\r"   ..
                                  "ligar rede"
gtMsg.MSGRET_ERREMV_NO_CHIP     = "func.chip inativ\r"   ..
                                  " passe o cartão"
gtMsg.MSGRET_ERREMV_MAGNETICO   = "retire e passe\r"   ..
                                  "o cartão"
gtMsg.MSGRET_ERREMV_NO_APL      = "aplicação não\r"   ..
                                  "suportada"
gtMsg.MSGRET_ERREMV_NO_APL_CTLS = "aplicação não\r"   ..
                                  "suportada\r"   ..
                                  "insira ou passe\r"   ..
                                  "o cartão"
gtMsg.MSGRET_ERREMV_NEGADA      = "transação negada\r"   ..
                                  "ligue emissor"
gtMsg.MSGRET_ERREMV_RETIRADO    = "cartão\r"   ..
                                  "retirado"
gtMsg.MSGRET_ERREMV_BLOQUEADO   = "cartão bloqueado\r\r" ..
                                  "ligue emissor!"
gtMsg.MSGRET_ERREMV_MODO_INV    = "modo inválido\r"   ..
                                  "insira ou passe\r"   ..
                                  "o cartão"
                             
gtMsg.MSGRET_ERREMV_APL_INV     = "aplic. inválida!"

gtMsg.MSGRET_ERREMV_APL_BLOQ    = "aplicação bloqueada\r\r" ..
                                  "ligue emissor!"

gtMsg.MSGRET_ERR_EMV            = "erro emv"
gtMsg.MSGRET_ERREMV_HARDWARE    = "erro interno\r"       ..
                                  "pin-pad"

gtMsg.MSGRET_ERR_SEM_DESFZTO    = "não há desfazto"

gtMsg.MSGRET_NAO_PERMITE_DIG    = "transação não\r"   ..
                                  "permite digitado"
gtMsg.MSGRET_NAO_PERMITE_CHIP   = "transação não\r"   ..
                                  "permite chip"
gtMsg.MSGRET_ERRCFG_DEBVISTA    = "erro transação\r"  ..
                                  "ligue atend\r"     ..
                                  "rede"
gtMsg.MSGRET_SEM_CUPOM          = "função inválida"

gtMsg.MSGRET_ERR_TELECARGA      = "download não\r"   ..
                                  "concluído"
gtMsg.MSGRET_ERR_CARGA          = "carga aplicativo\r"   ..
                                  "não realizada"
gtMsg.MSGRET_ERR_ATUALIZACAO    = "atualização\r"   ..
                                  "não realizada"

gtMsg.MSGRET_USE_VOUCHER        = "utilize\r"   ..
                                  "função voucher"

gtMsg.MSGRET_FIM_VOUCHER        = "imprima o relatório\r" ..
                                  "de voucher antes\r"    ..
                                  "de finalizar"
                                  
gtMsg.MSGRET_PARAM_INVALIDO     = "parâmetro\r"   ..
                                  "inválido" 

gtMsg.MSGRET_FALHA_ATUALIZ_SENHA= "    falha na\r"       ..
                                  " troca de senha\r"    ..
                                  " tente novamente"

gtMsg.MSGRET_OPER_NAO_IDENTIF   = "operadora do\r"     ..
                                  "sim card não\r"     ..
                                  "identificada\r"

gtMsg.MSGRET_SERV_NAO_DISP      = "serviço\r"          ..
                                  "não disponível"  

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
gtMsg.MSGINP_SENHA_TECNICO      = "senha técnico:"

gtMsg.MSGINP_SENHA_INICIALIZACAO= "senha inicialização:"

gtMsg.MSGINP_SENHA_LOJISTA      = "senha lojista:"

gtMsg.MSGINP_SENHA              = "senha:"

gtMsg.MSGINP_NOVA_SENHA         = "digite senha nova:"
                                  
gtMsg.MSGINP_REPITA_SENHA       = "repita senha:"

gtMsg.MSGINP_DIGITE_SENHA       = "digite a senha:"
                                  
gtMsg.MSGINP_SENHA_LOJISTA_ATUAL= "senha lojista:"
                                  
gtMsg.MSGINP_DIGITE_REFERIDA    = "%s"
                                  
--   Entrada de dados - Configuração

gtMsg.MSGINP_NUMERO_OS          = "número de OS:"
gtMsg.MSGINP_NUMERO_TERMINAL    = "número do terminal:"
gtMsg.MSGINP_ID_TERMINAL        = "id. terminal"
gtMsg.MSGINP_FONE_INICIALIZACAO = "fone inicialização"
gtMsg.MSGINP_FONE_INICIALIZACAO2= "fone inic. sec"
gtMsg.MSGINP_FONE_TELECARGA     = "fone carga aplic"
gtMsg.MSGINP_TIME_OUT_RESPOSTA  = "time-out resp"
gtMsg.MSGINP_TENTATIVAS_CONEXAO = "tent. conexão"
gtMsg.MSGINP_NII                = "NII:"
gtMsg.MSGINP_CODIGO_ACESSO_PABX = "código acesso PABX:"
gtMsg.MSGINP_MODO_DISCAGEM      = "\rmodo de discagem:\r\r"
gtMsg.MSGINP_AUTORIZACAO        = "código autorização:"
gtMsg.MSGINP_COD_PESSOAL        = "código pessoal"

gtMsg.MSGINP_PREAUTORIZACAO     = "número de\r" ..
                                  "pré-autorização:"
gtMsg.MSGINP_OCORRENCIA         = "número ocorrência:"
gtMsg.MSGINP_HI                 = "número habilitação:"
gtMsg.MSGINP_ESTABELECIMENTO    = "número estabelecimento:"
gtMsg.MSGINP_ITEM               = "item:"
gtMsg.MSGINP_CONDICOES_PAGAMENTO= "cond. pagto:"
gtMsg.MSGINP_VENCIMENTO         = "vencto. pular:"
gtMsg.MSGINP_VELOCIDADE         = "velocidade\r\r"
gtMsg.MSGINP_NUMERO_TENTATIVAS  = "número de tentativas"
gtMsg.MSGINP_INTERVALO_ENVIO    = "intervalo de envio"
gtMsg.MSGINP_INTERVALO_HEART    = "intervalo de heart beat"
gtMsg.MSGINP_NRO_DOCUMENTO      = "número documento:"
gtMsg.MSGINP_APN                = "apn:"
gtMsg.MSGINP_BALANCEAMENTO      = "2 últ. dig. do terminal:"

gtMsg.MSGINP_VALOR              = "digite o valor:"
gtMsg.MSGINP_VALOR_SENHA        = "valor:"
gtMsg.MSGINP_PARCELAS           = "parcelas:"
gtMsg.MSGINP_IPDESTINO1         = "IP primário:" 

gtMsg.MSGINP_PORTA_DESTINO1     = "porta primária:"

gtMsg.MSGINP_IPDESTINO2         = "IP secundário:"

gtMsg.MSGINP_PORTA_DESTINO2     = "porta secundária:"

gtMsg.MSGINP_IP_CERTIF_SSL1     = "IP certificado\r" ..
                                  "SSL primário:"
gtMsg.MSGINP_PORTA_CERTIF_SSL1  = "porta primária SSL:"
gtMsg.MSGINP_IP_CERTIF_SSL2     = "IP certificado\r" ..
                                  "SSL secundário:"
gtMsg.MSGINP_PORTA_CERTIF_SSL2  = "porta secundária SSL:"
gtMsg.MSGINP_IP_POS             = "IP do POS:"
gtMsg.MSGINP_MASC_REDE_LOCAL    = "máscara da rede local:"
gtMsg.MSGINP_GATEWAY            = "gateway da rede local:"

gtMsg.MSGINP_CODIGO_ACESSO      = "digite a senha do rav:"
gtMsg.MSGINP_ID_PORTADOR        = "celular do cliente:"

gtMsg.MSGINP_SENHA_ATUAL        = "digite a senha\r" ..
                                  "atual:"

gtMsg.MSGINP_SENHA_NOVA         = "digite a nova\r" ..
                                  "senha:"

gtMsg.MSGINP_SENHA_CONFIRMA     = "confirme a nova\r" ..
                                  "senha:"

gtMsg.MSGINP_CONTING_DIAL       = "\rhabilitar contingência dial?\r\r"
gtMsg.MSGINP_DETECTA_LINHA      = "\rdetectar linha?\r\r"

--   Mensagens de sucesso apresentadas no final da operação

gtMsg.MSGDSP_CONFIGURACAO_OK    = "configuração\r"     ..
                                  "gravada"
                                  
gtMsg.MSGDSP_OP_EFET_TECLE_ENTER= "operação efetuada\r" ..
                                  "tecle entra\r"
                                
gtMsg.MSGDSP_TRANSACAO_ACEITA   = "transação\r"          ..
                                  "aceita"

gtMsg.MSGDSP_TRANSACAO_APROVADA = "transação\r"          ..
                                  "aprovada"

gtMsg.MSGDSP_TRANSACAO_COMPLETA = "transação\r"          ..
                                  "completa"

gtMsg.MSGDSP_TESTE_COMUNIC_OK   = "teste de comunicação\r" .. 
                                  "transação\r"            .. 
                                  "completada"

gtMsg.MSGDSP_OPERACAO_COMPLETADA= "op. completada"

gtMsg.MSGDSP_CONCLUIDO          = "concluído"

gtMsg.MSGDSP_INFO_TERMINAL      = "%s\r"                 .. -- Parâmetro: número do terminal
                                  "%-11.11s"                -- Parâmetro: versão da aplicação

gtMsg.MSGDSP_TRANS_EFETUADA     = "transação\r"          ..
                                  "efetuada e\r"         ..
                                  "concluída"

gtMsg.MSGDSP_INFO_TRANSF        = "%s\r"                 ..
                                  "informações\r"        ..
                                  "transferidas"

gtMsg.MSGDSP_TENTE_DE_NOVO      = "%s\r"                 ..
                                  " tente de novo"

gtMsg.MSGINP_MOSTRA_LOTE        = "lote: %06d"

gtMsg.MSGINP_SALDO_VOUCHER      = "%-16.16s\r"           ..
                                  "transação aprovada\r" ..
                                  "saldo disponível\r"   ..
                                  "%-16.16s"

gtMsg.MSGDSP_CARGA_CHV_COMPL    = " injeção chaves\r"    ..
                                  "trans.completada"

gtMsg.MSGDSP_SENHA_ATUALIZ_OK   = "senha atualizada\r"   ..
                                  "  com sucesso"

gtMsg.MSGDSP_TERM_FINALIZ_OK    = "terminal finalizado\r" ..
                                  "com sucesso"

--   Mensagens usadas durante transacoes com cartao                                 
gtMsg.MSGDSP_INSIRA_CARTAO      = "insira o cartão"

gtMsg.MSGDSP_PASSE_CARTAO       = "passe o cartão"

gtMsg.MSGDSP_DIGITE_CARTAO      = "digite o cartão"

gtMsg.MSGDSP_RETIRE_CARTAO      = "retire o cartão"

gtMsg.MSGDSP_INSIRA_PASSE_IDLE  = "insira ou passe\r"          ..
                                  "o cartão"

gtMsg.MSGDSP_INSIRA_PASSE_CARTAO= "insira ou passe\r"    ..
                                  "o cartão"

gtMsg.MSGDSP_SEM_CONTATO_VALOR  = "pagamento por\r"      ..
                                  "aproximação disponível"

gtMsg.MSGDSP_SEM_CONTATO_VALOR2 = "digite o valor, insira\r" ..
                                  "ou passe o cartão"

gtMsg.MSGDSP_PASSE_DIGITE_CARTAO= "passe ou digite\r"    ..
                                  "o cartão"

                                 --1234567890123456  
gtMsg.MSGDSP_PASSE_INSIRA_DIGITE= "passe, insira ou\r"   ..
                                  "digite o cartão"

gtMsg.MSGDSP_APRX_INS_PASSE_CART= "aproxime o cartão aqui,\r" .. 
                                   "insira ou passe o cartão"
                                  
gtMsg.MSGDSP_INCIALIZE_POS_TEC_1= "inicialize o pos\r"   ..  
                                  "tecle 1"

gtMsg.MSGINP_NUMERO_CARTAO      = "número do cartão:"

gtMsg.MSGINP_QUATRO_DIGITOS     = "digite 4 últimos dígitos:"

gtMsg.MSGINP_CODIGO_SEGURANCA   = "código segurança:"
gtMsg.MSGINP_CODIGO_SEGURANCA2  = "código de segurança:\r\r"

gtMsg.MSGINP_DATA_VALIDADE      = "validade (mm/aa):"

gtMsg.MSGINP_DATA               = "data (ddmmaa):"

gtMsg.MSGINP_HORA_TELECARGA     = "informe hh:mm:"

gtMsg.MSGINP_NUMERO_PARCELAS    = "número de parcelas:"

gtMsg.MSGINP_AUTO_POWER         = "power off(minutos):"

gtMsg.MSGDSP_DATA_INVALIDA      = "data inválida"

gtMsg.MSGDSP_FUNCAO             = "função:"
gtMsg.MSGDSP_VALOR_PARCELA      = "valor parcela:"
gtMsg.MSGDSP_VALOR_TOTAL        = "valor total:"
gtMsg.MSGDSP_COD_VEICULO        = "código veículo:"
gtMsg.MSGDSP_COD_CONDUTOR       = "código condutor:"
gtMsg.MSGDSP_COD_COMBUSTIVEL    = "código combustível:"
gtMsg.MSGDSP_LITRAGEM           = "litragem:"
gtMsg.MSGDSP_KM                 = "quilometragem:"
gtMsg.MSGDSP_ERR_LITRAGEM       = "digite a\r"           ..
                                  "litragem"
gtMsg.MSGDSP_ERR_QUILOMETRAGEM  = "digite a\r"           ..
                                  "quilometragem"
gtMsg.MSGDSP_ERR_COMBUSTIVEL    = "digite o código\r"    ..
                                  "do combustível"
gtMsg.MSGDSP_ERR_PREENCHER      = "favor preencher\r"    ..
                                  "esta informação"

gtMsg.MSGDSP_ERR_NAO_CONCLUIDA  = "transação não\r"      ..
                                  "concluída"

--   Titulos de transacoes (Exibidas durante mensagem Insira/passe cartao)

--   mdg -> Mensagem display grande


--                              =  1234567890123456
gtMsg.MSGGDE_PRE_AUTORIZACAO    = "pré-autorização"
gtMsg.MSGGDE_CAPTURA            = "captura crédito"
gtMsg.MSGGDE_P_LABEL            = "private label"
gtMsg.MSGGDE_DEBITO             = "débito"
gtMsg.MSGGDE_DEB_DISTRIB        = "distribuição"
gtMsg.MSGGDE_CREDITO            = "crédito"
gtMsg.MSGGDE_CONFIRMACAO_PRE_AUT= "confirmação"
gtMsg.MSGGDE_VOUCHER            = "voucher"
gtMsg.MSGGDE_VOUCHER_FROTA      = "voucher frota"
gtMsg.MSGGDE_VOUCHER_TROCA_SENHA= "troca de senha"
gtMsg.MSGGDE_BAIXA_TECNICA      = "baixa técnica"
gtMsg.MSGGDE_SERASA             = "consulta à cheque"
gtMsg.MSGGDE_CANCELAMENTO       = "cancelamento"
gtMsg.MSGGDE_CANCELAMENTO_PRE   = "cancelamento"
gtMsg.MSGGDE_RESUMO             = "resumo de vendas"
gtMsg.MSGGDE_SEM_TITULO         = ""
gtMsg.MSGGDE_FINALIZACAO        = "finalização"
gtMsg.MSGGDE_RAV                = "rav"
gtMsg.MSGGDE_FECHAMENTO_EMISSOR = "fechamento emissor"
gtMsg.MSGGDE_FONESHOP           = "celular"
gtMsg.MSGGDE_FONESHOP_CAPT      = "transação"
gtMsg.MSGGDE_CREDIARIO          = "crediário"


--   Mensagens exibidas ao lado do emissor na digitacao de valores
   
--   mdp -> Mensagem display pequeno

gtMsg.MSGPEQ_CANC               = gtMsg.MSGGDE_CANCELAMENTO_PRE
gtMsg.MSGPEQ_CAP_PARC_ADM       = "cap ad"
gtMsg.MSGPEQ_CAP_PARC_EST       = "cap es"
gtMsg.MSGPEQ_CAP_VISTA          = "cap-cr"
gtMsg.MSGPEQ_CHEQUE             = "cheque"
gtMsg.MSGPEQ_CONF               = "confirmar pré-auto"
gtMsg.MSGPEQ_CONS               = "  cons"
gtMsg.MSGPEQ_CRED               = "crédito à vista"
gtMsg.MSGPEQ_DEB_PRE            = "débito pré-datado"
gtMsg.MSGPEQ_DEB_VISTA          = "débito à vista"
gtMsg.MSGPEQ_PARC               = ""
gtMsg.MSGPEQ_PARC_ADM           = "crédito parc. emiss" 
gtMsg.MSGPEQ_PARC_EST           = "crédito parc. estab"
gtMsg.MSGPEQ_PRE_AUT            = gtMsg.MSGMNU_PRE_AUTORIZACAO
gtMsg.MSGPEQ_CREDIARIO          = "crediário"
gtMsg.MSGPEQ_PRIV_LABEL         = "private label"
gtMsg.MSGPEQ_VAZIA              = ""

-- serasa
gtMsg.MSGTIT_SERASA             = "consulta à cheque"
gtMsg.MSGMNU_PEND_FINANCEIRA    = "pefin"
gtMsg.MSGINP_NUMERO_CHEQUE      = "número cheque:"
gtMsg.MSGINP_NUMERO_BANCO       = "número do banco:"
gtMsg.MSGINP_NUMERO_AGENCIA     = "número da agência:"
gtMsg.MSGINP_NUMERO_CONTA       = "C/C:"
gtMsg.MSGINP_CNPJ_CPF           = "CNPJ/CPF:"
gtMsg.MSGINP_DDD                = "ddd:"
gtMsg.MSGINP_TELEFONE           = "telefone:"
gtMsg.MSGINP_SERASA_BLOCO1      = "bloco 1:"
gtMsg.MSGINP_SERASA_BLOCO2      = "bloco 2:"
gtMsg.MSGINP_SERASA_BLOCO3      = "bloco 3:"
gtMsg.MSGDSP_DADO_INVALIDO      = "dado inválido"
gtMsg.MSGDSP_CPF_INVALIDO       = "cpf inválido"
gtMsg.MSGDSP_COD_INVALIDO       = "código inválido"

-- rav
gtMsg.MSGTIT_RESGATE_SENHA      = "resgate de senha"
gtMsg.MSGTIT_RAV_TOTAL          = "rav total"
gtMsg.MSGTIT_RAV_PARCIAL        = "rav parcial"
gtMsg.MSGTIT_RAV_AUTOMATICO     = "rav automático"
gtMsg.MSGINP_RAV_CPF            = "digite o cpf do\r" ..
                                  "proprietário:"
gtMsg.MSGINP_RAV_AGENCIA        = "digite a agência do\r" ..
                                  "domicílio bancário:"
gtMsg.MSGINP_RAV_CONTA          = "digite a conta corrente\r" ..
                                  "do domicílio bancário:"
gtMsg.MSGINP_RAV_CEP            = "digite o cep do\r" ..
                                  "proprietário:"
gtMsg.MSGDSP_RAV_TOTAL_OK       = "rav total efetuado\r" ..
                                  "com sucesso"
gtMsg.MSGDSP_RAV_PARCIAL_OK     = "rav parcial efetuado\r" ..
                                  "com sucesso"
gtMsg.MSGDSP_RAV_AUTO_OK        = "rav automático\r" ..
                                  "efetuado com\r"   ..
                                  "sucesso"
gtMsg.MSGDSP_SENHA_RESGATADA    = "senha resgatada\r" ..
                                  "com sucesso"
gtMsg.MSGDSP_RAV_DESEJA_AVULSO  = "deseja realizar\r" ..
                                  "rav avulso?"
gtMsg.MSGDSP_SALDO_DISP         = "saldo disponível:\r" ..
                                  "R$ %s\r"               ..
                                  "confirma?"
gtMsg.MSGDSP_SALDO_DISP_DATA    = "valor a receber hoje:\r\r" ..
                                  "%s\r"                    ..
                                  "R$%13.13s"

-- posição de vendas
gtMsg.MSGDSP_SEM_MAIS_TOTAIS    = "sem mais totais"
gtMsg.MSGDSP_VERIFICANDO_LOTE   = "verificando lote\r"   ..
                                  "aguarde um momento"

gtMsg.MSGINP_NUM_AUTENTICA      = "número AUTE:"

gtMsg.MSGINP_NUM_CV             = "número do CV:"

gtMsg.MSGINP_CONFIRMACAO        = "confirmar estorno?"

--   Mensagens para impressão   (devem ser em maiúsculo e sem acentuação)

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

-- Mensagens para relatório em tela 
gtMsg.MSGDSP_TOTAL_VENDAS       = "total de vendas"
