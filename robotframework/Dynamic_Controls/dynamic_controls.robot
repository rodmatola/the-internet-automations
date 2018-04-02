*** Settings ***
Documentation  Remover e adicionar

Library   	SeleniumLibrary

Resource  ../resources/variables.robot


#Suite Teardown  Close browser


*** Variables ***
${page}             dynamic_controls
${message_field}    id=message
${message_gone}     It's gone!
${message_back}     It's back!
${checkbox_id}      id=checkbox
${button_id}        id=btn

*** Test Cases ***
Cenário: remover checkbox
    [Tags]  remover_checkbox
    Dado que estou na página Dynamic Controls
    Quando presssionar o botão Remove
    Então o checkbox deve ser removido


Cenário: adicionar checkbox
    [Tags]  adicionar_checkbox
    Dado que estou na página Dynamic Controls sem checkbox
    Quando presssionar o botão Add
    Então o checkbox deve ser reaparecer


*** Keywords ***
Contexto
Dado que estou na página Dynamic Controls
    Open browser  ${url}${page}  ${browser}


Cenário: remover checkbox
Quando presssionar o botão ${botao}
    Wait Until Element is enabled  ${button_id}
    Click button  ${botao}


Então o checkbox deve ser removido
    Wait Until Page Contains Element  ${message_field}
    Element text should be  ${message_field}  ${message_gone}


Cenário: adicionar checkbox
Dado que estou na página Dynamic Controls sem checkbox
    Dado que estou na página Dynamic Controls
    Execute javascript  onClick()


Então o checkbox deve ser reaparecer
    Wait Until Page Contains Element  ${message_field}
    Element text should be  ${message_field}  ${message_back}
    Page should contain checkbox  ${checkbox_id}