*** Settings ***
Documentation   	Automação da tela de login.
...  Cenários:
...  login válido
...  logout
...  usuário inválido
...  senha inválida

Library   	SeleniumLibrary

Resource  ../resources/variables.robot

Test Setup     Dado que estou na tela de login
Test Teardown  Close browser


*** Variables ***
${page}             login
${username_field}   id = username
${password_field}   id = password
${username}   	    tomsmith
${password}   	    SuperSecretPassword!
${submit_button}    css = #login > button
${logout_button}    css = #content > div > a

*** Test Cases ***
Cenário: login válido
    [Tags]  login_valido
    Quando realizo o login com usuário e senha válidos
    Então devo visualizar a mensagem "You logged into a secure area!"


Cenário: logout
    [Tags]  logout
    E logado no sistema
    Quando realizo o logout
    Então devo visualizar a mensagem "You logged out of the secure area!"


Cenário: usuário inválido
    [Tags]  login_invalido
    Quando realizo o login com usuário inválido
    Então devo visualizar a mensagem "Your username is invalid!"


Cenário: senha inválida
    [Tags]  login_invalido
    Quando realizo o login com senha inválida
    Então devo visualizar a mensagem "Your password is invalid!"


*** Keywords ***
Cenário: login válido
Dado que estou na tela de login
    Open browser    ${url}${page}  ${browser}


Quando realizo o login com usuário e senha válidos
    Input Text      ${username_field}   ${username}
	Input Password  ${password_field}  	${password}
	Click Button   	${submit_button}


Então devo visualizar a mensagem "${mensagem}"
    Element should contain  id=flash  ${mensagem}


Cenário: logout
E logado no sistema
    Quando realizo o login com usuário e senha válidos

Quando realizo o logout
    Click element  ${logout_button}


Cenários inválidos
Quando realizo o login com usuário inválido
    Input Text      ${username_field}   ${username}s
	Input Password  ${password_field}  	${password}
	Click Button   	${submit_button}

Quando realizo o login com senha inválida
    Input Text      ${username_field}   ${username}
	Input Password  ${password_field}  	${password}s
	Click Button   	${submit_button}
