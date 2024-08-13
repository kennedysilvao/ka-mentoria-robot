*** Settings ***
Documentation    Ações e elementos da página de produto

Library    Browser

*** Keywords ***
Validar que estou na página de produtos
    Wait For Elements State    css=h1 >> text=Cadastro de Produtos    visible    10

Preencher campos do produto
    [Arguments]    ${name}    ${price}    ${description}    ${quantity}

    Fill Text    css=input[name="nome"]    ${name}
    Fill Text    css=input[name="price"]    ${price}
    Fill Text    css=textarea[id="description"]    ${description}
    Fill Text    css=input[name="quantity"]    ${quantity}

Submeter cadastro de produto
    Click    css=button >> text=Cadastrar