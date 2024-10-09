FROM docker.io/postgres:14

ENV POSTGRES_PASSWORD=""
ENV POSTGRES_USER="postgres"
ENV POSTGRES_HOST_AUTH_METHOD="trust"

EXPOSE 5432

ADD update_config.sql /docker-entrypoint-initdb.d/
ADD allow_services.sh /docker-entrypoint-initdb.d/
ADD log_all.sh /docker-entrypoint-initdb.d/
