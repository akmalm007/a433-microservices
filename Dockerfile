#Sebagai base iamge dari container 
FROM node:14-alpine as base
#Working direcotry untuk container shipping-service 
WORKDIR /src
#Copy semua kebutuhan dari shipping-service
COPY . . 

#Stage build untuk production dengan base 
FROM base as production
#Set env yaitu production, port, dan url
ENV NODE_ENV=production
ENV PORT=3001
ENV AMQP_URL="amqp://localhost:5672"
#Menjalankan npm ci untuk clean install untuk production enviroment 
RUN npm ci
#Copy semua aplikasi
COPY . . 
#Command ketika pertama kali container dijalankan
CMD ["npm", "run", "start"]
 
#Stagin dev yang dibuat untuk Menjalankan script yang menunggu rabbitmq service berjalan terlebih dahulu
FROM base as dev
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh
 
#Melakukan set enviroment untuk development
ENV NODE_ENV=development
#Port berdasarkan dontenv
ENV PORT=3001
ENV AMQP_URL="amqp://localhost:5672"
#Menjalankan perintah untuk mengintall dependcies
RUN npm install
#Copy semua file ke container
COPY . . 
#Command ketika container selesai dibuat
CMD ["npm", "run", "start"]
