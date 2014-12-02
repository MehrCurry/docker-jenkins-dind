FROM dockerfile/java:oracle-java8

RUN apt-get update -qq && apt-get install -qqy curl
RUN curl https://get.docker.io/gpg | apt-key add -
RUN echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy iptables ca-certificates lxc git-core lxc-docker

RUN mkdir -p /opt/jenkins
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p /opt/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup parameterized-triggery jquery dashboard-view build-pipeline-plugin config-file-provider parameterized-trigger docker-build-step ;\
    do curl -sf -o /opt/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

RUN curl -o /opt/jolokia-agent.jar http://labs.consol.de/maven/repository/org/jolokia/jolokia-jvm/1.2.3/jolokia-jvm-1.2.3-agent.jar

ADD start.sh /opt/start.sh

EXPOSE 8080 8778

CMD [ "/opt/start.sh" ]
