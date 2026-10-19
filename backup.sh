#!/bin/bash

BACKUP_DIR="/opt/backups/docker"
SOURCE_DIR="/var/lib/docker/volumes"
DATE=$(date +"%Y-%m-%d")
CONTAINERS="pihole wireguard"

echo "Starte Backup für: $CONTAINERS"
mkdir -p "$BACKUP_DIR"

for CONTAINER in $CONTAINERS; do
    echo "Sichere $CONTAINER..."
    
    docker stop "$CONTAINER"
    tar -czf "$BACKUP_DIR/${CONTAINER}_backup_$DATE.tar.gz" "$SOURCE_DIR/${CONTAINER}_data"
    docker start "$CONTAINER"
done

echo "Räume alte Backups auf (älter als 7 Tage)..."
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup fertig!"
