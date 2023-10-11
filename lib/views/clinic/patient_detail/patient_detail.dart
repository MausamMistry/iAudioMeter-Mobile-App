import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/patient_detail/patient_detail_ctrl.dart';

class PatientDetail extends StatefulWidget {
  const PatientDetail({super.key});

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientDetailController>(
      init: PatientDetailController(),
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
              "PATIENT DETAILS",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            children: [
              Column(
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
                  CupertinoButton(
                    color: lightColorScheme.primary,
                    borderRadius: BorderRadius.circular(25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "RECORD ICD-10 DETAILS",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onPressed: () => Get.toNamed(AppRouteNames.recordICD),
                  ).marginOnly(top: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email ID",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "emailId@gmail.com",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25, top: 30),
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
                            "513-983-0223",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Insurance Company Name",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Company name here",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date of Birth",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "25 April, 1985",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Male",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "City",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Los Angeles",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zipcode",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "90048",
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
                            "2450 West Virginia Avenue\nWillisboro, NR 12996",
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          ),
                        ],
                      ).marginOnly(bottom: 25),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRouteNames.addEditPatient, arguments: {"isEdit": true});
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
                              "DELETE PATIENT",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ).marginOnly(bottom: 25)
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
            ],
          ),
        );
      },
    );
  }
}
