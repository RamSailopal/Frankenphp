FROM --platform=linux/amd64 dunglas/frankenphp:static-builder

# Copy your app
WORKDIR /go/src/app/dist/app
COPY . .
COPY Caddyfile /go/src/app/caddy/frankenphp/Caddyfile
# Build the static binary, be sure to select only the PHP extensions you want
WORKDIR /go/src/app/
RUN EMBED=dist/app/ \
    PHP_EXTENSIONS=ctype,iconv,pdo_sqlite \
    ./build-static.sh