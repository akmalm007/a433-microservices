#! /bin/bash

docker build -t akmalm007/order-service .
sleep 10 

docker tag akmalm007/order-service ghcr.io/akmalm007/order-service

docker image ls 
sleep 5

docker push ghcr.io/akmalm007/order-service:latest
