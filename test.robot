*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** *** Variables ***
${URL}    https://wizzair.com/pl-pl#/
${BROWSER}    Chrome
${NAME}    Ala
${SURNAME}    Kot
${GENDER}    Kobieta
${COUNTRY_CODE}    Malta
${TELEPHONE}     3424244474
${INVALID_EMAIL}    Alao2.pl
${PASSWORD}    76kotpies98
${COUNTRY}    Malta
@{ERROR_NOTICE}    = Nieprawidłowy adres e-mail


*** Test Cases ***
Wizzair Registration With Invalid E-mail
    Open main page and click login button
    Click registration button
    Input valid name
    Input valid surname
    Check valid gender
    Input valid telephone number
    Input invalid e-mail
    Input valid password
    Input valid country
    Input valid country code
    Accept the privacy notice
    Click final registration button


*** Keywords ***
Open main page and click login button
    Open browser    ${URL}   ${BROWSER}
    Click Element    class=rf-mobile-login__logged-out
Click registration button
    Click Element    xpath=//button[text()='Rejestracja']
Input valid name
    Input Text    xpath=//input[@placeholder="Imię"]    ${NAME}
Input valid surname
    Input Text    xpath=//input[@placeholder="Nazwisko"]    ${SURNAME}
Check valid gender
    Click element    xpath=//label[@for='register-gender-female']
Input valid telephone number
    Input Text    name=phoneNumberValidDigits   ${TELEPHONE}
Input invalid e-mail
    Input Text    css=input[placeholder='E-mail'][data-test='booking-register-email']    ${INVALID_EMAIL}
Input valid password
    Input Text    xpath=//input[@data-test='booking-register-password']    ${PASSWORD}
Input valid country
    Input Text    id=regmodal-scroll-hook-6    ${COUNTRY}
Input valid country code
    Input Text    class=phone-number__calling-code-selector__empty__placeholder    ${COUNTRY_CODE}
Accept the privacy notice
    Click element    xpath=//label[@for='registration-privacy-policy-checkbox']
Click final registration button
    Click element    //button[@data-test='booking-register-submit']