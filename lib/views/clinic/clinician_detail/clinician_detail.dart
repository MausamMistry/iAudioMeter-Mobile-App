import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/clinician_detail/clinician_detail_ctrl.dart';

class ClinicianDetail extends StatefulWidget {
  const ClinicianDetail({super.key});

  @override
  State<ClinicianDetail> createState() => _ClinicianDetailState();
}

class _ClinicianDetailState extends State<ClinicianDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClinicianDetailController>(
      init: ClinicianDetailController(),
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
              "CLINICIAN DETAILS",
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
                        "catalystclinic@gmail.com",
                        style: GoogleFonts.poppins(color: Colors.grey.shade600),
                      ),
                    ],
                  ).marginOnly(bottom: 25, top: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Certificate Name",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Name here",
                        style: GoogleFonts.poppins(color: Colors.grey.shade600),
                      ),
                    ],
                  ).marginOnly(bottom: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Degree Name",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "PhD - Research",
                        style: GoogleFonts.poppins(color: Colors.grey.shade600),
                      ),
                    ],
                  ).marginOnly(bottom: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PCP",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Option-1",
                        style: GoogleFonts.poppins(color: Colors.grey.shade600),
                      ),
                    ],
                  ).marginOnly(bottom: 25),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRouteNames.addEditClinician, arguments: {"isEdit": true});
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
                          "DELETE CLINICIAN",
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
            ],
          ).paddingSymmetric(horizontal: 20),
        );
      },
    );
  }
}
