import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iaudiometer/utils/theme/light.dart';
import 'package:iaudiometer/views/auth/change_password/change_password_ctrl.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'passwordScreen');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordCtrl>(
      init: ChangePasswordCtrl(),
      builder: (_) {
        return Scaffold(
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
              "CHANGE PASSWORD",
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
                left: 20,
                right: 20,
                bottom: 10,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _.txtEmail,
                          validator: (value) {
                            return value != null ? null : "Old password is required";
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
                            hintText: 'Old Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            counterText: "",
                            hintText: 'New Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            counterText: "",
                            hintText: 'Confirm New Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.all(15),
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
