*** Settings ***
Documentation    Ações e elementos da página de cadastro

Library    Browser

*** Keywords ***
Validar que estou na pagina de cadastro
    Wait For Elements State    xpath=//h2[text()="Cadastro"]    visible    5

Preencher campos do usuario
    [Arguments]    ${nome}    ${email}    ${pass}

    Fill Text    css=input[data-testid="nome"]      ${nome}
    Fill Text    css=input[name="email"]            ${email}
    Fill Text    css=input[placeholder$="senha"]    ${pass}

Marcar o checkbox de administrador
    Check Checkbox    id=administrador

Submeter cadastro
    Click    css=button >> text=Cadastrar

Validar mensagem de alerta
    [Arguments]    ${expected_message}

    Get Text    css=span >> text=${expected_message}
    ...    equal
    ...    ${expected_message}
    