*** Settings ***
Documentation    Configurações iniciais

Library    Browser

*** Keywords ***
Iniciar Browser
    New Browser    browser=chromium    headless=False
    New Page    https://front.serverest.dev

Fechar browser
    Take Screenshot
    Close Browser