*** Settings ***
Documentation   	Login através de um popup.

Library   	SeleniumLibrary

Resource  ../resources/variables.robot
Suite Teardown  Close browser


*** Variables ***
${url}              https://admin:admin@the-internet.herokuapp.com/basic_auth


*** Test Cases ***
Cenário: login por um popup
    Entrar na página com login e senha passados por url
    Verificar se está na página correta


*** Keywords ***
Entrar na página com login e senha passados por url
    Open browser  ${url}  ${browser}


Verificar se está na página correta
    Page should contain  Congratulations! You must have the proper credentials.