#! /bin/bash

docker build -t akmalm007/shipping-service .
sleep 10 

docker tag akmalm007/shipping-service ghcr.io/akmalm007/shipping-service

docker image ls 
sleep 5

docker push ghcr.io/akmalm007/shipping-service:latest
