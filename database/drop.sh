#!/bin/bash
source database/config.sh

echo "Deleting database "$DB_NAME"..."

docker exec -it "$CONTAINER" psql -U "$DB_USER" -d postgres -c \
    "DROP DATABASE IF EXISTS "$DB_NAME";" &>/dev/null

echo "Deleted!"
