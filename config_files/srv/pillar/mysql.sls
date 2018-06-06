mysql: 
  user: 'root'
  pass: 'somepass'
  db: bar

  server: 
    root_password: 'somepass'
    mysqld:
      bind-address: 127.0.0.1

    salt_user:
      salt_user_name: 'salt'
      salt_user_password: 'someotherpass'
      grants:
        - 'all privileges'

  database:
    - name: bar
      character_set: utf8
      coolate: utf8_general_ci
    - name: foo
      character_set: utf8
      coolate: utf8_general_ci

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
