
{{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}:
  host.only:
    - hostnames:
      - heimdall
      - heimdall.home

192.168.1.106:
  host.only:
    - hostnames:
      - laptop