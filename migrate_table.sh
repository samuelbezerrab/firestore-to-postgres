#!/bin/bash
FIRESTORE_TABLE_NAME='user_profile'
FIRESTORE_LIMIT=1000
FIRESTORE_JSON_TO_CSV_FIELDS='photoUrl,email,displayName,infusionID,firestore_id'

DATABASE_URI=postgres://user:password@ec2-34-203-182-65.compute-1.amazonaws.com:5432/daef6c518dq59p
DATABASE_TABLE_NAME='up_users'
DATABASE_FIELDS_NAMES='photo_url,email,name,infusion_id,firestore_id'

# Download Firestore data
node $(dirname "$0")/firestore2json/firestore2json.js $FIRESTORE_TABLE_NAME $FIRESTORE_LIMIT

# Convert downloaded data to CSV
json2csv -i $FIRESTORE_TABLE_NAME.json > $FIRESTORE_TABLE_NAME.csv -f $FIRESTORE_JSON_TO_CSV_FIELDS --no-header

# Import CSV to Postgres
psql $DATABASE_URI -c '\x' \
--command  "\copy public.${DATABASE_TABLE_NAME} (${DATABASE_FIELDS_NAMES}) FROM './${FIRESTORE_TABLE_NAME}.csv' DELIMITER ',' CSV ENCODING 'UTF8' QUOTE '\"';"
