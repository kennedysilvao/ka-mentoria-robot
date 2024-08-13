*** Settings ***
Documentation    Ações e elementos da Lista de Produtos

Library    Browser

*** Keywords ***
Validar que produto foi cadastrado com sucesso
    [Arguments]    ${product_name}

    Wait For Elements State    xpath=//td[text()="${product_name}"]    visible    10

    Get Text    xpath=//td[text()="${product_name}"]
    ...    equal
    ...    ${product_name}