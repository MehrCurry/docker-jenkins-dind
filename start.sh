#!/bin/bash

# For JavaDoc and mvn site: System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "default-src 'none'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; child-src 'self'; frame-src 'self'; script-src 'self' 'unsafe-inline';")
mkdir -p $JENKINS_HOME/plugins
if [ ! $(ls -A $JENKINS_HOME/plugins) ]; then
	cp /opt/plugins/* $JENKINS_HOME/plugins
fi
java -Dhudson.model.DirectoryBrowserSupport.CSP="$CSP_OPTS" -jar /opt/jenkins/jenkins.war
