*** Settings ***
Force Tags    beta
Resource    ../Config/ImportLibrary.robot

*** Variable ***
${Email}    ****@yahoo.com
${pw_cipher}    4
${UserID}    ****@trendmicro.com
${SN}    ****-9999-9999-9999-0003
${PID}    ****
${ProductID}    ****
${GUID}    ****
${account_id}
${ph_id}


*** Keywords ***
Check ****1 table
    [Arguments]    ${data}
    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    Run Keyword If    ${data["****"][****]["****"]} == 0    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    ...    ELSE    Should Be Equal    ${data["****"][****]["****"]}    ${****}
Check ****2 table
    [Arguments]    ${data}
    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    Run Keyword If    ${data["****"][****]["****"]} == 0    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    ...    ELSE    Should Be Equal    ${data["****"][****]["****"]}    ${****}

Check ****3 table
    [Arguments]    ${data}
    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    Run Keyword If    ${data["****"][****]["****"]} == 0    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    ...    ELSE    Should Be Equal    ${data["****"][****]["****"]}    ${****}}

Check ****4 table
    [Arguments]    ${data}
    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    Run Keyword If    ${data["****"][****]["****"]} == 0    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    ...    ELSE    Should Be Equal    ${data["****"][****]["****"]}    ${****}

Check ****5 table
    [Arguments]    ${data}
    Should Be Equal As Integers    ${data["Table4"][0]["product_id"]}    ${ProductID}
    Set Suite Variable    ${ph_id}   ${data["****"][****]["****"]}

Check ****6 table
    [Arguments]    ${data}
    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    Run Keyword If    ${data["****"][****]["****"]} == 0    Should Be Equal    ${data["****"][****]["****"]}    ${****}
    ...    ELSE    Should Be Equal    ${data["****"][****]["****"]}    ${****}

*** Test Cases ***
Test Warpdrive Backend Utillity
    [Tags]    beta
    ${res}    Get_All_CCW_User_Purchase_History_by_SN_GUID    ****-0018-0844-9031-0143    ****
    Log    ${res["****"][****]}

Test Update ConsumerAccount password cipher by Email
    [Tags]    beta
    Log    ${Email}
    Update_ConsumerAccount_Cipher_By_Email    ${Email}    ${pw_cipher}
    ${res}    Get_ConsumerAccount_by_Email    ${Email}
    ${pwc_db}    Set Variable    
    Log    ${pwc_db}
    Should Be Equal As Integers    ${res["****"][****]["****"]}    ${pw_cipher}

Test License Activate
    Insert_Account_Related_Data    ${UserID}    ${SN}    ${PID}    ${ProductID}    ${GUID}
    ${res}    Get_Account_Related_Data    ${UserID}
   
    Check ****1 table    ${res}
    Check ****2 table    ${res}
    Check ****3 table    ${res}
    Check ****4 table    ${res}
    Check ****5 table    ${res}
    Check ****6 table    ${res}


    Del_Account_Related_Data    ${UserID}