FROM java:8

RUN mkdir -p /opt/jenkins
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

WORKDIR /opt/jenkins

ADD $JENKINS_MIRROR/war/latest/jenkins.war jenkins.war

RUN mkdir -p $JENKINS_HOME/plugins
RUN for plugin in chucknorris greenballs scm-api git-client git ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done
	   
EXPOSE 8080

CMD [ "java", "-jar", "jenkins.war" ]
