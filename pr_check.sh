#!/bin/bash
set -exv
docker build  --no-cache \
              --force-rm \
              -t rds-enhanced-metrics-exporter:latest  \
              -f ./Dockerfile .
