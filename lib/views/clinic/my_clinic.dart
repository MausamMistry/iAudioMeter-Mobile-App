import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/my_clinic_ctrl.dart';
import 'package:iaudiometer/widgets/card_view.dart';

class MyClinics extends StatefulWidget {
  const MyClinics({super.key});

  @override
  State<MyClinics> createState() => _MyClinicsState();
}

class _MyClinicsState extends State<MyClinics> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClinicController>(
      init: ClinicController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: lightColorScheme.onPrimary,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "START",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Clinics",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CupertinoButton(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ADD CLINIC",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onPressed: () => Get.toNamed(AppRouteNames.addEditClinic),
              ).marginOnly(top: 15, bottom: 15),
              Expanded(
                child: ListView(
                  children: [
                    ..._.myClinicList.map(
                      (e) => GestureDetector(
                        onTap: () => Get.toNamed(AppRouteNames.clinicDetail, arguments: e),
                        child: CardView(
                          marginBottom: 15,
                          title: e["title"],
                          subTitle: e["subTitle"],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        );
      },
    );
  }
}
