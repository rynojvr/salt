include: 
  - cron

Cron - Dial Home - Script:
  file.managed:
    - name: /opt/bin/cron_dial.sh
    - source: salt://cron/files/cron_dial.sh
    - user: root
    - group: root
    - mode: 500
    - require:
      - /opt/bin

Cron - Dial Home - Entry:
  cron.present:
    - name: /bin/bash /opt/bin/cron_dial.sh
    - identifier: CRON_DIAL
    - user: root
    - minute: '*/15'
