#!/bin/bash

echo "Starting cron update run at $(date)" >> /var/log/cron_update.log
salt-call state.highstate
