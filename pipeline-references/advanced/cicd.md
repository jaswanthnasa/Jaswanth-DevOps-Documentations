# CICD pipelien for Java Application contains 2 stages
## CI 
GitHUb repo https://github.com/jaswanthnasa/Jaswanth-CICD.git <br>
[CI setup](##CI-setup)


## CD 
GitHUb repo https://github.com/jaswanthnasa/jaswanthnasa_v1.git <br>
[CI setup](##CD-setup)

## CI setup
1) Jenkins intallation and login <br>

```
#!/bin/bash
sudo apt-get update
sudo apt install default-jdk -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
```

2) Install the Docker Pipeline plugin in Jenkins:

   - Log in to Jenkins.
   - Go to Manage Jenkins > Manage Plugins.
   - In the Available tab, search for "Docker Pipeline".
   - Select the plugin and click the Install button.
   - Restart Jenkins after the plugin is installed.

3)  Intall docker on ec2 instance
  
   ```
   sudo apt update
   sudo apt install docker.io
   sudo chmod 666 /var/run/docker.sock
   ```
   ```
  sudo su - 
  usermod -aG docker jenkins
  usermod -aG docker ubuntu
  systemctl restart docker
   ```

4) Intall mvn <br><br>
 manage jenkins--->tools-->maven <br>
![mvn_add](https://github.com/jaswanthnasa/Jaswanth-DevOps-Documentations/assets/92042814/d67b8c6a-7993-4056-8cd9-ecf36af574dc)

5) create docker hub credesntials  <br>
 manage jenkins--->credentials-->Add Credentials

6) create github creds <br>
 manage jenkins--->credentials-->Add Credentials



7)SonarQube installation
```
apt install unzip
adduser sonarqube
```
```
su sonarqube
cd /home/sonarqube/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
unzip *
chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424
chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424
cd sonarqube-9.4.0.54424/bin/linux-x86-64/
./sonar.sh start
```
   access sonar ------> publicip:9000 <br>
   credentials-----------> admin/admin <br>
   generate token to conenct to jenkins -----------> User > My Account > Security
    
   ![sonar-token](https://github.com/jaswanthnasa/Jaswanth-DevOps-Documentations/assets/92042814/ff1ce0fd-ff34-4f9c-aed2-38ec79b48aeb)

 #### total 3 creds to be created in jenkins  [step 5,6,7]
   ![credentials](https://github.com/jaswanthnasa/Jaswanth-DevOps-Documentations/assets/92042814/ccf165a7-07c7-49d6-ad22-004b385b6d27)

 
   






## CD setup

1)Install argocd operator using [https://operatorhub.io/operator/argocd-operator] 

```
curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.25.0/install.sh | bash -s v0.25.0
kubectl create -f https://operatorhub.io/install/argocd-operator.yaml
kubectl get csv -n operators
```

2) then create a file like argo-cd.yaml
  ```
  apiVersion: argoproj.io/v1alpha1
  kind: ArgoCD
  metadata:
    name: example-argocd
    labels:
      example: basic
  spec: {}
  ```

3) then apply it-------> kubectl apply -f argo-cd.yaml

4) edit service *example-argocd-server*  from cluster ip to nodeport ---------->Type: NodePort <br>
  kubectl edit service example-argocd-server

5) minikube service example-argocd-server

6) access the url from browser ------->  http://127.0.0.1:51858

7) kubectl edit secret example-argocd-cluster ------------------> to get the argocd secret

8) echo REJTeXNYZlVDaXBON3puMkZ3QUVjTFliSDB1ZzRLTzE= | base64 -d ---------------------> decoding to get the argocd passsword <br>

   so arcd creds -----username=admin <br>
                      passowrd=output of the above one

9) create a new app in ARCOCD  ------------> 

                      **GENERAL**
                      Application name= jaswanth
                      project name= default
                      sync policy= automatic
                      **SOURCE**
                      Repository URL= https://github.com/jaswanthnasa/Jenkins-Zero-To-Hero.git
                      path= java-maven-sonar-argocd-helm-k8s/spring-boot-app-manifests
                      **DESTINATION**
                      cluster url = https://kubernetes.default.svc
                      namespace = default 
  

<br><br><br><br><br><br>
## Jenkinsfile link -- https://github.com/jaswanthnasa/Jaswanth-DevOps-Documentations/blob/master/pipeline-references/JenkinsFile2



