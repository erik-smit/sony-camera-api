# Sony Camera API 

## Description

Sony Camera API helper functions.

Only one for now.

  - actEnableMethods

## Usage:

```
Smite@Tank:~/dev> git clone --recursive https://github.com/erik-smit/sony-camera-api.git sony-camera-api
Cloning into 'sony-camera-api'...
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 0), reused 4 (delta 0)
Unpacking objects: 100% (4/4), done.
Submodule 'json2' (https://github.com/vi/json2.git) registered for path 'json2'
Submodule 'resty' (https://github.com/micha/resty.git) registered for path 'resty'
Cloning into 'json2'...
remote: Counting objects: 29, done.
remote: Compressing objects: 100% (18/18), done.
remote: Total 29 (delta 10), reused 28 (delta 9)
Unpacking objects: 100% (29/29), done.
Submodule path 'json2': checked out 'b40b33d0ab761e0590c5dd0b5a1b54a45e7137ee'
Cloning into 'resty'...
remote: Counting objects: 631, done.
remote: Compressing objects: 100% (460/460), done.
remote: Total 631 (delta 305), reused 413 (delta 166)
Receiving objects: 100% (631/631), 97.73 KiB, done.
Resolving deltas: 100% (305/305), done.
Submodule path 'resty': checked out '7e054f98d315923defe641ca06f1d7079b7a87c7'
Smite@Tank:~/dev> cd sony-camera-api/
Smite@Tank:~/dev/sony-camera-api> . resty/resty
Smite@Tank:~/dev/sony-camera-api> resty http://10.0.0.1:10000
http://10.0.0.1:10000*
Smite@Tank:~/dev/sony-camera-api> POST /sony/camera '{"method":"setCameraFunction", "params":["Contents Transfer"], "id":1, "version":"1.0"}'
{"error":[403,"setCameraFunction"],"id":1}
Smite@Tank:~/dev/sony-camera-api> ./actEnableMethods.sh http://10.0.0.1:10000
http://10.0.0.1:10000*
POST /sony/accessControl
Request: {"version": "1.0", "params": [{"developerName": "", "sg": "", "methods": "", "developerID": ""}], "method": "actEnableMethods", "id": 1}
Response: {"id":1,"result":[{"dg":"GiigWEMzm1MoEmMu"}]}

POST /sony/accessControl
Request: {"version": "1.0", "params": [{"developerName": "Sony Corporation", "sg": "KL1kwAzfRAp/gXxYwrZk1K/skVOqvVjWiOvIw7U4ynQ=", "methods": "camera/setFlashMode:camera/getFlashMode:camera/getSupportedFlashMode:camera/getAvailableFlashMode:camera/setExposureCompensation:camera/getExposureCompensation:camera/getSupportedExposureCompensation:camera/getAvailableExposureCompensation:camera/setSteadyMode:camera/getSteadyMode:camera/getSupportedSteadyMode:camera/getAvailableSteadyMode:camera/setViewAngle:camera/getViewAngle:camera/getSupportedViewAngle:camera/getAvailableViewAngle:camera/setMovieQuality:camera/getMovieQuality:camera/getSupportedMovieQuality:camera/getAvailableMovieQuality:camera/setFocusMode:camera/getFocusMode:camera/getSupportedFocusMode:camera/getAvailableFocusMode:camera/setStillSize:camera/getStillSize:camera/getSupportedStillSize:camera/getAvailableStillSize:camera/setBeepMode:camera/getBeepMode:camera/getSupportedBeepMode:camera/getAvailableBeepMode:camera/setCameraFunction:camera/getCameraFunction:camera/getSupportedCameraFunction:camera/getAvailableCameraFunction:camera/setLiveviewSize:camera/getLiveviewSize:camera/getSupportedLiveviewSize:camera/getAvailableLiveviewSize:camera/setTouchAFPosition:camera/getTouchAFPosition:camera/cancelTouchAFPosition:camera/setFNumber:camera/getFNumber:camera/getSupportedFNumber:camera/getAvailableFNumber:camera/setShutterSpeed:camera/getShutterSpeed:camera/getSupportedShutterSpeed:camera/getAvailableShutterSpeed:camera/setIsoSpeedRate:camera/getIsoSpeedRate:camera/getSupportedIsoSpeedRate:camera/getAvailableIsoSpeedRate:camera/setExposureMode:camera/getExposureMode:camera/getSupportedExposureMode:camera/getAvailableExposureMode:camera/setWhiteBalance:camera/getWhiteBalance:camera/getSupportedWhiteBalance:camera/getAvailableWhiteBalance:camera/setProgramShift:camera/getSupportedProgramShift:camera/getStorageInformation:camera/startLiveviewWithSize:camera/startIntervalStillRec:camera/stopIntervalStillRec:camera/actFormatStorage:system/setCurrentTime", "developerID": "7DED695E-75AC-4ea9-8A85-E5F8CA0AF2F3"}], "method": "actEnableMethods", "id": 1}
Response: {"id":1,"result":[{"dg":""}]}

Smite@Tank:~/dev/sony-camera-api> POST /sony/camera '{"method":"setCameraFunction", "params":["Contents Transfer"], "id":1, "version":"1.0"}'
{"id":1,"result":[0]}
Smite@Tank:~/dev/sony-camera-api>
```

Presto!

Enjoy.


