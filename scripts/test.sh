#!/bin/bash
set -ev
curl 127.0.0.1
curl $(dig +short myip.opendns.com @resolver1.opendns.com)
