# A MySQL database with RT fixtures loaded.
FROM docker.ocf.berkeley.edu/theocf/debian:stretch

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        mariadb-server \
        request-tracker4 \
        rt4-db-mysql \
    && rm -rf /var/lib/apt/lists/*

COPY 98-ocfdb.pm /etc/request-tracker4/RT_SiteConfig.d/98-ocfdb.pm
COPY install-fixtures /root/

RUN /root/install-fixtures

CMD ["mysqld"]

# vim: ft=Dockerfile
