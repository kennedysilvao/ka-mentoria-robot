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

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Usuario logado com sucesso    ${user}[nome]