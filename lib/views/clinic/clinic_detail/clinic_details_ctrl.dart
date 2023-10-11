import 'package:get/get.dart';

class ClinicDetailController extends GetxController {
  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

  dynamic args;
  bool isPopupEnable = false;
  String selectedTab = "CLINIC";
  List list = ["CLINIC", "CLINICIAN", "PATIENT"];

  List clinicianList = [
    {
      "title": "Life Hostpital",
      "subTitle": "PhD - Research",
    },
    {
      "title": "Fred Lee",
      "subTitle": "AuD",
    }
  ];

  List patientList = [
    {
      "title": "Eric Bibby",
      "subTitle": "PhD - Research",
    },
    {
      "title": "Matthew Butler",
      "subTitle": "AuD",
    },
    {
      "title": "Malinda Laney",
      "subTitle": "AuD",
    }
  ];
}
