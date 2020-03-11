#! /bin/bash

base=$(dirname $(readlink -f $0))
src=$base
tag=it_resume
name=${tag}1
io=$base/io
out=$base/out

mkdir -p $io $out
cp -u $src/Makefile $src/*.{tex,sty,def,cls} $io

docker images | grep $tag || \
    docker build -t $tag -f Dockerfile $base

docker run -it --rm \
    --name $name --hostname $name \
    -v $io:/io:rw \
    $tag \
    bash -c "cd /io && make"

cp -u $io/*.pdf $out
