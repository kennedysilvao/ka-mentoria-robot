*** Settings ***
Documentation    Ações e elementos da página de login

Library    Browser

*** Keywords ***
Acessar a pagina de cadastro
    Click    xpath=//a[contains(. , "Cadastre-se")]

Validar que estou na página de login
    Wait For Elements State    css=h1 >> text=Login    visible    10

Preencher campos de login
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[placeholder$="email"]    ${email}
    Fill Text    css=input[name="password"]         ${password}

Submeter login
    Click    css=button >> text=Entrar