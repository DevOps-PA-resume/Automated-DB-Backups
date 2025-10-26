# Automated-DB-Backups

https://roadmap.sh/projects/automated-backups

## How to use

This project is based on this [project](github.com/DevOps-PA-resume/Multi-Container-Application/) for the database system

on you docker with mongo ad aws-cli, run this

```bash
aws configure set aws_access_key_id $ENV
aws configure set aws_secret_access_key $ENV
aws configure set default.region auto
```

then copy the scripts db_backup.sh and db_restore.sh on the vm

the script db_restore.sh will ask for a filename, that is shows everytime after you run db_backup.sh (in the form ```Todo_$(date +%F_%H-%M).gz```)
