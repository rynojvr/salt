/etc/dnsmasq.conf:
  file.managed:
    - source: salt://dns/files/dnsmasq.conf
    - user: root
    - group: root
    - mode: 644