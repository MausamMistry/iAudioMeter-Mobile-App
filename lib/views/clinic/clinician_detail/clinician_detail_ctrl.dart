import 'package:get/get.dart';

class ClinicianDetailController extends GetxController {
  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

  dynamic args;
}
