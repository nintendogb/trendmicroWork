*** Keywords ***
Set_Kafka_Commit_ToLatest
    [Arguments]    ${Topic.Consume}
    ${ConsumeResult}=    Kafka.event_commit_to_latest    ${Kafka.Host}    ${Zookeeper.Host}    ${Topic.Consume}
    Log    Consume result: ${ConsumeResult}
    Should Be Equal As Strings    ${ConsumeResult}    ConsumeDone

Set_Kafka_Commit_ToEarliest
    [Arguments]    ${Topic.Consume}
    ${ConsumeResult}=    Kafka.event_commit_to_earliest    ${Kafka.Host}    ${Zookeeper.Host}    ${Topic.Consume}
    Log    Consume result: ${ConsumeResult}
    Should Be Equal As Strings    ${ConsumeResult}    ConsumeDone

Kafka_Consumer_All_New_Event
    # timeout 20: get 9044
    # timeout 10: get 3617
    [Arguments]    ${Topic.Consume}
    ${result}=    Kafka.event_consume_to_latest    ${Kafka.Host}    ${Zookeeper.Host}    ${Topic.Consume}    10
    [Return]    ${result}

Get Kafka event with resource_id
    [Arguments]    ${ConsumeResult}    ${resource_id}
    Log    ${resource_id}
    ${Log_Count}=    Get length    ${ConsumeResult}
    @{data list}    Create List
    Log     ${Log_Count}
    :FOR    ${index}    IN RANGE    1    ${Log_Count}
    \    ${json}    Parse Json    ${ConsumeResult[${index}]}
    \    Log    ${resource_id}
    \    Log    ${json['event_id']}
    \    Run keyword if    ${json['resource_id']} == ${resource_id}    Append To List    ${data list}    ${json}   
    Log    Consume result: @{ConsumeResult}[0]
    ${correct data}    Get Length    ${data list}
    Log     ${data list}
    Should Be True    ${correct data} > 0
    [Return]    ${data list}

Compare Kafka Decrypt with DynamoDB
    [Arguments]    ${Decrypt}    ${Dynamodb}
    ${total}    Get length    ${Dynamodb[0]}
    ${count}    Set Variable    0
    Log    ${dynamoDB_CA[0]}
    Log    ${Decrypt}
    :FOR    ${KEY}    IN    @{Dynamodb[0]}
    \    Log    ${KEY}
    \    Log    ${dynamoDB_CA[0]["${KEY}"]}
    \    ${total}    Set Variable If    '${dynamoDB_CA[0]["${KEY}"]}' == 'None'    ${total} - 1    ${total}
    \    Continue For Loop If    '${dynamoDB_CA[0]["${KEY}"]}' == 'None'
    \    ${not_exist}    Evaluate    "${KEY}" not in ${Decrypt}
    \    Log    ${not_exist}
    \    Exit For Loop If    ${not_exist}
    \    Exit For Loop If    '${dynamoDB_CA[0]["${KEY}"]}' != '${Decrypt["${KEY}"]}'
    \    ${count}    Evaluate    ${count} + 1
    \    Log     ${count}

    ${rc}    Set Variable If
    ...    ${count} == ${total}    1
    ...    ${count} != ${total}    0

    [Return]    ${rc}
    
