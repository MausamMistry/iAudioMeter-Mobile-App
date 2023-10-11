import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/clinic_detail/clinic_details_ctrl.dart';
import 'package:iaudiometer/widgets/card_view.dart';

class ClinicDetail extends StatefulWidget {
  const ClinicDetail({super.key});

  @override
  State<ClinicDetail> createState() => _ClinicDetailState();
}

class _ClinicDetailState extends State<ClinicDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClinicDetailController>(
      init: ClinicDetailController(),
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
              "CLINIC DETAILS",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ).marginOnly(right: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _.args["title"] ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).marginOnly(top: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                decoration: BoxDecoration(
                  color: lightColorScheme.primary,
                  borderRadius: BorderRadius.circular(_.isPopupEnable ? 20 : 20),
                ),
                child: !_.isPopupEnable
                    ? InkWell(
                        onTap: () {
                          _.isPopupEnable = !_.isPopupEnable;
                          _.update();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _.selectedTab,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < _.list.length; i++)
                            InkWell(
                              onTap: () {
                                _.selectedTab = _.list[i];
                                _.isPopupEnable = !_.isPopupEnable;
                                _.update();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _.list[i],
                                    style: TextStyle(
                                      fontSize: _.list[i] == _.selectedTab ? 17 : 16,
                                      fontWeight: _.list[i] == _.selectedTab ? FontWeight.w600 : FontWeight.w300,
                                    ),
                                  ),
                                  if (_.list[i] == _.selectedTab) const Icon(Icons.keyboard_arrow_up_outlined)
                                ],
                              ).marginOnly(bottom: i == _.list.length - 1 ? 0 : 15),
                            ),
                        ],
                      ),
              ).marginOnly(bottom: 12),
              if (_.selectedTab == "CLINIC")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "817-404-4423",
                          style: GoogleFonts.poppins(color: Colors.grey.shade600),
                        ),
                      ],
                    ).marginOnly(bottom: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fax",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "817-404-4423",
                          style: GoogleFonts.poppins(color: Colors.grey.shade600),
                        ),
                      ],
                    ).marginOnly(bottom: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "882 Davis Street",
                          style: GoogleFonts.poppins(color: Colors.grey.shade600),
                        ),
                        Text(
                          "Athens, GA 30606",
                          style: GoogleFonts.poppins(color: Colors.grey.shade600),
                        ),
                      ],
                    ).marginOnly(bottom: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Signature",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 25),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRouteNames.addEditClinic, arguments: {"isEdit": true});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            decoration: BoxDecoration(
                              color: lightColorScheme.primary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "EDIT",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ).marginOnly(right: 20),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "DELETE CLINIC",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              if (_.selectedTab == "CLINICIAN")
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: GoogleFonts.poppins(),
                      ),
                      CupertinoButton(
                        color: lightColorScheme.primary,
                        borderRadius: BorderRadius.circular(25),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ADD CLINICIAN",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        onPressed: () => Get.toNamed(AppRouteNames.addEditClinician),
                      ).marginOnly(top: 10, bottom: 15),
                      Expanded(
                        child: ListView(
                          children: [
                            ..._.clinicianList.map(
                              (e) => GestureDetector(
                                onTap: () => Get.toNamed(AppRouteNames.clinicianDetail, arguments: e),
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
                  ),
                ),
              if (_.selectedTab == "PATIENT")
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: GoogleFonts.poppins(),
                      ),
                      CupertinoButton(
                        color: lightColorScheme.primary,
                        borderRadius: BorderRadius.circular(25),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ADD PATIENT",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        onPressed: () => Get.toNamed(AppRouteNames.addEditPatient),
                      ).marginOnly(top: 10, bottom: 15),
                      Expanded(
                        child: ListView(
                          children: [
                            ..._.patientList.map(
                              (e) => GestureDetector(
                                onTap: () => Get.toNamed(AppRouteNames.patientsDetail, arguments: e),
                                child: CardView(
                                  marginBottom: 15,
                                  title: e["title"],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
