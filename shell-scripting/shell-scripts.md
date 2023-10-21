## Shell-scripts realtime usecases

### 1. Clearing cache and Buffer scripts:

```
#bin/bash

# script for clearing cache and swap memory when it reaches 90%

 

a=$(vmstat -s | awk  ' $0 ~ /total memory/ {total=$1 } $0 ~/free memory/ {free=$1} $0 ~/buffer memory/ {buffer=$1} $0 ~/cache/ {cache=$1} END{print (total-free-buffer-cache)/total*100}')
echo ${a%.*}
echo "Present cache and swap memory is  $a"
if [ ${a%.*} -ge 85 ];then
echo "clearing cache"
echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'
else
echo "No Need to clear cache right now"
fi
```

how to place script

```
First copy the script path
/home/scripts/clearcache.sh
sudo su
crontab -e
* * * * * 
```




### 2. Scripts to check always make java services up:

```
#!/bin/bash

timestamp=`date +"%Y-%m-%d %H:%M:%S"`
STATUS=$(curl -s -o /dev/null -w "%{http_code}" -I http://localhost:9092/getAlltemplateNames)

if [[ ${STATUS} -eq 200 ]]
then
echo “ $timestamp Everything is Fine” >> /home/service/reporting_log.txt
else
cd /home/admin/services/Reports
nohup java -jar target/service.jar &
echo " $timestamp Restarted successfully" >> /home/service/reporting_log.txt
echo " Services" |mutt -s "Buzz Reporting Restarted $timestamp " -- sandeep@acure.com 
fi
```




### 3. Mysql backups:

```-
YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
HOUR=`date+%H`
sudo mkdir -p $YEAR/$MONTH/$DAY/$HOUR

mysqldump -uroot -proot schemaname > /home/schema.sql
mysqldump -uroot -proot schemaname > /home/schema.sql
mysqldump -uroot -proot schemaname > /home/schema.sql
mysqldump -uroot -proot schemaname > /home/schema.sql 
mysqldump -uroot -proot schemaname > /home/schema.sql




YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
HOUR=`date+%H`
sudo mkdir -p $YEAR/$MONTH/$DAY/$HOUR

mysqldump -uroot -proot control > $YEAR/$MONTH/$DAY/$HOUR/control.sql --set-gtid-purged=OFF
mysqldump -uroot -proot fundstransfer > $YEAR/$MONTH/$DAY/$HOUR/fundstransfer.sql --set-gtid-purged=OFF

```

