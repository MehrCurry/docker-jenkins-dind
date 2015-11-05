FROM java:8

ENV JENKINS_HOME /opt/jenkins
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org
RUN mkdir -p $JENKINS_HOME

RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war/latest/jenkins.war

RUN mkdir -p $JENKINS_HOME/plugins; for plugin in chucknorris greenballs scm-api git-client git;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

VOLUME $JENKINS_HOME/data

WORKDIR $JENKINS_HOME

EXPOSE 8080

CMD [ "java", "-jar", "jenkins.war" ]
