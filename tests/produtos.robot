*** Settings ***
Documentation    Suite de testes de produtos

Resource    ../resources/Base.resource
Resource    ../resources/helpers/Utils.resource

Test Setup    Iniciar Browser
Test Teardown    Fechar browser

*** Test Cases ***
Caso de teste 01: Deve cadastrar um produto com sucesso
    [Documentation]    CT01 - Deve cadastrar um produto com sucesso
    [Tags]    cad_prod

    ${product}    Create Dictionary
    ...    name=Playstation 6
    ...    price=4500
    ...    description=Branco, com dois controles
    ...    quantity=5

    Realizar cadastro e fazer login

    ${user_api}    Create Dictionary
    ...    email=${user}[email]
    ...    password=${user}[password]

    Criar sessão
    Fazer login pela API    ${user_api}

    Buscar produto por nome    ${product}[name]
    Deletar produto por ID    ${product_id}

    Acessar formulário de cadastro de produto
    Validar que estou na página de produtos
    Preencher campos do produto    ${product}[name]    ${product}[price]    ${product}[description]    ${product}[quantity]
    Submeter cadastro de produto
    Validar que produto foi cadastrado com sucesso    ${product}[name]
