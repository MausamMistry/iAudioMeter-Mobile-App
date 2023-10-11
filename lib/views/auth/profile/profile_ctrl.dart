import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/routes/route_name.dart';

class ProfileCtrl extends GetxController {

  bool isLoading = false;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  isLoadingStart() => isLoading = true..obs.update((val) => update());

  isLoadingStop() => isLoading = false..obs.update((val) => update());
  bool isTrue = true;

  void toggleObs() {
    isTrue = !isTrue;
    update();
  }

  onContinue() async {
    Get.toNamed(AppRouteNames.editProfile);
    //isLoadingStart();
    // AuthService authService = Get.find();
    // if (formKey.currentState!.validate()) {
    //   await authService.login({"mobileNo": txtMobile.text});
    //   txtMobile.clear();
    // }
    // isLoadingStop();
  }
}
