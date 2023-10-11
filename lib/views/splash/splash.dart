import 'package:iaudiometer/utils/config/assets.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/splash/splash_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashCtrl>(
      init: SplashCtrl(),
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                AppAsset.splashBackground,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                colorBlendMode: BlendMode.screen,
                color: lightColorScheme.primaryContainer,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  AppAsset.splashLogo,
                  height: Get.height * 0.28,
                  colorBlendMode: BlendMode.screen,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
