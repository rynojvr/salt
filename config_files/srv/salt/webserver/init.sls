apache2:
  pkg.installed: []
  service.running:
    # THIS IS JUST FOR EXAMPLE OF WATCHING FILE
    # - watch:
      # - file: /etc/httpd/extra/httpd-vhosts.conf
    - require:
      - pkg: apache2

# THIS IS AN EXAMPLE FILE TO WATCH
# /etc/httpd/extra/httpd-vhosts.conf:
#   file.managed:
#     - source: salt://webserver/httpd-vhosts.conf

/var/www/html/index.html:
  file:
    - managed
    - source: salt://webserver/index.html
    - require:
      - pkg: apache2
