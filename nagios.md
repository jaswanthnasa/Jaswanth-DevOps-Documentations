# Nagios installation on Ubuntu 

```
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential apache2 php openssl perl make php-gd libgd-dev libapache2-mod-php libperl-dev libssl-dev daemon wget apache2-utils unzip
```

```
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo usermod -a -G nagcmd www-data
```

cd /tmp
```
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.5.tar.gz
tar -zxvf /tmp/nagios-4.4.5.tar.gz
```

 cd nagios-4.4.5/
```
sudo ./configure --with-nagios-group=nagios --with-command-group=nagcmd --with-httpd_conf=/etc/apache2/sites-enabled/
```
```
sudo make all
sudo make install
sudo make install-init
sudo make install-config
sudo make install-commandmode
sudo make install-webconf
```

> Need to provide password for nagiosadmin user
```
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```
```
sudo a2enmod cgi
sudo systemctl restart apache2
```

cd /tmp
```
wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz
tar -zxvf /tmp/nagios-plugins-2.3.3.tar.gz
```
cd nagios-plugins-2.3.3

```
sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios
sudo make
sudo make install
sudo /usr/local/nagios/bin/nagios -v
```



```
sudo systemctl enable nagios
sudo systemctl start nagios
```



in browser use  below <br>

**public-ip/nagios <br>
user-name: nagiosadmin <br>
password: given password**

## adding-host[slave]-into-nagios-server[master]

> commands to run on nagios hosts [slaves]
```
sudo apt update && sudo apt install nagios-nrpe-server nagios-plugins
sudo vi /etc/nagios/nrpe.cfg
```
 uncommet and replace server-address=master-ip
```
sudo service nagios-nrpe-server restart
```

> commands to run on nagios server [Master]
```
cd /usr/local/nagios/etc/objects
sudo vi localhost.cfg
```
 have to insert the host-server details in localhost.cfg




```
define host {
        use                          linux-server
        host_name                    My-host3
        alias                        Ubuntu Host
        address                      54.172.91.179
        register                     1
}

define service {
      host_name                       My-host3
      service_description             PING
      check_command                   check_ping!100.0,20%!500.0,60%
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       My-host3
      service_description             Check Users
      check_command           check_local_users!20!50
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       My-host3
      service_description             Local Disk
      check_command                   check_local_disk!20%!10%!/
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       My-host3
      service_description             Check SSH
      check_command                   check_ssh
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       My-host3
      service_description             Total Process
      check_command                   check_local_procs!250!400!RSZDT
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}
```

```
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```
```
sudo service nagios-nrpe-server restart
sudo service apache2 restart
sudo service nagios restart
```



