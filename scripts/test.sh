#!/bin/bash
set -ev
hostname
sudo curl localhost:80
sudo curl 127.0.0.1
sudo curl $(dig +short myip.opendns.com @resolver1.opendns.com)
