#!/bin/bash
source database/config.sh

echo "Creating database "$DB_NAME"..."

docker exec -it "$CONTAINER" psql -U "$DB_USER" -d postgres -c \
    "CREATE DATABASE "$DB_NAME";" &>/dev/null

docker exec -it "$CONTAINER" psql -U "$DB_USER" -d "$DB_NAME" -c \
    "CREATE SCHEMA migrations;" &>/dev/null

echo "Done!"
