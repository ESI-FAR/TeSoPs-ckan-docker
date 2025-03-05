#!/usr/bin/env bash

docker system prune -af && \
docker image prune -af && \
docker system prune -af --volumes && \
docker volume prune -af && \
docker system df
