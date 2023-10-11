import 'package:iaudiometer/preloader.dart';
import 'package:iaudiometer/routes/route_methods.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/config/app_config.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  await GetStorage.init();
  GestureBinding.instance.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  getPermissionStatus();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await preloader();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      getPages: AppRouteMethods.pages,
      initialRoute: AppRouteNames.splash,
    );
  }
}

Future getPermissionStatus() async {
  await Permission.audio.request();
  await Permission.location.request();
}
