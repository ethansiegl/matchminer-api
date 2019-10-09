#!/usr/bin/env bash
set -e

echo "building..."
docker build -t 09esiegel/mm_api_utsw:latest . && docker push 09esiegel/mm_api_utsw:latest

echo ""
echo "copying docker-compose..."
scp /Users/ethansiegel/code/mm-devops/demo/docker-compose.yml esiegel@35.193.82.240:/home/esiegel/

echo ""
echo "deploying..."
ssh -t esiegel@35.193.82.240  'bash -ic "docker stop mm_api; docker rm mm_api; dc pull mm_api; dc up -d mm_api"' ;
