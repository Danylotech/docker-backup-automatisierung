# Docker Backup Skript

Ein einfaches Bash-Skript, um meine wichtigsten Docker-Container im Homelab regelmäßig zu sichern.

## 1. Was macht das Skript?
Das Skript geht eine Liste von Containern wie Pi-hole und WireGuard in einer Schleife durch. Es stoppt den jeweiligen Container kurz, packt das dazugehörige Daten-Volume in ein komprimiertes `.tar.gz`-Archiv und startet den Container danach direkt wieder. Zum Schluss löscht es automatisch alle Backups, die älter als 7 Tage sind, damit die Festplatte nicht vollläuft.

## 2. Ausführen
Zuerst mache ich das Skript ausführbar:
`chmod +x backup.sh`

Danach kann es manuell gestartet werden. Dafür sind Root-Rechte nötig:
`sudo ./backup.sh`

## 3. Automatisierung (Cronjob)
Damit das Backup nachts automatisch läuft, habe ich folgenden Cronjob eingerichtet. Er läuft dann jeden Tag um 3:00 Uhr nachts:
`0 3 * * * /absoluter/pfad/zu/backup.sh > /dev/null 2>&1`
