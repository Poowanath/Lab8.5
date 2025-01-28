*** Settings ***
Library           SeleniumLibrary
Library    XML

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
Form Submission with out DESTINATIONS
    [Documentation]    ไม่กรอก DESTINATIONS
    Open Browser    ${Form}    chrome
    Input Text    id=firstname    ${FNAME}
    Input Text    id=lastname   ${LNAME}
    Clear Element Text    id=destination    
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship    ${RELATIONSHIP}
    Input Text    id=email   ${EMAIL}
    Input Text    id=phone    ${PHONE}
    Click Button    id=submitButton
    Sleep    2s
    ${error_message}=  Get Text          id=errors
    Should Be Equal As Strings    ${error_message}    *Please enter your destination!!
    Close Browser

Form Submission with wrong email
    [Documentation]    ไม่กรอก Email 
    Open Browser    ${Form}    chrome
    Input Text    id=firstname    ${FNAME}
    Input Text    id=lastname   ${LNAME}
    Input Text    id=destination    ${DESTINATIONS}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship    ${RELATIONSHIP}
    Clear Element Text    id=email   
    Input Text    id=phone    ${PHONE}
    Click Button    id=submitButton
    Sleep    2s
    ${error_message}=  Get Text          id=errors
    Should Be Equal As Strings    ${error_message}    *Please enter an email!!
    Close Browser

Form Submission with wrong email 2
    [Documentation]    กรอก Email ไม่ถูก
    Open Browser    ${Form}    chrome
    Input Text    id=firstname    ${FNAME}
    Input Text    id=lastname   ${LNAME}
    Input Text    id=destination    ${DESTINATIONS}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship    ${RELATIONSHIP}
    Input Text    id=email   somsong@
    Input Text    id=phone    ${PHONE}
    Click Button    id=submitButton
    Sleep    2s
    ${error_message}=  Get Text          id=errors
    Should Be Equal As Strings    ${error_message}    *Please enter a valid email!!
    Close Browser


Form Submission with out Phone Number
    [Documentation]    ไม่กรอก Phone Number
    Open Browser    ${Form}    chrome
    Input Text    id=firstname    ${FNAME}
    Input Text    id=lastname   ${LNAME}
    Input Text    id=destination    ${DESTINATIONS}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship    ${RELATIONSHIP}
    Input Text    id=email   ${EMAIL}
    Clear Element Text    id=phone    
    Click Button    id=submitButton
    Sleep    2s
    ${error_message}=  Get Text          id=errors
    Should Be Equal As Strings    ${error_message}    *Please enter a phone number!!
    Close Browser

Form Submission with a valid Phone Number
    [Documentation]    กรอก Phone Number ไม่ถูกแบบ
    Open Browser    ${Form}    chrome
    Input Text    id=firstname    ${FNAME}
    Input Text    id=lastname   ${LNAME}
    Input Text    id=destination    ${DESTINATIONS}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship    ${RELATIONSHIP}
    Input Text    id=email   ${EMAIL}
    Input Text    id=phone    191
    Click Button    id=submitButton
    Sleep    2s
    ${error_message}=  Get Text          id=errors
    Should Be Equal As Strings    ${error_message}    *Please enter avalid phonenumber!!, e.g., 081-234-5678, 081 2345678, or081.234.5678
    Close Browser