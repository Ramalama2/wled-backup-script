# wled-backup-script
- Simple script to Automate Wled Backups
- Simply edit the hosts and the Timezone if you need.
- The hosts accepts as many dns names or ip addresses as you wish, separated by a space.
<br>

- You can add it to crontab like that:
- "5 5 * * * /root/scripts/wled-backup.sh >/dev/null 2>&1"

- To-Do's
- Maybe a Backup retention, how many to keep, etc... If someone needs that feel free for an PR, maybe i'll add that at some point either.
