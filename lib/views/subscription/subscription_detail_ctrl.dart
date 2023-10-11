import 'package:get/get.dart';

class SubscriptionDetailController extends GetxController {
  @override
  void onInit() {
    selectedPlan = Get.arguments;
    super.onInit();
  }

  dynamic selectedPlan;
}
