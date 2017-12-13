FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Sergei Safrigin<sergei.safrigin@personali.com>

RUN mkdir /var/dynamodb_local && \
    mkdir /var/dynamodb_data

WORKDIR /var/dynamodb_local

RUN wget -O dynamodb_local_latest.tar.gz http://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar zxvf dynamodb_local_latest.tar.gz && \
    rm dynamodb_local_latest.tar.gz

ENTRYPOINT ["/usr/bin/java", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_data", "-sharedDb", "-port", "8000"]

EXPOSE 8000