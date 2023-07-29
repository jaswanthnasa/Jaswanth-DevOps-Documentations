# Tomcat installation steps

1. Launch instance with java pre-intalled

1. To donwload tomcat to our ubuntu machine/inatance 
```
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
```
wget======> to download files from web

1. In prder to avoid permisson denied errors <br/>
 sudo su---- to become root/super user
```
sudo su
```
1. Unzip/ untar the file use below command <br/>
```
tar -xvzf apache-tomcat-9.0.78.tar.gz
```
1. Rename folder to tomcat9 <br/>
```
mv apache-tomcat-9.0.78 tomcat9
```

1. goto the below path <br/>
```
cd /opt/tomcat9/bin
```

1. we need to start the tomcat server. so we need to execute the script in bin path <br/>
```
sh startup.sh
```

1. Tomcat has started in step-7, now we can able access the tomcat from web <br/>
   publicip:8080

1. Goto "Manager App" in tomcat webpage
   403 Access Denied
    
  	how to reslove this?=====> goto the path </br>
```
cd /opt/tomcat9/webapps/manager/META-INF
```
  update the context.xml =====>allow=".*"

1. Update the tomcat-users.xml file in /opt/tomcat9/conf
```

<tomcat-users>
<role rolename="manager-gui"/>
<user username="admin" password="Admin" roles="manager-gui, manager-script, manager-admin, manager-status"/>
</tomcat-users>
```

1. login using below creds
	user name:admin
	password:Admin

1. cd /opt/tomcat9/webapps

1. deploy a sample .war file  [What ever the .war files present in webapps folder tomcat will deploy those]

try below sample war files and try to access from tomcat
```
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
```
```

wget https://updates.jenkins.io/download/war/2.416/jenkins.war
```

# Advanced steps

1. to change the tomcat default port number from 8080 to otherp port [ex: 8081] <br/>
   	goto /opt/tomcat9/conf <br/>
    
```
cd /opt/tomcat9/conf
```
cat server.xml | grep 8080 <br/>
change connector port from 8080 to 8081 <br/>
restart tomcat [/opt/tomcat9/bin--------> shutdonw.sh then startup.sh] <br/> 


==========================================================================================================
=======================================================================================================

Tomcat_Jenkins integration

1) Plug-in used to integrate Tomcat with Jenkins=============>"Deploy to container"
