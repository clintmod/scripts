#!/usr/bin/env bash

set -e

USER_NAME="LmaAdmin"
USER_PASSWORD="LmaAdmin!2024"
IS_ADMIN="true"

if [ "$IS_ADMIN" == "true" ]; then
    ADMIN_FLAG="-admin"
    HOME_DIR="/var/$USER_NAME"
else
    ADMIN_FLAG=""
    HOME_DIR="/Users/$USER_NAME"
fi

echo
echo "Creating user $USER_NAME"
echo
sysadminctl \
    -addUser $USER_NAME \
    -fullName "" \
    -password "$USER_PASSWORD"  \
    $ADMIN_FLAG \
    -home $HOME_DIR \
echo
echo "Creating home dir for $USER_NAME"
echo
sudo sudo createhomedir -c -u $USER_NAME
