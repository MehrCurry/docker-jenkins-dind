#!/bin/bash

mkdir -p $JENKINS_HOME/plugins
if [ ! $(ls -A $JENKINS_HOME/plugins)]; then
	cp /opt/plugins/* $JENKINS_HOME/plugins
fi
java -javaagent:/opt/jolokia-agent.jar=host=0.0.0.0 -jar /opt/jenkins/jenkins.war