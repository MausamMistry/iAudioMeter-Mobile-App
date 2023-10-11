import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/views/about_us/about_us.dart';
import 'package:iaudiometer/views/audio/audio_file.dart';
import 'package:iaudiometer/views/auth/profile/edit_profile.dart';
import 'package:iaudiometer/views/auth/login/login.dart';
import 'package:iaudiometer/views/auth/profile/profile.dart';
import 'package:iaudiometer/views/auth/register/register.dart';
import 'package:iaudiometer/views/auth/change_password/change_password.dart';
import 'package:iaudiometer/views/clinic/add_clinic/add_clinic.dart';
import 'package:iaudiometer/views/clinic/add_clinician/add_clinician.dart';
import 'package:iaudiometer/views/clinic/add_patient/add_patient.dart';
import 'package:iaudiometer/views/clinic/clinic_detail/clinic_detail.dart';
import 'package:iaudiometer/views/clinic/clinician_detail/clinician_detail.dart';
import 'package:iaudiometer/views/clinic/my_clinic.dart';
import 'package:iaudiometer/views/clinic/patient_detail/patient_detail.dart';
import 'package:iaudiometer/views/clinic/record_icd_detail/record_icd_detail.dart';
import 'package:iaudiometer/views/contact/contact.dart';
import 'package:iaudiometer/views/home.dart';
import 'package:iaudiometer/views/intro/intro.dart';
import 'package:iaudiometer/views/language/language.dart';
import 'package:iaudiometer/views/splash/splash.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/views/subscription/subscription.dart';
import 'package:iaudiometer/views/subscription/subscription_detail.dart';

class AppRouteMethods {
  static GetPage<dynamic> getPage({required String name, required GetPageBuilder page, List<GetMiddleware>? middlewares}) {
    return GetPage(
      name: name,
      page: page,
      transition: Transition.topLevel,
      showCupertinoParallax: true,
      middlewares: middlewares ?? [],
      transitionDuration: 350.milliseconds,
    );
  }

  static List<GetPage> pages = [
    getPage(name: AppRouteNames.splash, page: () => const SplashScreen()),
    getPage(name: AppRouteNames.intro, page: () => const Intro()),
    getPage(name: AppRouteNames.login, page: () => const LoginScreen()),
    getPage(name: AppRouteNames.register, page: () => const RegisterScreen()),
    getPage(name: AppRouteNames.home, page: () => const HomeScreen()),
    getPage(name: AppRouteNames.changePassword, page: () => const ChangePasswordScreen()),
    getPage(name: AppRouteNames.aboutUs, page: () => const AboutUsScreen()),
    getPage(name: AppRouteNames.profile, page: () => const ProfileScreen()),
    getPage(name: AppRouteNames.editProfile, page: () => const EditProfileScreen()),
    getPage(name: AppRouteNames.contact, page: () => const ContactScreen()),
    getPage(name: AppRouteNames.subscription, page: () => const SubscriptionScreen()),
    getPage(name: AppRouteNames.subscriptionDetail, page: () => const SubscriptionDetail()),
    getPage(name: AppRouteNames.myClinic, page: () => const MyClinics()),
    getPage(name: AppRouteNames.addEditClinic, page: () => const AddEditClinic()),
    getPage(name: AppRouteNames.clinicDetail, page: () => const ClinicDetail()),
    getPage(name: AppRouteNames.addEditClinician, page: () => const AddEditClinician()),
    getPage(name: AppRouteNames.clinicianDetail, page: () => const ClinicianDetail()),
    getPage(name: AppRouteNames.addEditPatient, page: () => const AddEditPatient()),
    getPage(name: AppRouteNames.patientsDetail, page: () => const PatientDetail()),
    getPage(name: AppRouteNames.recordICD, page: () => const RecordICDDetail()),
    getPage(name: AppRouteNames.language, page: () => const Language()),
    getPage(name: AppRouteNames.importAudioFile, page: () => const ImportAudioFile()),
  ];
}
