*** Settings ***
Force Tags    beta
Resource    ../Config/ImportLibrary.robot

*** Variable ***
${Topic}    ****.****.****
#Variable to create data in SourceDB
${UserID}    ****@trendmicro.com
${SN}    ****-9999-9999-9999-0003
${PID}    ****
${ProductID}    ****
${GUID}    ****
#####################################
*** Keywords ***
Check ****1 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check ****2 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check ****3 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check ****4 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check ****5 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}


Check ****6 table
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

Check DynamoDB ****
    Should Be Equal    ${data_from_srdb["****"][****]["****"]}    ${UserID}

*** Test Cases ***
Kafka_Read_From_Latest
    Set_Kafka_Commit_ToLatest    ${Topic}

Clear Source DB
    Del_Account_Related_Data    ${UserID}
    
Input and check sourceDB
    Insert_Account_Related_Data    ${UserID}    ${SN}    ${PID}    ${ProductID}    ${GUID}
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
    Check ****6 table

Wait for WarpDrive processing data  
    Sleep    ${SQOOP_INTERVAL}    Wait sqoop pulling data

Check DynamoDB data
    ${res}    Get DynamoDB CA    ${account_id}    ${data_from_srdb["Table3"][0]["ProfileSourceDB"]}
    Set Suite Variable    ${dynamoDB_CA}    ${res}
    Log    ${dynamoDB_CA[0]}

    Check DynamoDB ****

Check Kafka data with DynamoDB
    ${resource_id}    Set Variable    ${account_id},${data_from_srdb["Table3"][0]["ProfileSourceDB"]}
    ${ConsumeResult}    Kafka_Consumer_All_New_Event   ${Topic}
    ${data list}    Get Kafka event with resource_id    ${ConsumeResult}    ${resource_id}

    ${correct data}    Get Length    ${data list}
    :FOR    ${correct_count}    IN RANGE    0    ${correct data}
    \    Continue For Loop If    '${data list[${correct_count}]['event_type']}' == 'REMOVE'
    \    ${decrypted}    AES_Decrypt    ${key}    ${data list[${correct_count}]['iv']}    ${data list[${correct_count}]['payload']}
    \    ${deJson}    Parse Json   ${decrypted} 
    \    ${rc}    Compare Kafka Decrypt with DynamoDB    ${deJson}    ${dynamoDB_CA}
    \    Run Keyword If    ${rc} == 1    Exit For Loop  
    Log    ${rc}
    Should Be True    ${rc} > 0




Clear DynamoDB data
    Execute SQL On DaynamoDB     DELETE FROM beta.warpdrive.consumer_accounts WHERE src_account_id = ${account_id}
    #Execute SQL On DaynamoDB     DELETE FROM beta.warpdrive.serial_licenses WHERE serial = 70569
    #Execute SQL On DaynamoDB     DELETE FROM beta.warpdrive.serial_seats WHERE seat_id = 1111
