For no need to install robot framework requirements everytime for a new test machine.
This project builds robot framework WD automation test in docker.

About run robot framework in Docker
    1. Docker will run all robot script in Project directory after build.
        > docker build -t {DOCKER_TAG} .
    2. Log will be save in Logs directory in Docker, you can export Logs by add -v at docker run command.
        > docker run -v {OUTPUT_FOLDER}:/Logs {DOCKER_TAG}
    3. If need to modify DynamoDB credential, please edit init.sh


    Run with specific robot script
        > docker run -v {OUTPUT_FOLDER}:/Logs {DOCKER_TAG} {robot script location in Docker}
    Run with specific robot script with tag beta
        > docker run -v {OUTPUT_FOLDER}:/Logs {DOCKER_TAG} -i beta {robot script location in Docker}

    How to load difference phase config.
        Default this tool will load beta environment config at  './Config/configBeta.robot' you can using  '-v Phase:{your phase}' to change phase setting.
        Command is like below:
            Using Beta config setting(config location: ./Config/configBeta.robot)
                > docker run -v {OUTPUT_FOLDER}/Logs:/Logs {DOCKER_TAG} -v Phase:Beta {robot script location in Docker}
            or
                > docker run -v {OUTPUT_FOLDER}/Logs:/Logs {DOCKER_TAG}

            Using Production config setting(config location: ./Config/configProd.robot)
                > docker run -v {OUTPUT_FOLDER}/Logs:/Logs {DOCKER_TAG} -v Phase:Prod {robot script location in Docker}


    Test template
        - 01_DynamoDBTest.robot: For manipulate dynamoDB.
        - 02_WDBackendBeta.robot: For add data to SQL DB by using backend utility.
        - 03_CheckSRAndDynamoDB.robot: See if source DB has same data with dynamoDB. 
        - 04_KafkaListener.robot: For manipulate kafka event.
        - 05_DynamoDBPushKafka.robot: See if dynamoDB's updates are push by kafka.
        - 06_E2ETesttemplate.robot: End to end automation test.(SQL -> dynamoDB -> kafka).




BELOW PART IS DIRECTION FOR USING ROBOT FRAMEWORK DIRECTLY(WITHOUT DOCKER)
    Requirement of robotframework automation tool
        * Python 2.7
            Mac default has 2.7.10

        * pip
            sudo easy_install pip

        * robotframework
            sudo pip install robotframework

        * RobotFramework HTTP library
            Sudo pip install robotframework-httplibrary

        * Robotframework-selenium2library
            sodo pip install robotframework-selenium2library

        * pycrypto
            sudo pip install pycrypto

        * DynamoDB
            sudo pip install robotframework-dynamodbsqllibrary

        * pykafka
            sudo pip install pykafka

        * pybase64
            sudo pip install pybase64

        * pycharm
            https://www.jetbrains.com/pycharm/

    Environment Setting for DynamoDB
        1. Install dynamodbsqllibrary 
        https://libraries.io/pypi/robotframework-dynamodbsqllibrary

        2. Create a config file in path 
	    $vim ~/.aws/config

	    ~	
	    [default]
	    region = us-west-2
	    ~

        3. Create Credential file in path
	    $vim ~/.aws/credentials

	    ~
	    [default]
	    aws_access_key_id = {{AWS_ACCESS_KEY}}
	    aws_secret_access_key = {{AWS+SECRET_KEY}}






    About robot framework command
        Run with specific robot script
            > robot {robot script location}
        Run with specific robot script with tag beta
            > robot -i beta {robot script location}

    How to load difference phase config.
        Default this tool will load beta environment config at  './Config/configBeta.robot' you can using  '-v Phase:{your phase}' to change phase setting.
        Command is like below:
            Using Beta config setting(config location: ./Config/configBeta.robot)
                > robot -v Phase:Beta {robot script location in Docker}
            or
                > robot {robot script location in Docker}

    Using Production config setting(config location: ./Config/configProd.robot)
        > robot -v Phase:Prod {robot script location in Docker}

    Using specific python version to run robot framework(Make sure you had install that version of python)
        python2
            > python2 -m robot.run ./Project/WDBackendBeta.robot
        python3
            > python3 -m robot.run ./Project/WDBackendBeta.robot
