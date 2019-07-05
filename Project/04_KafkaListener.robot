*** Settings ***
Force Tags    beta
Resource    ../Config/ImportLibrary.robot
*** Variable ***
${Topic}    ****.****.****

*** Test Cases ***
Kafka_Read_From_First
    Set_Kafka_Commit_ToEarliest    ${Topic}
    ${ConsumeResult}    Kafka_Consumer_All_New_Event   ${Topic}
    ${Log_Count}=    Get length    ${ConsumeResult}
    Log     ${Log_Count}
    :FOR    ${index}    IN RANGE    1    ${Log_Count}
    \    ${json}    Parse Json    ${ConsumeResult[${index}]}
    \    Log    ${json['event_id']}
    Log    Consume result: @{ConsumeResult}[0]

Kafka_Read
    ${ConsumeResult}    Kafka_Consumer_All_New_Event   ${Topic}
    ${Log_Count}=    Get length    ${ConsumeResult}
    Log     ${Log_Count}
    :FOR    ${index}    IN RANGE    1    ${Log_Count}
    \    ${json}    Parse Json    ${ConsumeResult[${index}]}
    \    Log    ${json['event_id']}
    Log    Consume result: @{ConsumeResult}[0]