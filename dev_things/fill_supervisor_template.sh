#!/usr/bin/env bash

# Pass on all `.env` environment variables to supervisor conf file.
# supervisor ignores all user env vars, so we have to supply them by hand.

ENV_FILE=".env"
TEMPLATE_FILE="ckan/supervisor/supervisord_template.conf"
CONF_FILE="ckan/supervisor/supervisord.conf"

# remove comments and empty lines
vars=$(sed -e '/^#/d' -e '/^$/d' "$ENV_FILE")

# enclose arguments in quotation marks, replace newlines with commas
vars=$(echo "$vars" | sed -z -e 's/=/="/g' -e 's/\n/",/g')

## replace newlines with commas
#vars=$(echo "$vars" | sed -z -e 's/\n/,/g')

# remove last comma
vars=$(echo "$vars" | sed -e 's/,$//')

# remove double quotation marks
vars=$(echo "$vars" | sed -e 's/""/"/g')

# replace template shortcode with `environment=ALL_THE_ENV_VARS`
sed -e "s/; {{ put env vars here }} ;/environment=${vars//\//\\/}/g" \
  < "$TEMPLATE_FILE" \
  > "$CONF_FILE"
