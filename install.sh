#!/bin/bash
docker build -t static-app -f static-build.Dockerfile .
docker cp $(docker create --name static-app-tmp static-app):/go/src/app/dist/frankenphp-linux-x86_64 my-app ; docker rm static-app-tmp
docker run --rm -v "$PWD:/opt/app" -p 80:80 -it ubuntu bash -c "/opt/app/my-app php-server"
