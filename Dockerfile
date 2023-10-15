#Perintah FROM untuk mengambil image nodejs yang berada di docker hub dengan versi 14
FROM node:14
#WORKDIR digunakan untuk membuat directori aplikasi akan ditempatkan
WORKDIR /app
#COPY digunakan untuk meng-copy file yang berada di direktori dockfile kemudian di salin ke directori /app
COPY . .
#ENV adalah variable enviroment yang digunakan oleh aplikasi untuk menentukan dimana aplikasi ini akan dideploy
ENV NODE_ENV=production DB_HOST=item-db
#RUN adalah perinah untuk menjalankan syntax ketika sedang membuat docker image
RUN npm install --production --unsafe-perm && npm run build
#EXPOSE digunakan untuk membuat docker container bisa dilihat oleh pengguna
EXPOSE 8080
#CMD adalah perintah pertama yang akan dijalankan ketika docker container akan dijalankan 
CMD ["npm", "start"]
