## To demonstrate how networking works inside docker containers 
#### Run 3 docker containers login,logout,finace.in which login&logout used out of the box(defaut) Bridge network , where as finance container used custom bridge network [secure-network]

```
1) front end --backend communication ---->n/w sahred
2) payment container ----required isolation 

bridge network is a default networking in docker




1)host ---------container ip and host ip same [eth0--etch0]
2)bridge-------container ip and host ip diff [ethc0--veth0[dokcer0]---eth0]
3)overlay--------used in Contianer orcherstation
```

![Capture](https://github.com/user-attachments/assets/d308312e-bc80-48f6-8dc3-19207a5deebf)
1) login
```   
docker run -d --name login nginx
```

2) logout
```
docker run -d --name logout nginx
```

3) finance
```
docker network create secure-network
docker run -d --name finace --network=secure-network nginx
```
```
docker inspect login
172.17.0.2
```
```
docker inspect logout
172.17.0.3
```
```
docker inspect finance
172.18.0.2
```

## ping from login container  to logout container
1. exec into login container
```
docker exec -it login /bin/bash
```


2. installing ping in login container
```
apt-get update -y
apt-get install -y iputils-ping
```

3. ping 172.17.0.3

## ping from login container  to finance container
ping 172.18.0.2  # this will fail to connect as finace container connects host though different/custom bridge network
