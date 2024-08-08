*** Settings ***
Documentation    Ações e elementos da Home

Library    Browser

*** Keywords ***
Usuario logado com sucesso
    [Arguments]    ${nome}

    Wait For Elements State    css=.jumbotron    visible    10

    Get Text    xpath=//h1[contains(. , "${nome}")]
    ...    contains
    ...    ${nome}