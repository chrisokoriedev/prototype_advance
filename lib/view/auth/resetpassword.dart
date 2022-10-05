import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:prototype_advance/view/auth/login.dart';

import '../../main.dart';
import '../../style/style.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Transform.rotate(
              angle: -math.pi / 1,
              child: ClipPath(
                clipper: ProsteBezierCurve(
                  position: ClipPosition.top,
                  list: [
                    BezierCurveSection(
                      start: Offset(screenWidth, 0),
                      top: Offset(screenWidth / 4 * 3, 40),
                      end: Offset(screenWidth / 2, 20),
                    ),
                    BezierCurveSection(
                      start: Offset(screenWidth / 2, 20),
                      top: Offset(screenWidth / 4, 0),
                      end: const Offset(0, 20),
                    ),
                  ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Transform.rotate(
                    angle: -math.pi / 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {});
                                boxHive.put('password', password.text);
                                Get.snackbar(
                                  'Status',
                                  "Password reset",
                                  backgroundColor: kBlueColor,
                                  colorText: whiteColor,
                                );
                                Timer(const Duration(seconds: 2), () {
                                  Get.to(const LoginScreen());
                                });
                              }
                            },
                            child: Icon(
                              FontAwesomeIcons.circleArrowLeft,
                              color: whiteColor,
                              size: 22.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(height: 50.h),
                          Text(
                            'Reset Password',
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w600,
                                color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Form(
                key: _formKey,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kBlueColor,
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: kBlueColor,
                            ),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.offAll(const LoginScreen()),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                              color: kBlueColor,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Center(
                            child: Text(
                              'Reset Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                  color: CupertinoColors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
