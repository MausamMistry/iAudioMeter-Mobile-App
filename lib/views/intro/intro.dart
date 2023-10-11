import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/intro/intro_ctrl.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 400]) {
    return Container(margin: const EdgeInsets.only(top: 50) ,width: MediaQuery.of(context).size.width, child: Image.asset(assetName, width: width));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
        init: IntroController(),
        builder: (_) {
          return IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.white,
            allowImplicitScrolling: true,
            autoScrollDuration: 3000,
            infiniteAutoScroll: true,
            globalHeader:_.currentPage == 2 ?  null :  Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRouteNames.login),
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 18, color: lightColorScheme.onPrimary),
                  ),
                ),
              ),
            ),
          ),
            onChange: (value){
              _.onPageChange(value);
            },
            pages: [
              for (int i = 0; i < _.pages.length; i++)
                PageViewModel(
                  titleWidget: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      _.pages[i]["title"],
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  bodyWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _.pages[i]["body"],
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      if (i == _.pages.length - 1)
                        CupertinoButton(
                          color: lightColorScheme.primary,
                          borderRadius: BorderRadius.circular(25),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LET'S START",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () => Get.toNamed(AppRouteNames.login),
                        ).marginOnly(top: 50, bottom: 15)
                    ],
                  ),
                  image: _buildImage(_.pages[i]["image"]).marginOnly(top: 100),
                  decoration: _.pageDecoration,
                ),
            ],
            onDone: () => {},
            onSkip: null,
            showSkipButton: false,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showDoneButton: false,
            showBackButton: false,
            showNextButton: false,
            done: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: DotsDecorator(
              size: const Size(40.0, 3),
              color: const Color(0xFFBDBDBD),
              activeColor: lightColorScheme.onPrimary,
              activeSize: const Size(30.0, 3),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
          );
        });
  }
}
