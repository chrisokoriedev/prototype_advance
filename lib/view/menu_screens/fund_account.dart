import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prototype_advance/style/style.dart';
import 'package:prototype_advance/view/dashboard.dart';

import '../../main.dart';

class FundAccount extends StatefulWidget {
  const FundAccount({Key? key}) : super(key: key);

  @override
  State<FundAccount> createState() => _FundAccountState();
}

class _FundAccountState extends State<FundAccount> {
  TextEditingController fundMoney = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: kDefaultPaddingII,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Fund Account',
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: fundMoney,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Amount is required.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(prefix: Text('₦')),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    var amount = boxHive.get('amount');
                    if (_formKey.currentState!.validate()) {
                      setState(() {});
                      if (amount != null) {
                        var newFund = amount + int.parse(fundMoney.text);
                        boxHive.put('amount', newFund);
                        Get.snackbar(
                          'Status',
                          "Account Funded Successfully..",
                          backgroundColor: kBlueColor,
                          colorText: whiteColor,
                        );
                      } else {
                        boxHive.put('amount', fundMoney.text);
                        Get.snackbar(
                          'Status',
                          "Account Funded Successfully",
                          backgroundColor: kBlueColor,
                          colorText: whiteColor,
                        );
                      }
                      Timer(const Duration(seconds: 2), () {
                        Get.offAll(const DashBoard());
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Center(
                      child: Text(
                        'Fund Money',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: whiteColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
