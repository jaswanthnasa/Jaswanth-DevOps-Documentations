## Ultimate CI/CD Pipeline for Spring Boot on Kubernetes with Argo CD **[By Abhishek Veeramalla ]**

Project Description:

This project focuses on creating an efficient CI/CD pipeline for a Spring Boot application, enabling deployment on Kubernetes using Argo CD.

Pipeline flow:

1. When an event (commit) will occur in the application code GitHub repo, the GitHub webhook will push the code to Jenkins and Jenkins will start the build.

2. Maven will build the code, if the build fails, the whole pipeline will become a failure and Jenkins will notify the user, If build success then will go to the next step otherwise the whole pipeline fails.

3. SonarQube scanner will scan the code and will send the report to the SonarQube server, where the report will go through the quality gate and gives the output to the web Dashboard.

4. After this Docker will build the docker image. if the docker build fails when the whole pipeline will become a failure and Jenkins will notify the user that your build fails.

5. Docker images will be pushed to the docker hub, if the docker fails to push docker images to the docker hub then the pipeline will become a failure and Jenkins will notify the user that your build fails.

6. After the docker push, Jenkins will update the Kubernetes deployment manifest file to the repository.

7. ArgoCD will pull the changes and deploy the application into Kubernetes.

## Reference

> Git repo : [Repo](https://github.com/jaswanthnasa/Jenkins-Zero-To-Hero/tree/main/java-maven-sonar-argocd-helm-k8s/spring-boot-app) <br>
> Reference video: [Pipeline](https://www.youtube.com/watch?v=JGQI5pkK82w&list=PL0mwG7J1IRFBDNX1FzLffWsaCemXo13-w&index=13&t=4124s)
