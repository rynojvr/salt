set-hostname:
  file.managed:
    - name: /etc/hostname
    # hostname is always minion ID.
    - contents_grains: id
    - user: root
    - group: root
    - mode: 644
  cmd.wait:
    - name: hostname -F /etc/hostname || true
    - watch:
      - file: set-hostname
