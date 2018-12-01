#!/bin/bash
set -ev
sudo sleep 30 ; sudo curl 127.0.0.1:80
sudo sleep 30 ; sudo curl $(dig +short myip.opendns.com @resolver1.opendns.com)
