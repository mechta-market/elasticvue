#!/bin/sh

./refresh_config.sh

exec nginx -g 'daemon off;'