#!/bin/sh

confpath=/www/site/config.js

# Recreate config file
rm -rf ${confpath}
touch ${confpath}

echo "window.BASE_API_URL = '$BASE_API_URL';" >> ${confpath}