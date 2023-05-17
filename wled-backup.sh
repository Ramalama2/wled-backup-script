#/bin/bash

Backup_DIR=/root/Backups/WLED
currtime=$(TZ="Europe/Berlin" date +"%Y%m%d-%H%M")

# Array of hosts
hosts=("wled-buero.user.mydomain.eu" "192.168.27.16")

#### Script Section: ####
# Regex for IP address
ip_regex="^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$"

# Loop over each host
for host in "${hosts[@]}"; do
  if [[ $host =~ $ip_regex ]]; then
    host_name=$(echo "$host" | tr '.' '_')
  else
    host_name=$(echo "$host" | cut -d'.' -f1)
  fi

  # Execute the backup
  curl http://$host/presets.json?download --output $Backup_DIR/${currtime}_$host_name.presets.json
  curl http://$host/cfg.json?download --output $Backup_DIR/${currtime}_$host_name.config.json

done
