*** Settings ***
Documentation   	Automação da tela de login.
...  Reparem que não segue as boas práticas, pois o cenário de logout depende do login

Library   	SeleniumLibrary

Suite Setup     Dado que estou na tela de login
Suite Teardown  Close browser


*** Variables ***
${browser}   	    Chrome
${url}              https://the-internet.herokuapp.com/login
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
    Open browser    ${url}  ${browser}


Quando realizo o login com usuário e senha válidos
    Input Text      ${username_field}   ${username}
	Input Password  ${password_field}  	${password}
	Click Button   	${submit_button}


Então devo visualizar a mensagem "${mensagem}"
    Element should contain  id=flash  ${mensagem}


Cenário: logout
Quando realizo o logout
    Click element  ${logout_button}


Cenários inváridos
Quando realizo o login com usuário inválido
    Input Text      ${username_field}   ${username}s
	Input Password  ${password_field}  	${password}
	Click Button   	${submit_button}

Quando realizo o login com senha inválida
    Input Text      ${username_field}   ${username}
	Input Password  ${password_field}  	${password}s
	Click Button   	${submit_button}
