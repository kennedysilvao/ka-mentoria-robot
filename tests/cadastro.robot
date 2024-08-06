*** Settings ***
Documentation    Testes de cadastro

Resource    ../resources/Base.resource

Test Setup    Iniciar Browser
Test Teardown    Fechar browser

*** Test Cases ***
Deve realizar cadastro com sucesso
    # Clicar no cadastre-se
    Click    xpath=//a[contains(.,"Cadastre-se")]

    # preencher campos
    Fill Text    css=input[placeholder$="nome"]     Silvana da Paz
    Fill Text    css=input[placeholder$="email"]    silvana@gmail.com
    Fill Text    css=input[placeholder$="senha"]    pwd123

    # Clicar no checkbox
    Check Checkbox    css=input[name="administrador"]


    # Clicar no botão Cadastrar
    Click    css=button >> text=Cadastrar

    Sleep    7