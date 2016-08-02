--MENU INICIAL

--Pagamento
----Autenticação
----Valor?
----Verificar saldo
----Debitar
----Comprovante

---Recarga
----Autenticação
----Valor?
----Recarga
----Comprovante

---Saldo
----Autenticação
----Exibir o saldo

---Sair
require("json")

arquivo = io.open("clientes.txt", "rw")
clientes = arquivo:read("*a")
arquivo:close()

clientes = json.decode(clientes)

executando = true

function autenticar()
    pedirUsuario = ui.textfield("Autenticar", "Digite o nome de usuario")
    pedirUsuario:show()
    usuario = pedirUsuario:text()
    ui.destroy(pedirUsuario)

    pedirSenha = ui.textfield("Autenticar", "Digite a senha", 16, 0, true)
    pedirSenha:show()
    senha = pedirSenha:text()
    ui.destroy(pedirSenha)

    if clientes[usuario] then
        if senha == client[usuario]["senha"] then
            return usuario
        end
    else
        return nil
    end
end

function pedirValor()
    telaValor = ui.textfield("Valor", "Digite o valor")
    teleValor:show()
    return telaValor:text()
end

function transacao(usuario, valor, tipo)
    if tipo == 'c' then
    clientes[usuario]["saldo"] = clientes

end

function imprimir(usuario, valor, tipo)
    printer.print("NOME DA LOJA", "center")
    printer.print(os.date(), "center")
    printer.linefeed(2)
    if tipo == 'c' then
        printer.print("Recarga efetuada com sucesso!")
    else
        printer.print("Pagamento efetuado com sucesso!")
    end
    printer.linefeed(1)
    printer.

while executando do

inicial = ui.menu("APP MasterTech", {"Pagamento", "Recarga", "Saldo", "Sair"})

inicial:show()

opcao = inicial:accepted()

if opcao == 1 then
    usuario = autenticar()
    if usuario = then
        valor = pedirValor()
        if valor <= clientes[usuario]["saldo"] then
            transacao(usuario, valor, 'd')
            ui.transient("", "TRANSACAO Ok", 1500)
            imprimir(usuario, valor, 'd')
        else
            ui.transient("ERRO", "Saldo insuficiente", 1500)
        end
    else
        ui.transient("ERRO", "Falha no Login", 1500)
    end
elseif opcao == 2 then
    usuario = autenticar()
    if usuario then
    valor = pedirValor()
    transacao(usuario,valor, 'c')
    ui.transient("", "TRANSACAO OK", 1500)
    imprimir(usuario, valor, 'c')
else
ui.transient("", "Login invalido", 1500)
end

elseif opcao == 3 then
    usuario = autenticar()
    if usuario then
        ui.message("SALDO", "Seu saldo total e de R$"..clientes[usuario]["saldo"])
        keyboard.getkeystroke()
    else
    ui.transient("ERRO","Login invalido", 1500)
    end
else
executando = false
end

end -- do while


