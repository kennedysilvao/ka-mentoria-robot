*** Settings ***
Documentation    Suite de testes de login

Resource    ../resources/Base.resource

Test Setup       Iniciar Browser
Test Teardown    Fechar browser

*** Test Cases ***
Caso de teste 01: Deve realizar login com sucesso
    [Documentation]    CT01 - Deve realizar login com sucesso
    [Tags]    login_sucesso

    # Cadastrar usuario
    ${nome}    Gerar Nome
    ${email}    Gerar Email

    ${user}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=pwd123
    ...    administrador=true
    Criar sessão
    Criar um usuário    ${user}
    
    ${test}    Create Dictionary
    ...    email=${email}
    ...    password=pwd123
    
    Fazer login pela API    ${test}

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Usuario logado com sucesso    ${user}[nome]

Caso de teste 02: Não deve realizar login com senha incorreta
    [Documentation]    CT02 - Não deve realizar login com senha incorreta
    [Tags]    inv_pass

    # Cadastrar usuario
    ${nome}    Gerar Nome
    ${email}    Gerar Email

    ${user}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=pwd123
    ...    administrador=true
    Criar sessão
    Criar um usuário    ${user}
    
    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    pwd124
    Submeter login
    Validar mensagem de alerta    Email e/ou senha inválidos

Caso de teste 03: Campo email é obrigatório
    [Documentation]    CT03 - Campo email é obrigatório
    [Tags]    req_email

    ${user}    Create Dictionary
    ...    email=${EMPTY}
    ...    password=pwd123

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Validar mensagem de alerta    Email é obrigatório

Caso de teste 04: Campo password é obrigatório
    [Documentation]    CT04 - Campo password é obrigatório
    [Tags]    req_password

    ${user}    Create Dictionary
    ...    email=password_2020@gmail.com
    ...    password=${EMPTY}

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Validar mensagem de alerta    Password é obrigatório