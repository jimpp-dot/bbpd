
import 'package:connectivity_plus/connectivity_plus.dart';

export 'package:connectivity_plus/connectivity_plus.dart';


class TrackerUtil{

  static const int BIZ = 0;
  static const int MONITOR = 1;

  static ConnectivityResult? connectivityResult;

  static initNetworkListener()async {
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult = event;
    });
  }

}