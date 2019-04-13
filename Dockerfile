FROM postgres:11.2
COPY ./init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
COPY ./scripts/sql/schema.sql /tmp/scripts/schema.sql
