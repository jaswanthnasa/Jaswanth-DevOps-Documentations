# Tomcat installation steps

1. Launch instance with java pre-intalled

1. To donwload tomcat to our ubuntu machine/inatance 
```
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz
```
wget======> to download files from web

3) In prder to avoid permisson denied errors <br/>
 sudo su---- to become root/super user
```
sudo su
```
4) Unzip/ untar the file use below command <br/>
```
tar -xvzf apache-tomcat-9.0.80.tar.gz
```
5) Rename folder to tomcat9 <br/>
```
mv apache-tomcat-9.0.78 tomcat9
```

6) goto the below path <br/>
```
cd /opt/tomcat9/bin
```

7) we need to start the tomcat server. so we need to execute the script in bin path <br/>
```
sh startup.sh
```

8) Tomcat has started in step-7, now we can able access the tomcat from web <br/>
   publicip:8080

9) Goto "Manager App" in tomcat webpage
   403 Access Denied
    
  	how to reslove this?=====> goto the path </br>
```
cd /opt/tomcat9/webapps/manager/META-INF
```
  update the context.xml =====>allow=".*"

10) Update the tomcat-users.xml file in /opt/tomcat9/conf
```
<tomcat-users>
<role rolename="manager-gui"/>
<user username="admin" password="Admin" roles="manager-gui, manager-script, manager-admin, manager-status"/>
</tomcat-users>
```

11) login using below creds <br/>
	user name:admin <br/>
	password:Admin

12) cd /opt/tomcat9/webapps

13) deploy a sample .war file  [What ever the .war files present in webapps folder tomcat will deploy those]

try below sample war files and try to access from tomcat
```
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
```
```

wget https://updates.jenkins.io/download/war/2.416/jenkins.war
```

# Advanced steps

1. to change the tomcat default port number from 8080 to other port [ex: 8081] <br/>
   	goto /opt/tomcat9/conf <br/>
    
```
cd /opt/tomcat9/conf
```
cat server.xml | grep 8080 <br/>
change connector port from 8080 to 8081 <br/>
restart tomcat [/opt/tomcat9/bin--------> shutdonw.sh then startup.sh] <br/> 


# Tomcat_Jenkins integration

1) Plug-in used to integrate Tomcat with Jenkins=============>"Deploy to container"  [incase of freestyle project]
2) Plug-in used to integrate Tomcat with Jenkins=============>"ssh agent"  [incase of pipline project]
