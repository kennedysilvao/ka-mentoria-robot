*** Settings ***
Documentation    Utils

Resource    ../Base.resource

*** Keywords ***
Realizar cadastro e fazer login
    ${nome}    Gerar Nome
    ${email}    Gerar Email
    ${user}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=pwd123
    ...    administrador=true
    
    Set Test Variable    ${user}

    Criar sessão
    Criar um usuário    ${user}

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Usuario logado com sucesso    ${user}[nome]