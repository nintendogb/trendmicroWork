*** Keywords ***
Get_All_CCW_User_Purchase_History_by_SN_GUID
    [Arguments]    ${SN}   ${GUID}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body
    ${ResponseBody}    Get Response Body
    ${json_result}    Parse Json    ${ResponseBody}

    [Return]    ${json_result}

Get_ConsumerAccount_by_Email
    [Arguments]    ${Email}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body
    ${ResponseBody}    Get Response Body
    ${json_result}    Parse Json    ${ResponseBody}

    [Return]    ${json_result}


Update_ConsumerAccount_Cipher_By_Email
    [Arguments]    ${Email}    ${pw_cipher}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body
    ${ResponseBody}    Get Response Body
    ${json_result}    Parse Json    ${ResponseBody}
    ${Response}    Get From Dictionary    ${json_result}    Response
    ${ResponseList}    Get From List    ${Response}    0

Insert_Account_Related_Data
    [Arguments]    ${Email}    ${SN}    ${PID}    ${ProductID}    ${GUID}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body

Get_Account_Related_Data
    [Arguments]    ${Email}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body
    ${ResponseBody}    Get Response Body
    ${json_result}    Parse Json    ${ResponseBody}

    [Return]    ${json_result}

Del_Account_Related_Data
    [Arguments]    ${Email}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET   ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body

Modyfy_profile_FNmae_LName_By_Email
    [Arguments]    ${Email}    ${fname}    ${lname}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body

Turn_CA_isValid_ByEmail
    [Arguments]    ${Email}
    Create Http Context    ${BACKEND_UTILITY_Site_Name}    http
    HttpLibrary.HTTP.GET    ************************************************************************
    Response Status Code Should Equal    200
    Log Response Headers
    Log Response Body