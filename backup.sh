#!/bin/bash 

echo "creating backup folder"
kubectl exec -n mpdl-bloxberg-qa deployment/blockexplorer-production-db -- mkdir -p /var/lib/postgresql/data/backup

echo "creating new backup"
kubectl exec -n mpdl-bloxberg-qa deployment/blockexplorer-production-db \
	-- /bin/bash -c "pg_dump -U postgres --clean blockscout | gzip > /var/lib/postgresql/data/backup/$(date +"%d-%m-%Y")-backup.gz"

echo deleting old backups
kubectl exec -n mpdl-bloxberg-qa deployment/blockexplorer-production-db \
	-- /bin/bash -c 'rm -f $(ls -t /var/lib/postgresql/data/backup/*.gz | tail -n +31)'
