include:
  - cron

Cron - Update - Script:
  file.managed:
    - name: /opt/bin/cron_update.sh
    - source: salt://cron/files/cron_update.sh
    - user: root
    - group: root
    - mode: 500
    - require:
      - /opt/bin

Cron - Update - Entry:
  cron.present:
    - name: /bin/bash /opt/bin/cron_update.sh
    - identifier: CRON_UPDATE
    - user: root
    - minute: random
