sudo -u postgres psql --echo-all --command='CREATE DATABASE auth;'
sudo -u postgres psql --echo-all --dbname=auth --file=/tmp/scripts/schema.sql
