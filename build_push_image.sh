#perintah dibawwah untuk memilih bash sebagai shell yang dijalankan
#! /bin/bash
#docker build perintah untuk membuat docker image dari docker build dengan -tags untuk memberi tag versi berapa dari image yang dibuat 
docker build -t item-app:v1 .
sleep 10
#docker image ls perintah untuk melihat image apa saja yang tersedia di docker engine
docker image ls 
sleep 10
#docker tag untuk merubah nama image yang kita punya sesuai dengan repository yang ada di docker hub
docker tag item-app:v1 akmalm007/proyek-pertama-docker:v1
sleep 10
#docker login digunakan untuk login ke dalam docker hub dengan terminal
docker login -u akmalm007 -p CHIPer007
sleep 10
#docker push perintah untuk melakukan push image ke repository yang kita buat 
docker push akmalm007/proyek-pertama-docker:v1
