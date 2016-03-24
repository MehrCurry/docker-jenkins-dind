FROM anapsix/alpine-java:8

RUN apk upgrade --update && apk add docker

RUN mkdir -p /opt/jenkins
ENV JENKINS_HOME /var/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p /opt/plugins
ADD $JENKINS_MIRROR/war-rc/2.0/jenkins.war /opt/jenkins/jenkins.war

VOLUME $JENKINS_HOME

EXPOSE 8080 50000

CMD [ "java", "-jar", "/opt/jenkins/jenkins.war" ]
