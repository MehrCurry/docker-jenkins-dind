Running
=======

```bash
docker run -d --name jenkins --volumes-from jenkins_data --privileged -v /var/lib/docker:/var/lib/docker -p 18080:8080 -p 18778:8778 gzockoll/jenkins
```