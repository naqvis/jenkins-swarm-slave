FROM openjdk:8-jdk-alpine

LABEL maintainer="Ali Naqvi - syed.alinaqvi@gmail.com"

ENV JENKINS_SWARM_VERSION 3.9
ENV HOME /home/jenkins-slave

# install bash and curl
RUN apk add --no-cache bash curl

RUN  adduser -h $HOME -D jenkins-slave
RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client-$JENKINS_SWARM_VERSION.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION.jar \
  && chmod 755 /usr/share/jenkins

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

USER jenkins-slave
VOLUME /home/jenkins-slave

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
