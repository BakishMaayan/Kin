#!/bin/bash

ps aux | grep flask | awk {'print $2'} | sudo xargs kill -9
nohup sudo bash run.sh &
