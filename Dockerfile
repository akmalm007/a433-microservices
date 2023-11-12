#Menggunakan node js alpine sebagai base image agar lebih ringan sizenya
FROM node:14-alpine as base
#WORKDIR untuk tempat code berada yaitu di /src
WORKDIR /src
#Melakukan copy dari root project ke WORKDIR
COPY . . 

#Menggunakan multi stage untuk membuat config kepada untuk
#menjalnkan bash script terlebih dahulu
FROM base as dev
#Menambah bash kepada container 
RUN apk add --no-cache bash
#Mendownload bash script dari github
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
#membuat script menjadi exectuable    
RUN chmod +x /bin/wait-for-it.sh
 
#set node env menjadi production
ENV NODE_ENV=production
#mengekspose port ke 3000
EXPOSE 3000
#Menjalankn perintah npm install untuk menginstall depedencies yang dibutuhkan
RUN npm install
#Menjalankan npm start untuk menjalankn order service 
CMD ["npm", "start"]
