#!/bin/sh
# serve.sh [port] - HTTP server for serving HTML content

exec python3 -m http.server ${1:-8080}
