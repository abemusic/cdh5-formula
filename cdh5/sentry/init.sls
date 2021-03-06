include:
  - cdh5.repo
  - cdh5.sentry.conf
  - krb5
  - cdh5.security
  - cdh5.security.stackdio_user
  - cdh5.sentry.security
  {% if salt['pillar.get']('cdh5:sentry:start_service', True) %}
  - cdh5.sentry.service
  {% endif %}

extend:
  generate_sentry_keytabs:
    cmd:
      - require:
        - pkg: sentry

sentry:
  pkg:
    - installed 
    - pkgs:
      - sentry
      - cyrus-sasl-gssapi
    - require:
      - module: cdh5_refresh_db
