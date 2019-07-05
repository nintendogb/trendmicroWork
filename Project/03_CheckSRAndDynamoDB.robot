*** Settings ***
Force Tags    beta
Resource    ../Config/ImportLibrary.robot

*** Variable ***
${Topic}    ****.****.****
#Variable to create data in SourceDB
${UserID}    *****@trendmicro.com
#${UserID}    carl@shaflik.com
${SN}    ****-0014-0576-6658-7003
${PID}    ****
${ProductID}    ****
${GUID}    ****



*** Keywords ***
Check ****1 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check ****2 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check ****3 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID} 

Check ****4 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}
    Run Keyword If    ${data_from_srdb["****"][****]["****"]} == 0    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${account_id}
    ...    ELSE    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${account_id}

Check ****5 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID} 

Check ****6 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID} 

Check ****7 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID} 

*** Test Cases ***
Check sourceDB
    ${res}    Get_Account_Related_Data    ${UserID}
    Set Suite Variable    ${data_from_srdb}    ${res}
    Set Suite Variable    ${account_id}   ${data_from_srdb["****"][****]["****"]}
    Set Suite Variable    ${ca_id}   ${data_from_srdb["****"][****]["****"]}
    Set Suite Variable    ${ph_id}   ${data_from_srdb["****"][****]["****"]}
    Set Suite Variable    ${serial}    ${data_from_srdb["****"][****]["****"]}
    Log    ${data_from_srdb}
   
    Check ****1 table
    Check ****2 table
    Check ****3 table
    Check ****4 table
    Check ****5 table



Check DynamoDB data
    ${res}    Get DynamoDB CA    ${account_id}    ${data_from_srdb["****"][****]["****"]}
    Set Suite Variable    ${dynamoDB_CA}    ${res}
    Log    ${dynamoDB_CA[0]}

    Check ****6 table

