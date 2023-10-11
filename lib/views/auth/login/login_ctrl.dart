import 'package:iaudiometer/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginCtrl extends GetxController {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'loginScreen');
  bool isLoading = false;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  isLoadingStart() => isLoading = true..obs.update((val) => update());

  isLoadingStop() => isLoading = false..obs.update((val) => update());
  bool isTrue = true;
  void toggleObs() {
    isTrue = !isTrue;
    update();
  }

  onContinue() async {
    isLoadingStart();
    Get.toNamed(AppRouteNames.home);
    // AuthService authService = Get.find();
    // if (formKey.currentState!.validate()) {
    //   await authService.login({"mobileNo": txtMobile.text});
    //   txtMobile.clear();
    // }
    isLoadingStop();
  }
}
