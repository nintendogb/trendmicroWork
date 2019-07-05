FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python-pip python-dev gcc phantomjs firefox  && \
    pip install robotframework && \
    pip install robotframework-sshlibrary && \
    pip install robotframework-selenium2library && \
    pip install robotframework-httplibrary && \
    pip install pycrypto && \
    pip install robotframework-dynamodbsqllibrary && \
    pip install pykafka && \
    pip install pybase64

ADD . /
WORKDIR /Logs
RUN chmod +x /init.sh
RUN /init.sh

ENTRYPOINT ["python", "-m", "robot.run"]
CMD ["../Project/*"]
