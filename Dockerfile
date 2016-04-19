FROM anapsix/alpine-java:8

RUN apk upgrade --update && apk add curl

ENV JENKINS_HOME /opt/jenkins
ENV JENKINS_MIRROR http://updates.jenkins-ci.org

WORKDIR $JENKINS_HOME

RUN mkdir -p $JENKINS_HOME

ADD jenkins.war jenkins.war

RUN mkdir -p $JENKINS_HOME/plugins; for plugin in chucknorris greenballs scm-api git-client git;\
    do echo ${plugin} && curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/latest/${plugin}.hpi ; done

WORKDIR $JENKINS_HOME

EXPOSE 8080

CMD [ "java", "-jar", "jenkins.war" ]
