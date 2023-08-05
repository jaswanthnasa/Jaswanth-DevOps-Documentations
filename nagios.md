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

## NRPE
> commands to run on nagios hosts [slaves]
```
sudo apt update && sudo apt install nagios-nrpe-server nagios-plugins
```
vi /etc/nagios/nrpe.cfg



