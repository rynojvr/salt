dnsmasq:
  pkg.installed:
    - require:
      - /etc/dnsmasq.conf
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/dnsmasq.conf