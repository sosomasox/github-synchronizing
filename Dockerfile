FROM ubuntu:18.04

ENV GITHUB_ACCOUNT=""
ENV GITHUB_REPOSITORY_NAME=""
ENV DIRECTORY_NAME=""

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y git 

ADD scripts/entrypoint.sh /usr/bin/

WORKDIR /srv

CMD ["/usr/bin/entrypoint.sh"]
