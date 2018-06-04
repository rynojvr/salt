mysql: 
  server: 
    root_user: 'admin'
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