import 'package:iaudiometer/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/services/clinic_service.dart';
import 'package:iaudiometer/services/clinician_service.dart';
import 'package:iaudiometer/services/patient_service.dart';
import 'package:iaudiometer/services/subscription_service.dart';

Future<void> preloader() async {
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => ClinicService().init());
  await Get.putAsync(() => ClinicianService().init());
  await Get.putAsync(() => PatientService().init());
  await Get.putAsync(() => SubscriptionService().init());
}
