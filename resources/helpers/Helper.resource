*** Settings ***
Documentation    Helpers API

Library    RequestsLibrary
Resource    ../Base.resource

*** Variables ***
${URL}    https://serverest.dev

*** Keywords ***
Criar sessão
    ${HEADER}    Create Dictionary    Content-Type=application/json
    Create Session    alias=serverest    url=${URL}    headers=${HEADER}    disable_warnings=1
Criar um usuário
    [Arguments]    ${user}

    ${response}    POST On Session    url=${URL}/usuarios    alias=serverest
    ...    json=${user}
    
    Should Be Equal As Strings    ${response.status_code}    201