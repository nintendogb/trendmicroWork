*** Settings ***
Resource    ../Config/ImportLibrary.robot
Force Tags    beta
*** Variable ***
${data}
*** Test Cases ***
To Create Dynamodb Session
    @{var}    Execute SQL On DaynamoDB     SELECT * FROM ****.****.**** WHERE **** = 70569
    ${data}    Copy List    ${var} 

    Log     ${data[0]['locale_id']}
    ${count}=    Get length    ${data}
    Log    ${count}
    :FOR    ${index}    IN RANGE    0    ${count}
    \    Log    ${data}[index]



