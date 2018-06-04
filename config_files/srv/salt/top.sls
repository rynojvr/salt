base:
  '*':
    - cron.update
    - hostname

  heimdall:
    - cron.dial
    - dns
    # - molten_heimdall
    - database

  #"pihole-*":
