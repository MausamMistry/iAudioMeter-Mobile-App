import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/config/session.dart';
import 'package:iaudiometer/utils/storage.dart';
import 'package:get/get.dart';

class SplashCtrl extends GetxController {
  // AuthService authService = Get.find();

  @override
  void onReady() {
    _mockCheckForSession().then((status) async {
      _authRedirection();
    });
    super.onReady();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    return true;
  }

  Future _authRedirection() async {
    var userData = read(AppSession.userData);
    if (userData != null) {
      // authService.token!.value = await read(AppSession.token);
      // authService.userData.value = userData;
      // bool loggedIn = await authService.whoAmI();
      await clearStorage();
      Get.toNamed(AppRouteNames.login);
      // if (loggedIn) {
      //   await clearStorage();
      //   Get.toNamed(AppRouteNames.login);
      // } else {
      //   await clearStorage();
      //   Get.toNamed(AppRouteNames.login);
      // }
    } else {
      await clearStorage();
      Get.toNamed(AppRouteNames.intro);
    }
  }
}
