*** Settings ***
Force Tags    beta
Resource    ../Config/ImportLibrary.robot
*** Variable ***
${Topic}    ****.****.****
${src_ac_id}    179577
${countryIDA}    987
${countryIDB}    789
${resource_id}    179577,1
${dynamoDB_CA}
*** Test Cases ***
Set_Kafka_Commit_to_Latest
    Set_Kafka_Commit_ToLatest    ${Topic}

Modify Dynamodb 
    Execute SQL On DaynamoDB     UPDATE ****.****.**** SET **** = ${countryIDA} WHERE **** = ${src_ac_id} and **** = 1

Query Dynamodb Data1
    @{var}    Execute SQL On DaynamoDB     SELECT * FROM ****.****.**** WHERE **** = ${src_ac_id} and **** = 1
    :FOR    ${ELEMENT}    IN    @{var}
    \    Log    ${ELEMENT}
    \    Log    ${ELEMENT['country_id']}

Modify Dynamodb2
    Execute SQL On DaynamoDB    UPDATE ****.****.**** SET **** = ${countryIDB} WHERE **** = ${src_ac_id} and **** = 1

Query Dynamodb Data2
    ${res}    Get DynamoDB CA    ${src_ac_id}    1
    Set Suite Variable    ${dynamoDB_CA}    ${res}

Check Kafka data with DynamoDB
    @{data list}    Create List
    ${ConsumeResult}    Kafka_Consumer_All_New_Event   ${Topic}
    ${data list}    Get Kafka event with resource_id    ${ConsumeResult}    ${resource_id}
    ${correct data}    Get Length    ${data list}

    :FOR    ${correct_count}    IN RANGE    0    ${correct data}
    \    ${decrypted}    AES_Decrypt    ${key}    ${data list[${correct_count}]['iv']}    ${data list[${correct_count}]['payload']}
    \    ${deJson}    Parse Json   ${decrypted} 
    \    ${rc}    Compare Kafka Decrypt with DynamoDB    ${deJson}    ${dynamoDB_CA}
    \    Run Keyword If    ${rc} == 1    Exit For Loop  
    Log    ${rc}
    Should Be True    ${rc} > 0