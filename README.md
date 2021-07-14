# Jenkins docker

## About
Spawns a local Jenkins instance that can be used to test Jenkins pipelines with Dockerfiles

## Usage
1. Only first time
```shell
sh setup.sh
```

2. Each time
```shell
sh run.sh /path/to/my/project
``` 

## Detailed info
1. The `/path/to/my/project` parameter creates a bind mount from the host project path to the `/src` directory in the guest
Jenkins container. This is to make accessible the project code locally rather than have to push-and-pull it from a
remote repo.
   
2. The Jenkins instance already comes with the required plugins. Do not install any further plugins 

3. (Recommendation) create a Jenkins user and do not use the default admin user

## More details on
https://www.jenkins.io/doc/book/installing/docker/