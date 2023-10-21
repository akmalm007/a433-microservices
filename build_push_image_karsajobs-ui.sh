#! /bin/bash

docker build -t akmalm007/karsajobs-ui .
sleep 10

docker tag akmalm007/karsajobs-ui ghcr.io/akmalm007/karsajobs-ui
sleep 10

docker image ls 
sleep 10 

echo $CR_PAT | docker login ghcr.io -u akmalm007 --password-stdin
sleep 10

docker push ghcr.io/akmalm007/karsajobs-ui:latest
