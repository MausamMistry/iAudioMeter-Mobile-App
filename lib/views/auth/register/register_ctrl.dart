import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterCtrl extends GetxController {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'registerScreen');
  bool isLoading = false;
  TextEditingController txtDoctorName = TextEditingController();
  TextEditingController txtClinicName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  isLoadingStart() => isLoading = true..obs.update((val) => update());

  isLoadingStop() => isLoading = false..obs.update((val) => update());
  bool isTrue = true;
  bool isFalse = true;

  void toggleObs(val) {
    if(val == 'confirm') {
      isFalse = !isFalse;
    }else{
      isTrue = !isTrue;
    }
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
