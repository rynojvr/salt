/opt/bin:
  file.directory:
    - user: root
    - group: root
    - mode: 500
    - makedirs: True

/opt/bin/cron_update.sh:
  file.managed:
    - source: salt://bin/cron_update.sh
    - user: root
    - group: root
    - mode: 500

/bin/bash /opt/bin/cron_update.sh:
  cron.present:
    - identifier: CRON_UPDATE
    - user: root
    - minute: random
