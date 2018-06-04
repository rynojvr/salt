mysql:
#  stg-passwd-hash: '*CAC560C0ED394C2D89B7A1F08422B200B2FFBC26'
  user: salt
  pass: super_secret_password
  db: stagingdb
  host: localhost

ext_pillar:
  - mysql:
      db: stagingdb
      host: localhost
      fromdb:
        query: 'SELECT pillar, value FROM stagingdb.pillar WHERE minion_id = %s' 

{% set info = salt['pillar.get']('ext_pillar:mysql', '') %}
query_info:
  foo: {{ info }}
