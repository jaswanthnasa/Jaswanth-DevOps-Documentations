#!/bin/bash
sudo yum install httpd -y
sudo service httpd start
sudo chkconfig httpd on
sudo echo "This is to Test SSM agent demo lab" >> /var/www/html/index.html