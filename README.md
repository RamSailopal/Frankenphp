# Frankenphp

Building a portable binary of you php application. A simple php page is used index.php

To build the binary and with docker installed, run:

    ./install.sh

This will execute the following steps:

    docker build -t static-app -f static-build.Dockerfile .

Build the binary in a **static-app** container

    docker cp $(docker create --name static-app-tmp static-app):/go/src/app/dist/frankenphp-linux-x86_64 my-app ; docker rm static-app-tmp

Copy the binary created into a local file called **my-app**

    docker run --rm -v "$PWD:/opt/app" -p 80:80 -it ubuntu bash -c "/opt/app/my-app php-server"

Run the binary in an Ubuntu container

Access the resulting app from a browser through http://localhost

## Files of note

Caddyfile - Determines how the inbuilt Caddy web server operates i.e. specifying the root folder


## Further Information

https://frankenphp.dev/docs/embed/

