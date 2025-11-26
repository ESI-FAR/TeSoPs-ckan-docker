#!/bin/bash

if [[ $CKAN__PLUGINS == *"harvest"* ]]; then
  echo "Starting harvester"
  supervisorctl -c /run/secrets/supervisord_file start ckan_gather_consumer:ckan_gather_consumer-00
  supervisorctl -c /run/secrets/supervisord_file start ckan_fetch_consumer:ckan_fetch_consumer-00

else
   echo "Not starting harvester"
fi
