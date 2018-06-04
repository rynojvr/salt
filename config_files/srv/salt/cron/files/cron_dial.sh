#!/bin/bash

echo "[$(date)] Testing for connection" >> /var/log/cron_dial.log
if [[ $(ps -ef|grep -c 5555) -eq 1 ]]; then
	echo "[$(date)] Connection not found. Reconnecting..." >> /var/log/cron_dial.log
	/usr/bin/ssh -i /home/pi/.ssh/pi_id_rsa -nNT -R 5555:localhost:22 rynojvr@159.203.180.72
else
	echo "[$(date)] Connection already established. All done" >> /var/log/cron_dial.log
fi
