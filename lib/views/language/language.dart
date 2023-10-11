import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/language/language_ctrl.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
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
              "CHANGE LANGUAGE",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 30,
                runSpacing: 10,
                children: [
                  ..._.languages.map(
                    (v) => GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            v["title"],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF4583b2),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CupertinoButton(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SAVE CHANGES",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onPressed: () => {},
              ).marginOnly(top: 25, bottom: 15),
            ],
          ),
        );
      },
    );
  }
}
