import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/config/assets.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/auth/login/login_ctrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginCtrl>(
      init: LoginCtrl(),
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Stack(
              children: [
                Image.asset(
                  AppAsset.loginBackground,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  colorBlendMode: BlendMode.screen,
                  fit: BoxFit.cover,
                ),
                ListView(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 5 / 100,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  children: [
                    const SizedBox(height: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRouteNames.language),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: lightColorScheme.primary,
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AppAsset.eng,
                                    height: 30,
                                    width: 30,
                                    colorBlendMode: BlendMode.screen,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text(
                                    "ENG",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Image.asset(
                          AppAsset.loginLogo,
                          height: 100,
                          width: 100,
                          colorBlendMode: BlendMode.screen,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "LOGIN",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _.txtEmail,
                            validator: (value) {
                              return value != null ? null : "Email is required";
                            },
                            autofocus: true,
                            maxLength: 10,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              counterText: "",
                              hintText: 'Email ID',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _.txtPassword,
                                validator: (value) {
                                  String str = value!.trim();
                                  return str.length == 6 ? null : "Password must be 6 digit";
                                },
                                autofocus: true,
                                maxLength: 6,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  counterText: "",
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _.toggleObs();
                                      },
                                      icon: _.isTrue
                                          ? Icon(
                                              Icons.visibility,
                                              color: lightColorScheme.onPrimary,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: lightColorScheme.onPrimary,
                                            )),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "(6 digit password for ex. 345621)",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              _showBottomSheet(context, _.txtEmail);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CupertinoButton(
                            borderRadius: BorderRadius.circular(30),
                            color: lightColorScheme.primary,
                            onPressed: !_.isLoading ? () => _.onContinue() : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _.isLoading
                                    ? const SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(strokeWidth: 2),
                                      )
                                    : const Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRouteNames.register);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "New to iaudiometer?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ).marginOnly(top: 20),
                                const Text(
                                  " Sign up",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).marginOnly(top: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context, TextEditingController txtEmail) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Add SingleChildScrollView here
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  height: 5,
                  width: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: lightColorScheme.primaryContainer,
                    fontSize: 20,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Enter your email and we'll send you a link to reset your password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextFormField(
                  controller: txtEmail,
                  validator: (value) {
                    return value != null ? null : "Email is required";
                  },
                  maxLength: 10,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    counterText: "",
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: lightColorScheme.primary,
                  ),
                  child: const CupertinoButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SEND",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
