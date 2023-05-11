docker volume create besu-dev-database

docker run --rm -v besu-dev-database:/opt/besu/database:rw ubuntu /bin/sh -c "useradd besu && chown besu:besu /opt/besu/database"
