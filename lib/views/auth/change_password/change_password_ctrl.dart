import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordCtrl extends GetxController {

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
    isLoadingStart();
    // AuthService authService = Get.find();
    // if (formKey.currentState!.validate()) {
    //   await authService.login({"mobileNo": txtMobile.text});
    //   txtMobile.clear();
    // }
    // isLoadingStop();
  }
}
