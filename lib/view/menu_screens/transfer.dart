import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prototype_advance/style/style.dart';
import '../../main.dart';
import '../dashboard.dart';

class TranferFundScreen extends StatefulWidget {
  const TranferFundScreen({Key? key}) : super(key: key);

  @override
  State<TranferFundScreen> createState() => _TranferFundScreenState();
}

class _TranferFundScreenState extends State<TranferFundScreen> {
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
                      'Transfer Funds',
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120.h,
                ),
                const Text('Enter Account Number'),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Account number is required.';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(prefixIcon:  Icon(Icons.account_balance)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text('Enter Amount to tranfer'),
                SizedBox(
                  height: 10.h,
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
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.money),
                    )),
                SizedBox(
                  height: 30.h,
                ),
                const Text('Enter Pin'),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'pin is required.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.pin)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    int amount = boxHive.get('amount');
                    int fundInput = int.parse(fundMoney.text);
                    if (_formKey.currentState!.validate()) {
                      setState(() {});
                      if (amount == null) {
                        Get.snackbar(
                          'Status',
                          "Insufficient funds,\n pls fund the account..",
                          backgroundColor: kBlueColor,
                          colorText: whiteColor,
                        );
                      }
                     else if (fundInput > amount) {
                        Get.snackbar(
                          'Status',
                          "Insufficient funds,\n pls fund the account..",
                          backgroundColor: kBlueColor,
                          colorText: whiteColor,
                        );
                      } else {
                        var totalAmount = amount - fundInput;
                        boxHive.put('amount', totalAmount);
                        Get.snackbar(
                          'Status',
                          "Tranfer Successfully",
                          backgroundColor: kBlueColor,
                          colorText: whiteColor,
                        );
                        Timer(const Duration(seconds: 2), () {
                          Get.offAll(const DashBoard());
                        });
                      }
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
