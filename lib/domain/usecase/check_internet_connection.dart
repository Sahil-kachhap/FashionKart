import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection{
  StreamSubscription? subscription;

  checkConnectivity(){
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
       if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
         log("Internet Connected");
       }else{
        log("No Internet");
       }
     });
  }
}