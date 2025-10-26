#!/bin/bash

read -p "Enter filename: " FILENAME
echo "You entered: $FILENAME"

aws s3 cp s3://automated-db-backup/backups/$FILENAME . --endpoint-url https://dd131b94df837c658bbc7e7f035537a7.r2.cloudflarestorage.com

docker cp ./$FILENAME mongodb:/tmp/$FILENAME
docker exec -i mongodb mongorestore --uri="mongodb://root:password@localhost:27017/todoapp?authSource=admin" --gzip --archive=/tmp/$FILENAME --drop
