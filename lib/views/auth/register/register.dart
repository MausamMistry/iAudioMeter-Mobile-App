import 'package:iaudiometer/routes/route_name.dart';
import 'package:iaudiometer/utils/config/assets.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/views/auth/register/register_ctrl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterCtrl>(
      init: RegisterCtrl(),
      builder: (_) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 8 / 100,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              children: [
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: lightColorScheme.onPrimary,
                      ),
                    ),
                    ClipRRect(
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                  "SIGN UP",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _.txtDoctorName,
                        validator: (value) {
                          return value != null ? null : "Name is required";
                        },
                        autofocus: true,
                        maxLength: 10,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          counterText: "",
                          hintText: 'Name of Doctor',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _.txtClinicName,
                        validator: (value) {
                          return value != null ? null : "Clinic name is required";
                        },
                        autofocus: true,
                        maxLength: 10,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          counterText: "",
                          hintText: 'Clinic Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _.txtEmail,
                        validator: (value) {
                          return value != null ? null : "Email is required";
                        },
                        autofocus: true,
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          counterText: "",
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Colors.grey,
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              counterText: "",
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: const EdgeInsets.all(15),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _.toggleObs("");
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
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _.txtConfirmPassword,
                            validator: (value) {
                              return value == null
                                  ? "Confirm password is required"
                                  : value == _.txtPassword.text
                                      ? null
                                      : "Incorrect Password";
                            },
                            autofocus: true,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              counterText: "",
                              hintText: 'Confirm Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: const EdgeInsets.all(15),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _.toggleObs('confirm');
                                  },
                                  icon: _.isFalse
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
                            "(Re-enter the 6 digit password you have enter above.)",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
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
                                    "SIGN UP",
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
                          Get.toNamed(AppRouteNames.login);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
                            ).marginOnly(top: 20),
                            Text(
                              " Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: lightColorScheme.onPrimary,
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
          ),
        );
      },
    );
  }
}
