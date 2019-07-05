*** Keywords ***
Init Dynamodb Session
    ${LABEL}    Create DynamoDB Session     ${Dynamodb.Region}
    [Return]    ${LABEL}

Execute SQL On DaynamoDB
    [Arguments]    ${SQL}
    ${label}   Init Dynamodb Session

    ${var}    Query Dynamodb     ${label}     ${SQL}
    ${DeleteSession_return}   Delete All Dynamodb Sessions
    [Return]    ${var}

Get DynamoDB CA
    [Arguments]    ${ACID}    ${SRC_DB}
    Log    ${ACID}
    Log    ${SRC_DB}
    @{res}    Execute SQL On DaynamoDB     SELECT * FROM ****.****.**** WHERE **** = ${ACID} and **** = ${SRC_DB}
    [Return]    ${res}

Get DynamoDB SL
    [Arguments]    ${SN}
    @{res}    Execute SQL On DaynamoDB     SELECT * FROM ****.****.**** WHERE **** = ${SN}
    [Return]    ${res}

Get Date
    [Arguments]    ${date}
    ${res}    Get Substring    ${date}    0    10
    [Return]    ${res}