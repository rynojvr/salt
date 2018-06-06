mysql: 

  pass: somepass

  server: 
    root_user: root
    root_password: ~
    mysqld:
      bind-address: 127.0.0.1

  salt_user:
    salt_user_name: 'root'
    salt_user_password: ~

  database:
    - name: bar
      character_set: utf8
      coolate: utf8_general_ci
    - name: foo
      character_set: utf8
      coolate: utf8_general_ci

  user: 
    salt_user:
      pass: somepass
      host: localhost
      databases:
        - database: foo
          grants: ['select', 'insert', 'update']
        - database: bar
          grants: ['all privileges']

ext_pillar:
  - mysql:
      fromdb:
        query: 'select * from pillar where minion_id like %s'

# mysql:
#   server:
#     enabled: true
#     admin:
#       user: root
#       password: pass
#     bind:
#       address: '127.0.0.1'
#       port: 3306
#     database:
#       name:
#         encoding: 'utf8'
#         users:
#         - name: 'username'
#           password: 'password'
#           host: 'localhost'
#           rights: 'all privileges'
