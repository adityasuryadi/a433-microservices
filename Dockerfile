# buat image dengan base node:14-alpine
FROM node:14-alpine

# update nodejs dan npm dependencies
RUN apk add --update nodejs npm

# buat directory bernama app di dalam container dan sebagai working directory
WORKDIR /app

# copy local working ke container directory 
COPY . .

# mendefinisikan environtment variabel yang di pakai di container
ENV NODE_ENV=production DB_HOST=item-db

# saat buat image jalnakan perintah di bawah untuk menginstall package json node js dan build aplikasi node js nya
RUN npm install --production --unsafe-perm && npm run build

# jalankan instruksi npm start saat docker image dijalankan sebagai container,yang artinya jalankan npm start di container
CMD ["npm","start"]

# mengekspos port yang di gunakan container
EXPOSE 8080