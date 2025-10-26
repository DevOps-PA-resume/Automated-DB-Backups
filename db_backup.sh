#!/bin/bash

docker exec -it mongodb mongodump --uri="mongodb://root:password@localhost:27017/Todo?authSource=admin" --gzip --archive=/tmp/Todo_$(date +%F_%H-%M).gz
docker cp mongodb:/tmp/Todo_$(date +%F_%H-%M).gz .
aws s3 cp Todo_$(date +%F_%H-%M).gz s3://automated-db-backup/backups/ --endpoint-url https://dd131b94df837c658bbc7e7f035537a7.r2.cloudflarestorage.com