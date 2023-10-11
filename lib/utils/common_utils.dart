import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class CommonUtil {
  Future<bool> isNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  goToNoInternetScreen() {
    //String currentRoute = Get.currentRoute;
    // if (currentRoute != AppRouteNames.noInternet) {
    //   Get.toNamed(AppRouteNames.noInternet);
    // }
  }
}

CommonUtil commonUtil = CommonUtil();
