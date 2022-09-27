FROM ubuntu:14.04

ENV DIST=/home/dist
ENV SVN_REPOSITORY=https://svn.code.sf.net/p/smartmontools/code/trunk/smartmontools
ENV GIT_REPOSITORY=https://github.com/smartmontools/smartmontools
ENV GIT_BRANCH=master

WORKDIR /home

RUN pwd && ls -ll \
	&& apt update \
	&& apt install build-essential -y \
#	&& apt install subversion -y \
#	&& apt install git -y
	&& apt install automake1.10  -y

COPY build-svn-smartmoontools.sh .
COPY build-git-smartmoontools.sh .

CMD tail -f /dev/null