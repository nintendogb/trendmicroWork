*** Variable ***
${Phase}    Beta
*** Settings ***
Library    Collections
Library    DateTime
Library    HttpLibrary.HTTP
Library    String
Library    DynamoDBSQLLibrary
Library    Process
Library    ../Lib/Lib_Kafka.py    WITH NAME    Kafka
Library    ../Lib/Lib_AESDecrypt.py    WITH NAME    AES
Resource    ../Config/config${Phase}.robot
Resource    ../Keyword/AESDecrypt.robot
Resource    ../Keyword/BackendUtilityWarpdrive.robot
Resource    ../Keyword/KafkaEvent.robot
Resource    ../Keyword/DynamoDB.robot