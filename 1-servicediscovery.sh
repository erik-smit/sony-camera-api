#!/bin/bash

if [ -z "$_resty_host" ]; then
  echo "Please set camera URL. Example:"
  echo "  . resty/resty http://10.0.0.1:10000"
  exit
fi

echo Services found:
echo 
./sony.sh guide getServiceProtocols | grep ^/results/./0= | cut -d"=" -f2 | while read KEES; do
  echo ./sony.sh $KEES getMethodTypes 1.0
done
