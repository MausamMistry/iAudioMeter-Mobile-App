import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/clinic/record_icd_detail/record_icd_detail_ctrl.dart';

class RecordICDDetail extends StatefulWidget {
  const RecordICDDetail({super.key});

  @override
  State<RecordICDDetail> createState() => _RecordICDDetailState();
}

class _RecordICDDetailState extends State<RecordICDDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordICDDetailController>(
      init: RecordICDDetailController(),
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
              "RECORD ICD-10 DETAILS",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: BoxDecoration(
                        color: lightColorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "SAVE DETAILS",
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
                      "CLEAR ALL",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ).marginOnly(bottom: 20, top: 10),
              for (int i = 0; i < _.records.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _.records[i]["isActive"] = !_.records[i]["isActive"];
                        _.update();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _.records[i]["title"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: _.records[i]["isActive"] ? lightColorScheme.onPrimary : Colors.black,
                                ),
                              ),
                            ),
                            Icon(
                              _.records[i]["isActive"] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: _.records[i]["isActive"] ? lightColorScheme.onPrimary : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_.records[i]["isActive"])
                      for (int j = 0; j < _.records[i]["subMenu"].length; j++)
                        GestureDetector(
                          onTap: () {
                            _.records[i]["subMenu"][j]["isSelected"] = !_.records[i]["subMenu"][j]["isSelected"];
                            _.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 5),
                            decoration: BoxDecoration(
                              color: j % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _.records[i]["subMenu"][j]["title"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "Favourites: ${_.records[i]["subMenu"][j]["favorties"]}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: _.records[i]["subMenu"][j]["isSelected"] ? lightColorScheme.onPrimary : Colors.grey,
                                ).paddingSymmetric(horizontal: 10),
                              ],
                            ),
                          ),
                        )
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
