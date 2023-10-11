import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/utils/config/assets.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/audio/audio_file_ctrl.dart';

class ImportAudioFile extends StatefulWidget {
  const ImportAudioFile({super.key});

  @override
  State<ImportAudioFile> createState() => _ImportAudioFileState();
}

class _ImportAudioFileState extends State<ImportAudioFile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImportAudioFileController>(
      init: ImportAudioFileController(),
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
              "IMPORT AUDIO FILE",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              CupertinoButton(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "UPLOAD AUDIO FILE",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onPressed: () => {},
              ).marginOnly(top: 20, bottom: 30),
              for (int i = 0; i < 10; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFF3abfc8),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                            ).marginOnly(right: 10),
                            const Expanded(
                              child: Text(
                                "Audio file name",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        AppAsset.delete,
                        height: 30,
                      ).marginOnly(right: 10),
                      // const Icon(
                      //   Icons.delete_outline,
                      //   color: Color(0xFF3abfc8),
                      //   size: 25,
                      // ).marginOnly(right: 10)
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
