heimdall:
  host.present:
    - ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
    - names:
      - heimdall
      - heimdall.home


