FROM java:8

RUN mkdir -p /opt/jenkins
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

WORKDIR /opt/jenkins

ADD $JENKINS_MIRROR/war/latest/jenkins.war jenkins.war

EXPOSE 8080

CMD [ "java", "-jar", "jenkins.war" ]
