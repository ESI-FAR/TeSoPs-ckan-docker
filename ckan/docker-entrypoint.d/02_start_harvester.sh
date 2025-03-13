#!/bin/bash

if [[ $CKAN__PLUGINS == *"harvest"* ]]; then
  echo "Starting harvester"
  #service supervisor start
  #supervisorctl add ckan_gather_consumer
  #supervisorctl add ckan_fetch_consumer
  supervisorctl start ckan_gather_consumer:ckan_gather_consumer-00
  supervisorctl start ckan_fetch_consumer:ckan_fetch_consumer-00

else
   echo "Not starting harvester"
fi
