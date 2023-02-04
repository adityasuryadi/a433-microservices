#!/usr/bin/env sh

# build image dari dockerfile dengan nama item-app dan tag v1

echo "build docker"
echo docker build -t item-app:v1 . 

echo "============================================================"

# lihat semua image yang ada di local
echo "list docker image"
echo docker images

echo "============================================================"
# mengubah nama image yang sudah di buat ke nama image sesuai dengan ketentuan nama yang akan di push ke repository 
echo "rename docker image"
echo docker tag item-app:v1 ghcr.io/adityasuryadi/item-app:v1
echo "============================================================"
# login ke githu container menggunakan personal access token yang sudah di set sebelum nya
echo "login github"

echo %TOKEN_GITHUB%| docker login ghcr.io -u adityasuryadi --password-stdin
echo "============================================================"
# push image yang sudah di rename ke github container
echo "push ke github container registry"
echo docker push ghcr.io/adityasuryadi/item-app:v1
echo "============================================================"
