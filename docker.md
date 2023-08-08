# Docker installation on Ubuntu
```
sudo curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
```

docker images======> to get the list of images <br>
docker ps =========> to get the list of running containers <br>
docker ps -a ======> to get the list of all  containers [both running and stopped] 
	
