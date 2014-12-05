Running
=======

```bash
docker run -d --name jenkins --volumes-from jenkins_data --privileged -v /var/run/docker.sock:/var/run/docker.sock -p 18080:8080 -p 18778:8778 --restart=always gzockoll/jenkins
```