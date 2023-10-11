import 'package:get/get.dart';

class PatientDetailController extends GetxController {
  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

  dynamic args;
}
