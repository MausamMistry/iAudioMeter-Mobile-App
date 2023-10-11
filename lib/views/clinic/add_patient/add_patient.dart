import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/add_patient/add_patient_ctrl.dart';
import 'package:iaudiometer/widgets/common_textbox.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddEditPatient extends StatefulWidget {
  const AddEditPatient({super.key});

  @override
  State<AddEditPatient> createState() => _AddEditPatientState();
}

class _AddEditPatientState extends State<AddEditPatient> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditPatientController>(
      init: AddEditPatientController(),
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
            title: Text(
              _.args != null && _.args["isEdit"]
                  ? "EDIT PATIENT"
                  : "ADD PATIENT",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFFE2E2E2),
                        child: Icon(
                          LucideIcons.user2,
                          color: Colors.grey.shade400,
                          size: 60,
                        ),
                      ).marginOnly(bottom: 5),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: lightColorScheme.onPrimary,
                          child: const Icon(
                            LucideIcons.camera,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ).marginOnly(top: 20, bottom: 30),
                ],
              ),
              CommonTextBox(
                controller: _.txtClinicianName,
                labelText: "Patient Name",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              if (_.args != null && _.args["isEdit"] == true)
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "emailId@gmail.com",
                      style: GoogleFonts.poppins(color: Colors.grey.shade600),
                    ),
                  ],
                ).marginOnly(bottom: 15),
              if (_.args == null)
                CommonTextBox(
                  controller: _.txtEmail,
                  labelText: "Email ID",
                  textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
                ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtCertificateName,
                labelText: "Phone Number",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtDegreeName,
                labelText: "Insurance Company Name",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              Container(
                height: 55,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date of Birth",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                    Text(
                      "DD/MM/YYYY",
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ).marginOnly(bottom: 15),
              const Text("Gender").marginOnly(bottom: 10),
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFFE2E2E2),
                        child: SizedBox(
                          height: 5,
                          width: 5,
                        ),
                      ).marginOnly(right: 5),
                      const Text("Male")
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFFE2E2E2),
                        child: SizedBox(
                          height: 5,
                          width: 5,
                        ),
                      ).marginOnly(right: 5),
                      const Text("Female")
                    ],
                  )
                ],
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtDegreeName,
                labelText: "City",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtDegreeName,
                labelText: "Zipcode",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtDegreeName,
                labelText: "Address",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CupertinoButton(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _.args != null && _.args["isEdit"]
                          ? "SAVE CHANGES"
                          : "ADD PATIENT",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                onPressed: () async => {},
              ).marginOnly(top: 15, bottom: 15),
            ],
          ),
        );
      },
    );
  }
}
