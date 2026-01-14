#!/bin/bash
set -e

envsubst '$NGINX_LISTEN_PORT,$GRPC_BACKEND' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
