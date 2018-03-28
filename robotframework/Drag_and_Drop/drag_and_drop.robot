*** Settings ***
Documentation  Automação para arrastar uma caixa de um local a outro da tela.
...  Ainda não finalizada. Falhando.

Library  SeleniumLibrary

*** Variables ***
${page}             drag_and_drop
${caixaA}           css=#column-a  #id=column-a
${caixaB}           css=#column-b  #id=column-b
${caixa_esquerda}   css=#column-a > header
${caixa_direita}    css=#column-b > header

*** Test Cases ***
Cenário: Trocar a caixa A com a B
    Abrir a página
    Verificar a ordem A, B
    Arrastar A para o lugar de B
    Verificar que as caixas trocaram de lugar


*** Keywords ***
Abrir a página
    Open browser  ${url}${page}  ${browser}

Verificar a ordem A, B
    Element text should be  ${caixaA}  A
    Element text should be  ${caixaB}  B

Arrastar A para o lugar de B
    Drag and drop by offset  ${caixaA}  100  0
    #Drag and drop  ${caixaA}  ${caixaB}

Verificar que as caixas trocaram de lugar
    sleep  1
    Element text should be  ${caixa_esquerda}  B
    Element text should be  ${caixa_direita}  A
