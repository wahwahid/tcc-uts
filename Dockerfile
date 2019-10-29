# Mengambil base dari node:alpine
FROM node:alpine

# Menginstall git dan openssh
RUN apk add --no-cache bash git openssh

# Mengclone source code aplikasi tictactwo dari gitlab
# Berpindah ke direktori aktif ke tictactwo
# Menginstall dependency dari aplikasi dan membuild aplikasi untuk environtment produksi
# Menginstall modul node.js "serve" untuk menyajikan aplikasi (default ke port 5000)
RUN git clone https://gitlab.com/wahwahid/tictactwo.git /tictactwo \
    && cd /tictactwo \
    && npm install && npm run build \
    && npm install -g serve

# Mengekspose port 5000
EXPOSE 5000

# Menjalankan serve
CMD ["serve", "-s", "/tictactwo/build"]