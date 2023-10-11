import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/config/assets.dart';
import 'package:iaudiometer/utils/theme/light.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: lightColorScheme.onPrimary),
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteNames.language);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: lightColorScheme.primary,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppAsset.eng,
                        height: 30,
                        width: 30,
                        colorBlendMode: BlendMode.screen,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        "ENG",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 3 / 100,
            bottom: 10,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    AppAsset.loginLogo,
                    height: 150,
                    width: 150,
                    colorBlendMode: BlendMode.screen,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "IAudiometer",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Divider(color: Colors.grey),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteNames.myClinic);
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(
                      AppAsset.start,
                      height: 50,
                      width: 50,
                      colorBlendMode: BlendMode.screen,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "START",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteNames.importAudioFile);
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(
                      AppAsset.audio,
                      height: 50,
                      width: 50,
                      colorBlendMode: BlendMode.screen,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "IMPORT AUDIO FILES",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideDrawer() {
    return SizedBox(
      width: double.infinity,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: lightColorScheme.primaryContainer,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                leading: Image.asset(
                  AppAsset.profile,
                  height: 30,
                ),
                title: const Text(
                  'PROFILE',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.toNamed(AppRouteNames.profile);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: ListTile(
                leading: Image.asset(
                  AppAsset.subscription,
                  height: 30,
                ),
                title: const Text(
                  'SUBSCRIPTION PLAN',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.toNamed(AppRouteNames.subscription);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: ListTile(
                leading: Image.asset(
                  AppAsset.password,
                  height: 30,
                ),
                title: const Text(
                  'CHANGE PASSWORD',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.toNamed(AppRouteNames.changePassword);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: ListTile(
                leading: Image.asset(
                  AppAsset.about,
                  height: 30,
                ),
                title: const Text(
                  'ABOUT US',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.toNamed(AppRouteNames.aboutUs);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: ListTile(
                leading: Image.asset(
                  AppAsset.contact,
                  height: 30,
                ),
                title: const Text(
                  'CONTACT US',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.toNamed(AppRouteNames.contact);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: lightColorScheme.primary,
              ),
              child: CupertinoButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.logout,
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "LOGOUT",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: lightColorScheme.primary),
                color: Colors.white,
              ),
              child: CupertinoButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.delete,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "DELETE ACCOUNT",
                      style: TextStyle(
                        color: lightColorScheme.primaryContainer,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
