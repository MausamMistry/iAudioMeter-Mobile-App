import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/auth/profile/profile_ctrl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'profileScreen');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCtrl>(
      init: ProfileCtrl(),
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
              "EDIT PROFILE",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 2 / 100,
                bottom: 10,
              ),
              children: [
                Container(
                  height: 120,
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .35,
                          height: MediaQuery.of(context).size.height * .16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/userProfile.png",
                              ),
                              // fit: BoxFit.fill
                            ),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 7.0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 6.0,
                        bottom: 13.0,
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _.txtEmail,
                                validator: (value) {
                                  return value != null ? null : "Is required";
                                },
                                autofocus: true,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  counterText: "",
                                  hintText: 'Maria',
                                  hintStyle: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _.txtPassword,
                                autofocus: true,
                                maxLength: 6,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  counterText: "",
                                  hintText: 'Bedollo',
                                  hintStyle: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _.txtConfirmPassword,
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            counterText: "",
                            hintText: 'Ear Care Clinic',
                            hintStyle: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w400),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "maria@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black,
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
                                      "SAVE CHANGES",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
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
