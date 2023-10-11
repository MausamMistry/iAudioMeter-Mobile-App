import 'package:iaudiometer/services/api_names.dart';
import 'package:iaudiometer/utils/network/api_manager.dart';
import 'package:iaudiometer/utils/toaster.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;
  dynamic userData = {}.obs;
  RxString? token = "".obs;

  Future<void> login(request) async {
    try {
      var response = await ApiManager().call(APINames.login, request, ApiType.post);
      if (response.data != 0) {
        token!.value = response.data["accessToken"];
        userData.value = response.data;
        Get.toNamed(APINames.verification, arguments: request);
      } else {
        toaster.warning(response.message);
      }
    } catch (err) {
      toaster.error(err.toString());
    }
  }
}
