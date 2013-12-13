#!/bin/bash -e

if [ -z "$_resty_host" ]; then
  echo "Please set camera URL. Example:"
  echo "  . resty/resty http://10.0.0.1:10000"
  exit
fi
. resty/resty -W 

AEM=`echo '/version="1.0
/params/0/developerID="
/params/0/sg="
/params/0/methods="
/params/0/developerName="
/method=actEnableMethods
/id=1' | json2/2json | tee kees | POST /sony/accessControl `

echo "POST /sony/accessControl
Request: `cat kees`
Response: $AEM"

DG=$(echo "$AEM" | json2/json2 | grep dg= | cut -d= -f2)

KEYDG=90adc8515a40558968fe8318b5b023fdd48d3828a2dda8905f3b93a3cd8e58dc$DG

SG=`echo -n $KEYDG | openssl dgst -binary -sha256 | openssl base64`

echo

AEM=`echo '/version="1.0
/params/0/developerID=7DED695E-75AC-4ea9-8A85-E5F8CA0AF2F3
/params/0/sg='$SG'
/params/0/methods=camera/setFlashMode:camera/getFlashMode:camera/getSupportedFlashMode:camera/getAvailableFlashMode:camera/setExposureCompensation:camera/getExposureCompensation:camera/getSupportedExposureCompensation:camera/getAvailableExposureCompensation:camera/setSteadyMode:camera/getSteadyMode:camera/getSupportedSteadyMode:camera/getAvailableSteadyMode:camera/setViewAngle:camera/getViewAngle:camera/getSupportedViewAngle:camera/getAvailableViewAngle:camera/setMovieQuality:camera/getMovieQuality:camera/getSupportedMovieQuality:camera/getAvailableMovieQuality:camera/setFocusMode:camera/getFocusMode:camera/getSupportedFocusMode:camera/getAvailableFocusMode:camera/setStillSize:camera/getStillSize:camera/getSupportedStillSize:camera/getAvailableStillSize:camera/setBeepMode:camera/getBeepMode:camera/getSupportedBeepMode:camera/getAvailableBeepMode:camera/setCameraFunction:camera/getCameraFunction:camera/getSupportedCameraFunction:camera/getAvailableCameraFunction:camera/setLiveviewSize:camera/getLiveviewSize:camera/getSupportedLiveviewSize:camera/getAvailableLiveviewSize:camera/setTouchAFPosition:camera/getTouchAFPosition:camera/cancelTouchAFPosition:camera/setFNumber:camera/getFNumber:camera/getSupportedFNumber:camera/getAvailableFNumber:camera/setShutterSpeed:camera/getShutterSpeed:camera/getSupportedShutterSpeed:camera/getAvailableShutterSpeed:camera/setIsoSpeedRate:camera/getIsoSpeedRate:camera/getSupportedIsoSpeedRate:camera/getAvailableIsoSpeedRate:camera/setExposureMode:camera/getExposureMode:camera/getSupportedExposureMode:camera/getAvailableExposureMode:camera/setWhiteBalance:camera/getWhiteBalance:camera/getSupportedWhiteBalance:camera/getAvailableWhiteBalance:camera/setProgramShift:camera/getSupportedProgramShift:camera/getStorageInformation:camera/startLiveviewWithSize:camera/startIntervalStillRec:camera/stopIntervalStillRec:camera/actFormatStorage:system/setCurrentTime
/params/0/developerName=Sony Corporation
/method=actEnableMethods
/id=1' | json2/2json | tee kees | POST /sony/accessControl`

echo "POST /sony/accessControl
Request: `cat kees`
Response: $AEM"

echo 

rm kees
