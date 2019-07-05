*** Variable ***
${BACKEND_UTILITY_Site_Name}     backend.testtool.com   # REMOVE FOR　CRETENTIAL
# Kafka Broker Host, support broker list, use "," as separator
${Kafka.Host}     broker4-stg.tmok.tm:80,broker5-stg.tmok.tm:80,broker6-stg.tmok.tm:80
# Zookeeper Host
${Zookeeper.Host}    zookeeper-stg.tmok.tm:80
# Key for AES decrypt
${key}    ***************  # REMOVE FOR　CRETENTIAL
# DynamoDB region
${Dynamodb.Region}    us-west-2

${SQOOP_INTERVAL}    7 minutes