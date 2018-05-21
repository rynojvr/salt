dnsmasq:
  addresses: 
    test.com: 1.2.3.4
    another.org: 2.3.4.5

  cnames:
    mydomain.com:
      domain01: server01.cloud.com
      domain02: server42.cloud.com

  hosts:
    cloud.com:
      server01: 1.0.0.1
      server42: 1.0.0.42
