# Sony Camera API 

## Description

Sony Camera API helper functions.

Only one for now.

  - actEnableMethods
  - camera.sh

## Usage:

``` sh
git clone --recursive https://github.com/erik-smit/sony-camera-api.git sony-camera-api
# Cloning into 'sony-camera-api'...
...
cd sony-camera-api/
. resty/resty http://10.0.0.1:10000
# http://10.0.0.1:10000*
./camera.sh getAvailableCameraFunction
# /id=1
# /error/0=403
# /error/1=getAvailableCameraFunction
./actEnableMethods.sh 
# http://10.0.0.1:10000*
# POST /sony/accessControl
# Request: {"version": "1.0", "params": [{"developerName": "", "sg": "", "methods": "", "developerID": ""}], "method": # "actEnableMethods", "id": 1}
# Response: {"id":1,"result":[{"dg":"GiigWEMzm1MoEmMu"}]}
# 
# POST /sony/accessControl
# Request: {"version": "1.0", "params": [{"developerName": "Sony Corporation", "sg": "KL1kwAzfRAp/gXxYwrZk1K/skVOqvVjWiOvIw7U4ynQ=", "methods": "camera/setFlashMode:camera/getFlashMode:camera/getSupportedFlashMode:camera/getAvailableFlashMode:camera/setExposureCompensation:camera/getExposureCompensation:camera/getSupportedExposureCompensation:camera/getAvailableExposureCompensation:camera/setSteadyMode:camera/getSteadyMode:camera/getSupportedSteadyMode:camera/getAvailableSteadyMode:camera/setViewAngle:camera/getViewAngle:camera/getSupportedViewAngle:camera/getAvailableViewAngle:camera/setMovieQuality:camera/getMovieQuality:camera/getSupportedMovieQuality:camera/getAvailableMovieQuality:camera/setFocusMode:camera/getFocusMode:camera/getSupportedFocusMode:camera/getAvailableFocusMode:camera/setStillSize:camera/getStillSize:camera/getSupportedStillSize:camera/getAvailableStillSize:camera/setBeepMode:camera/getBeepMode:camera/getSupportedBeepMode:camera/getAvailableBeepMode:camera/setCameraFunction:camera/getCameraFunction:camera/getSupportedCameraFunction:camera/getAvailableCameraFunction:camera/setLiveviewSize:camera/getLiveviewSize:camera/getSupportedLiveviewSize:camera/getAvailableLiveviewSize:camera/setTouchAFPosition:camera/getTouchAFPosition:camera/cancelTouchAFPosition:camera/setFNumber:camera/getFNumber:camera/getSupportedFNumber:camera/getAvailableFNumber:camera/setShutterSpeed:camera/getShutterSpeed:camera/getSupportedShutterSpeed:camera/getAvailableShutterSpeed:camera/setIsoSpeedRate:camera/getIsoSpeedRate:camera/getSupportedIsoSpeedRate:camera/getAvailableIsoSpeedRate:camera/setExposureMode:camera/getExposureMode:camera/getSupportedExposureMode:camera/getAvailableExposureMode:camera/setWhiteBalance:camera/getWhiteBalance:camera/getSupportedWhiteBalance:camera/getAvailableWhiteBalance:camera/setProgramShift:camera/getSupportedProgramShift:camera/getStorageInformation:camera/startLiveviewWithSize:camera/startIntervalStillRec:camera/stopIntervalStillRec:camera/actFormatStorage:system/setCurrentTime", "developerID": "7DED695E-75AC-4ea9-8A85-E5F8CA0AF2F3"}], "method": "actEnableMethods", "id": 1}
# Response: {"id":1,"result":[{"dg":""}]}
# 
./camera.sh getAvailableCameraFunction
# /id=1
# # /result/0=Remote Shooting
# /result/1/0=Remote Shooting
# /result/1/1=Contents Transfer
./camera.sh setCameraFunction "Contents Transfer"
# /id=1
# /result/0=0

```

Presto! Your pictures are now on DLNA!

Enjoy.


