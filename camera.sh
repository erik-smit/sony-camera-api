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

INDEX=0
for ARGUMENT in "${@:2}"
do
  case $ARGUMENT in
    {* ) 
      PARAM="$2" ;;    
    *[^a-zA-Z]* ) 
      PARAM="\"$2";;   
#    *[^a-zA-Z0-9-]* ) echo "not ok : special character";exit;; 
  esac
  PARAMS+=`printf "/params/%s=%s\n" "$INDEX" "$PARAM"`
  INDEX=$[$INDEX +1]
done
if [ -z "$PARAMS" ]; then
  PARAMS="/params=[]"
fi

RESP=`echo '/version="1.0
'$PARAMS'
/method='$1'
/id=1' | json2/2json | tee kees | POST /sony/camera 2>&1`
if [ $VERBOSE ]; then
  echo "Request : `cat kees`"
  echo "Response: $RESP"
  echo 
fi
echo $RESP | json2/json2
rm kees
