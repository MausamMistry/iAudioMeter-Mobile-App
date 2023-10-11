import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditClinicianController extends GetxController {
  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

  dynamic args;

  File? logo;
  TextEditingController txtClinicianName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCertificateName = TextEditingController();
  TextEditingController txtDegreeName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();

  bool isOption = false;

  Future<void> saveClinic() async {}
}
