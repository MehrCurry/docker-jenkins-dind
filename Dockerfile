FROM anapsix/alpine-java:8

RUN mkdir -p /opt/jenkins
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://updates.jenkins-ci.org

WORKDIR /opt/jenkins

ADD jenkins.war jenkins.war

EXPOSE 8080

CMD [ "java", "-jar", "jenkins.war" ]
