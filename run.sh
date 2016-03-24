#!/bin/sh

docker run -d -e CSP_OPTS="default-src 'none'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; child-src 'self'; frame-src 'self'; script-src 'self' 'unsafe-inline';" --name jenkins --volumes-from jenkins_data -v /var/run/docker.sock:/var/run/docker.sock -p 18080:8080 -p 50000:50000 --restart=always gzockoll/jenkins2
