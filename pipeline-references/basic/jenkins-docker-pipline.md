# Pipeline to deploy as a Docker container
```
pipeline {
    agent any
    
    tools {
        jdk 'jdk11'
        maven 'maven3'
    }
    
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/jaiswaladi246/Shopping-Cart.git'
            }
        }
        
        stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }
        
        stage('Sonarqube Analysis') {
            steps {
                sh '''
                    $SCANNER_HOME/bin/sonar-scanner \
                    -Dsonar.url=http://13.233.102.184:9000/ \
                    -Dsonar.login=squ_815b4e28b618be7ab62693da256718391e4046d3 \
                    -Dsonar.projectName=Shopping-Cart \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Shopping-Cart
                '''
            }
        }
        
        stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }
        
        stage('OWASP Dependency Check') {
            steps {
                dependencyCheck additionalArguments: '--scan target/', odcInstallation: 'owasp'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'c9b058e5-bfe6-41f8-9b5d-dc0b0d2955ac', toolName: 'docker') {
                        sh "docker build -t shopping-cart -f docker/Dockerfile ."
                        sh "docker tag shopping-cart adijaiswal/shopping-cart:latest"
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'c9b058e5-bfe6-41f8-9b5d-dc0b0d2955ac', toolName: 'docker') {
                        sh "docker push adijaiswal/shopping-cart:latest"
                    }
                }
            }
        }
        
        stage('Deploy To Docker Container') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'c9b058e5-bfe6-41f8-9b5d-dc0b0d2955ac', toolName: 'docker') {
                        sh "docker run -d --name shopping -p 8070:8070 adijaiswal/shopping-cart:latest"
                    }
                }
            }
        }
    }
}
```

# Reference Video

Reference: [jenkins-pipeline](https://www.youtube.com/watch?v=WvcHQtyPcTs&list=PL0mwG7J1IRFBDNX1FzLffWsaCemXo13-w&index=2&t=2895s) <br>
OWASP scan----> Vulneranility scan on source code <br>
Docker pipeline plus in has to install to work with "withDockerRegistry" <br>


## Practiced once
```
pipeline {
    agent any
    tools{
        maven  'mvn3'
    }
    
    environment{
        SCANNER_HOME= tool 'sonar-scanner'
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/jaiswaladi246/Shopping-Cart.git'
            }
        }
        
        stage('COMPILE') {
            steps {
                sh "mvn clean compile -DskipTests=true"
            }
        }
        
       
        
      
         stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }
        
        stage('Docker Build & Push') {
            steps {
                script{

                        withDockerRegistry(credentialsId: 'docker-hub') {
    
                        sh "docker build -t shopping-cart -f docker/Dockerfile ."
                        sh "docker tag  shopping-cart jas09563/shopping-cart:latest"
                        sh "docker push jas09563/shopping-cart:latest"
                    }
                }
            }
        }
        
        
         stage('Docker Run') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-hub') {
                        
                        sh "docker run -d --name shop-shop -p 8070:8070 jas09563/shopping-cart:latest"
                        
                    }
                }
            }
        }
        
        
    }
}
```


