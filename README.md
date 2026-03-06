# Scripts

- Before anything, be sure to run:

  `make init`


## IoT alarms data population

- Run:

  `make run-iot`

Then chose one of the available status:

1. ACTIVE
2. INACTIVE
3. ALARMED
4. SILENCED

## Recreate database

Go to `database/config.sh` and change `DB_NAME` to the database you want to recreate:

- Run:

  `make fix-db`