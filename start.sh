#!/bin/sh

# start the virtuoso service
echo "starting virtuoso …"
service virtuoso-opensource start

# start the php5-fpm service
echo "starting php …"
service php5-fpm start

# start the nginx service
echo "starting nginx …"
service nginx start

echo "define dump_one_graph …"
cat dump_one_graph.virtuoso.sql | isql-vt 1111 dba dba

echo "loading data into database …"
git clone $MODEL_REPO models
cd models
./import.sh

echo "copy form templates …"
cp /var/www/formTemplates/* /var/www/extensions/rdform/public/

echo "setup git for user …"
git config user.email "backup@pfarrerbuch.de"
git config user.name "Backup Bot"
git config push.default matching

if [ $BACKUP = "false" ]
then
    echo "backup cronjob is disabled!"
else
    echo "setup backup cronjob …"
    echo "0 * * * * cd /models/ && ./backup.sh commit >/dev/null 2>/dev/null" | crontab
    cron
fi

echo "OntoWiki is ready to set sail!"
cat /ow-docker.fig
echo ""
echo "following log:"

OWLOG="/var/www/logs/ontowiki.log"
touch $OWLOG
chmod a+w $OWLOG
tail -f $OWLOG