*** Keywords ***
AES_Decrypt
    [Arguments]    ${KEY}    ${IV}    ${data}
    ${newIV}    Replace String    ${IV}    \u003d    =
    ${newData}    Replace String    ${data}    \u003d    =
    Log    ${newIV}
    Log    ${newData}
    ${res}    AES.decrypt    ${KEY}    ${IV}    ${newData}
    [Return]    ${res}