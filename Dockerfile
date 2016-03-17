FROM anapsix/alpine-java:8

RUN apk upgrade --update && apk add curl docker

RUN mkdir -p /opt/jenkins
ENV JENKINS_HOME /var/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p /opt/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup parameterized-triggery jquery dashboard-view build-pipeline-plugin cloudbees-folder config-file-provider parameterized-trigger docker-commons docker-build-step swarm;\
    do curl -sf -o /opt/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

RUN curl -o /opt/jolokia-agent.jar https://repo1.maven.org/maven2/org/jolokia/jolokia-jvm/1.3.1/jolokia-jvm-1.3.1-agent.jar

VOLUME $JENKINS_HOME

ADD start.sh /opt/start.sh

EXPOSE 8080 8778

CMD [ "/opt/start.sh" ]
