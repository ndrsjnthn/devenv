#!/bin/bash

projectDir=$1
name=$2

if ! screen -list | grep -q "nodejs"; then
  screen -dmS nodejs
fi

screen -S nodejs -X screen -t $2
screen -r nodejs -t $2 -X stuff $"cd ${1}\n sudo npm i\n npm start\n"
