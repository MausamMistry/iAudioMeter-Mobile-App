import 'package:get/get.dart';
import 'package:iaudiometer/routes/route_name.dart';

class SubscriptionController extends GetxController {
  dynamic selectedPlan;
  List plans = [
    {"id": 1, "isCurrent": true, "price": "\$100"},
    {"id": 2, "isCurrent": false, "price": "\$180"},
    {"id": 3, "isCurrent": false, "price": "\$250"}
  ];

  onViewDetail(item) {
    Get.toNamed(AppRouteNames.subscriptionDetail, arguments: item);
  }
}
