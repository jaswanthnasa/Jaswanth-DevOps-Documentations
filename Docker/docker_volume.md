Volumes aims to solve the same problem by providing a way to store data on the host file system, separate from the container's file system, so that the data can persist even if the container is deleted and recreated.

1. docker volume create jas-vol

2. docker volume ls

3. docker run -it -d --name demo-volume-container -v jas-vol:/app nginx /bin/bash

```
docker exec -it demo-volume-container /bin/bash
cd app
touch a b
```
## how to check content in side docker volume 
 Docker volumes are designed to be managed by Docker and are not directly accessible from the host filesystem. 

```
docker run -d --name temp_container -v jas-vol:/app alpine sleep 3600

docker cp temp_container:/app .

docker rm -f temp_container
```

### check in host machine/laptop
```
cd app

ls -lrt
```
