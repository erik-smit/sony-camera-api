#!/bin/bash

VERBOSE=

if [ -z "$_resty_host" ]; then
  echo "Please set camera URL. Example:"
  echo "  . resty/resty http://10.0.0.1:10000"
  exit
fi
. resty/resty -W

if [ -z "$1" ]; then
  echo "Usage: 
  $0 getVersions
  $0 setCameraFunction \"Content Transfer\""
  exit
fi;

REQ='/version="1.0
/method='$1'
/id=1'

INDEX=0
for ARGUMENT in "${@:2}"
do
  case $ARGUMENT in
    "") 
      PARAM='""';;   
    ^[a-zA-Z]* ) 
      PARAM="\"$ARGUMENT";;   
    *) 
      PARAM=$ARGUMENT;;
#    *[^a-zA-Z0-9-]* ) echo "not ok : special character";exit;; 
  esac
  printf -v PARAM "/params/%s=%s" "$INDEX" "$PARAM"
  REQ+=$'\n'$PARAM
  INDEX=$[$INDEX +1]
done
if [ $INDEX == 0 ]; then
  REQ+=$'\n'"/params=[]"
fi

RESP=`echo "$REQ" | json2/2json | tee kees | POST /sony/camera 2>&1`
if [ $VERBOSE ]; then
  echo "Request : `cat kees`"
  echo "Response: $RESP"
  echo 
fi
echo $RESP | json2/json2
rm kees
