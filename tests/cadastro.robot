*** Settings ***
Documentation    Testes de cadastro

Resource    ../resources/Base.resource
Resource    ../resources/pages/Home.resource

Test Setup    Iniciar Browser
Test Teardown    Fechar browser

*** Test Cases ***
Caso de teste 01: Deve realizar cadastro com sucesso
    [Documentation]    CT01 - Deve realizar cadastro com sucesso
    [Tags]    cadastro_realizado

    ${nome}    Gerar Nome
    ${email}    Gerar Email

    ${user}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=pwd123

    
    Acessar a pagina de cadastro
    Validar que estou na pagina de cadastro
    Preencher campos do usuario    ${user}[nome]    ${user}[email]    ${user}[password]
    Marcar o checkbox de administrador
    Submeter cadastro
    Usuario logado com sucesso    ${user}[nome]
    

Caso de teste 02: Campo nome deve ser obrigatório
    [Documentation]    CT02 - Campo nome deve ser obrigatório
    [Tags]    nome_obrigatorio

    ${user}    Create Dictionary
    ...    nome=${EMPTY}
    ...    email=andressa@gmail.com
    ...    password=pwd123

    
    Acessar a pagina de cadastro
    Validar que estou na pagina de cadastro
    Preencher campos do usuario    ${user}[nome]    ${user}[email]    ${user}[password]
    Marcar o checkbox de administrador
    Submeter cadastro

    Validar mensagem de campo obrigatorio    Nome é obrigatório
    

Caso de teste 03: Campo email deve ser obrigatório
    [Documentation]    CT02 - Campo nome deve ser obrigatório
    [Tags]    email_obrigatorio

    ${user}    Create Dictionary
    ...    nome=Andressa Machado
    ...    email=${EMPTY}
    ...    password=pwd123

    
    Acessar a pagina de cadastro
    Validar que estou na pagina de cadastro
    Preencher campos do usuario    ${user}[nome]    ${user}[email]    ${user}[password]
    Marcar o checkbox de administrador
    Submeter cadastro

    Validar mensagem de campo obrigatorio    Email é obrigatório
    

Caso de teste 04: Campo password deve ser obrigatório
    [Documentation]    CT02 - Campo nome deve ser obrigatório
    [Tags]    password_obrigatorio

    ${user}    Create Dictionary
    ...    nome=Andressa Machado
    ...    email=andressa22@yahoo.com
    ...    password=${EMPTY}

    
    Acessar a pagina de cadastro
    Validar que estou na pagina de cadastro
    Preencher campos do usuario    ${user}[nome]    ${user}[email]    ${user}[password]
    Marcar o checkbox de administrador
    Submeter cadastro

    Validar mensagem de campo obrigatorio    Password é obrigatório
    