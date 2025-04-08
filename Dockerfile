#base image node v14
FROM node:14

#workdir
WORKDIR /app

#copy file
COPY package*.json ./

#copy file
#COPY . /app
COPY . .

#environment
ENV NODE_ENV=production DB_host=item-db 

#Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build


#Ekspos bahwa port yang digunakan oleh aplikasi adalah 8080.
EXPOSE 8080

#Saat container diluncurkan, jalankan server dengan perintah npm start.
CMD ["npm", "start"]