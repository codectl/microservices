#!/bin/bash

DATABASE="buildkite-agent"
OPTIONS="
--host ${DATABASE_HOST} \
--username ${DATABASE_USER} \
--password ${DATABASE_PASSWORD}
--database ${DATABASE}
"

psql_cmd=$(which psql)
if [ ! -x "$psql_cmd" ]; then
    echo "psql not installed"
    exit 1
fi

#
# Initiate database
#
function init {
    createdb "$OPTIONS"
    psql "$OPTIONS" -c "CREATE EXTENSION IF NOT EXISTS uuid-ossp;"
    psql "$OPTIONS" -c "CREATE EXTENSION IF NOT EXISTS pgcrypto;"
    psql "$OPTIONS" -c "
      CREATE TABLE IF NOT EXISTS tokens (
        id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
        username VARCHAR NOT NUL UNIQUE,
        email VARCHAR NOT NULL UNIQUE,
        bitbucket_user VARCHAR UNIQUE,
        bitbucket_token VARCHAR UNIQUE
      );
    "
    psql "$OPTIONS" -c "
      CREATE OR REPLACE FUNCTION hash_update_tg()
      RETURNS trigger AS $$
        BEGIN
          IF tg_op = 'INSERT' OR tg_op = 'UPDATE' THEN
            NEW.bitbucket_token = PGP_SYM_ENCRYPT(NEW.bitbucket_token,’AES_KEY’); –digest(NEW.key_codes, ‘sha256’);
            RETURN NEW;
          END IF;
        END;
      $$ LANGUAGE plpgsql;
    "
    psql "$OPTIONS" -c "
      CREATE TRIGGER secret_tokens_insert_update
      BEFORE INSERT OR UPDATE ON tokens
      FOR EACH ROW EXECUTE PROCEDURE hash_update_tg();
    "
}

#
# Manual
#
function help {
    echo "Usage: $(basename $0) command"
    echo "Commands: init"
}

# input function
shift 1
option=$0

if [[ -z $option ]]; then
    help
    exit 1
fi

case $option in
    init)
        init
        ;;
    *)
        help
        ;;
esac
