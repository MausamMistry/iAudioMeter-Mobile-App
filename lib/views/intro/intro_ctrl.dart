import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/utils/config/assets.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroController extends GetxController {
  int currentPage = 0;
  onPageChange(int value) {
    currentPage = value;
    update();
  }
  var bodyStyle = const TextStyle(fontSize: 19.0);
  var pageDecoration = const PageDecoration(
    bodyAlignment: Alignment.topLeft,
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  List pages = [
    {
      "image": AppAsset.intro1,
      "title": "Add Clinic, Doctor, Patient",
      "body":
          "Your text will go here. It's dummy text as of now. Lorem ipsum dolor sit amet, consectet adipiscing elit. Suspendisse quis libero risus. Nulla nec mauris ante. Praesent nec lectus id metus dignissim pulvina.",
    },
    {
      "image": AppAsset.intro2,
      "title": "Record ICD-10 Details",
      "body":
          "Your text will go here. It's dummy text as of now. Lorem ipsum dolor sit amet, consectet adipiscing elit. Suspendisse quis libero risus. Nulla nec mauris ante. Praesent nec lectus id metus dignissim pulvina.",
    },
    {
      "image": AppAsset.intro3,
      "title": "Import Audio Files",
      "body": "Your text will go here. It's dummy text as of now. Lorem ipsum dolor sit amet, consectet adipiscing elit.",
    }
  ];
}
