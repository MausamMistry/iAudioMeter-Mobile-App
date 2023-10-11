import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/add_clinic/add_clinic_ctrl.dart';
import 'package:iaudiometer/widgets/common_textbox.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddEditClinic extends StatefulWidget {
  const AddEditClinic({super.key});

  @override
  State<AddEditClinic> createState() => _AddEditClinicState();
}

class _AddEditClinicState extends State<AddEditClinic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditClinicController>(
      init: AddEditClinicController(),
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
              _.args != null && _.args["isEdit"] ? "EDIT CLINIC" : "ADD CLINIC",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFFE2E2E2),
                        child: Icon(
                          LucideIcons.camera,
                          color: Colors.grey.shade400,
                          size: 40,
                        ),
                      ).marginOnly(bottom: 5),
                      Positioned(
                        right: 4.0,
                        bottom: 10.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: lightColorScheme.onPrimary,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    _.args != null && _.args["isEdit"] ? "Update Logo" :"Upload Logo",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  )
                ],
              ).marginOnly(top: 20, bottom: 30),
              CommonTextBox(
                controller: _.txtClinicName,
                labelText: "Clinic Name",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtWebsite,
                labelText: "Website",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtPhoneNumber,
                labelText: "Phone Number",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtFax,
                labelText: "Fax",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              CommonTextBox(
                controller: _.txtAddress,
                labelText: "Address",
                textStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
              ).marginOnly(bottom: 15),
              Text(
                _.args != null && _.args["isEdit"] ? "Edit Signature": "Add Signature",
                style: GoogleFonts.poppins(fontSize: 16),
              ).marginOnly(bottom: 5),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Center(
                  child: Text(
                    "Click here to add",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              CupertinoButton(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _.args != null && _.args["isEdit"] ? "SAVE CHANGES":"ADD CLINIC",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                onPressed: () async => await _.saveClinic(),
              ).marginOnly(top: 15, bottom: 15),
            ],
          ),
        );
      },
    );
  }
}
