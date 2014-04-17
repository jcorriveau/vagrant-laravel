#!/usr/bin/env bash

echo "********************************************************************************"
echo "                             UPDATING PACKAGE LIST                              "
echo "********************************************************************************"
printf "\n"

sudo yum check-update --quiet
sudo yum update -y --quiet

echo "Updating package list done successfully!"
printf "\n"