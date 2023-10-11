import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEditClinicController extends GetxController {
  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

  dynamic args;

  File? logo;
  TextEditingController txtClinicName = TextEditingController();
  TextEditingController txtWebsite = TextEditingController();
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtFax = TextEditingController();
  TextEditingController txtAddress = TextEditingController();

  Future<void> saveClinic() async {}
}
