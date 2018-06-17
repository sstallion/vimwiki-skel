#!/bin/sh
# serve.sh [port] - simple HTTP server for serving HTML content

exec python2 -m SimpleHTTPServer ${1:-8080}
