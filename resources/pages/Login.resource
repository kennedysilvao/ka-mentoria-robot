*** Settings ***
Documentation    Ações e elementos da página de login

Library    Browser

*** Keywords ***
Acessar a pagina de cadastro
    Click    xpath=//a[contains(. , "Cadastre-se")]