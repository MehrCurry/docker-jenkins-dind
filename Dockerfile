FROM anapsix/alpine-java:8

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libseccomp && \
    apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community docker curl

ENV JENKINS_HOME /opt/jenkins
ENV JENKINS_MIRROR http://updates.jenkins-ci.org

WORKDIR $JENKINS_HOME

RUN mkdir -p $JENKINS_HOME

RUN mkdir -p $JENKINS_HOME/plugins; for plugin in chucknorris greenballs scm-api git-client git;\
    do echo ${plugin} && curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/latest/${plugin}.hpi ; done

ADD jenkins.war jenkins.war


EXPOSE 8080

CMD [ "java", "-jar", "jenkins.war" ]
