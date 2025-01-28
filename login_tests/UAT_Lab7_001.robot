*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${Form}      http://${SERVER}/Form.html
${Complete}    http://${SERVER}/Complete.html
${FNAME}     Somsong
${LNAME}    Sandee
${DESTINATIONS}    Europe
${CONTACT_PERSON}    Sodsai Sandee
${RELATIONSHIP}    Mother
${EMAIL}    somsong@kkumail.com
${PHONE}    081-111-1234

*** Test Cases ***
Form Submission with Valid Data
    Open Browser    ${Form}    chrome
    Input Text    id=firstname    ${FNAME}
    Input Text    id=lastname   ${LNAME}
    Input Text    id=destination    ${DESTINATIONS}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship    ${RELATIONSHIP}
    Input Text    id=email   ${EMAIL}
    Input Text    id=phone    ${PHONE}
    Click Button    id=submitButton
    Sleep    2s
    Close Browser
    Open Browser    ${Complete}    chrome
    Sleep    5s

