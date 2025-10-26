#!/bin/bash
set -e

FILENAME=Todo_$(date +%F_%H-%M).gz

docker exec mongodb mongodump --uri="mongodb://root:password@localhost:27017/Todo?authSource=admin" --gzip --archive=/tmp/$FILENAME
docker cp mongodb:/tmp/$FILENAME .

aws s3 cp $FILENAME s3://automated-db-backup/backups/ --endpoint-url https://dd131b94df837c658bbc7e7f035537a7.r2.cloudflarestorage.com

echo $FILENAME
rm $FILENAME