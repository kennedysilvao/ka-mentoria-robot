*** Settings ***
Documentation    Configurações iniciais

Library    Browser
Library    libs/gerador_de_massa.py
Resource    pages/Cadastro.resource
Resource    pages/Login.resource

*** Keywords ***
Iniciar Browser
    New Browser    browser=chromium    headless=False
    New Page    https://front.serverest.dev

Fechar browser
    Take Screenshot
    Close Browser