*** Settings ***
Documentation    Ações e elementos do Header

Library    Browser

*** Keywords ***
Acessar formulário de cadastro de produto
    Click    css=a[data-testid="cadastrar-produtos"]