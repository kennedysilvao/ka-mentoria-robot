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

Buscar produto por nome
    [Arguments]    ${nome}

    ${response}    GET On Session    url=${URL}/produtos    alias=serverest
    ...    params=nome=${nome}
    
    Should Be Equal As Strings    ${response.status_code}    200

    FOR    ${product}    IN    @{response.json()['produtos']}
        ${product_id}    Set Variable    ${product['_id']}
        Set Test Variable    ${product_id}
    END

Fazer login pela API
    [Arguments]    ${credentials}
    ${response}    POST On Session    url=${URL}/login    alias=serverest    
    ...    json=${credentials}

    Should Be Equal As Strings    ${response.status_code}    200
    ${token}    Set Variable    ${response.json()}[authorization]
    Set Test Variable    ${token}

Deletar produto por ID
    [Arguments]    ${id}
    ${HEADER}    Create Dictionary    Authorization=${token}

    ${response}    DELETE On Session    url=${URL}/produtos/${id}    alias=serverest    headers=${HEADER}
    Should Be Equal As Strings    ${response.status_code}    200

    