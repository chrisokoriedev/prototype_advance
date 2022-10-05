import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prototype_advance/main.dart';
import 'package:prototype_advance/style/style.dart';
import 'package:prototype_advance/view/menu_screens/alarm.dart';
import 'package:prototype_advance/view/menu_screens/fund_account.dart';
import 'package:prototype_advance/view/menu_screens/weather_screen.dart';

import 'menu_screens/transfer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final sizeMediaquery = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: kDefaultPadding,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kBlueColor),
                    child: Icon(
                      Icons.person,
                      size: 15.sp,
                      color: whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    boxHive.get('username').toString().toUpperCase(),
                    style: TextStyle(fontSize: 25.sp),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Balance',
                        style: TextStyle(color: whiteColor, fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        boxHive.get('amount') == null
                            ? '₦ 0'
                            : '₦ ${boxHive.get('amount')}',
                        style: TextStyle(color: whiteColor, fontSize: 40.sp),
                      ),
                    ]),
              ),
              SizedBox(
                height: 30.h,
              ),
              Wrap(children: [
                menuCompo(sizeMediaquery, 'Fund Account',
                    () => Get.to(const FundAccount())),
                menuCompo(sizeMediaquery, 'Transfer Funds',
                    () => Get.to(const TranferFundScreen())),
                menuCompo(sizeMediaquery, 'Weather Forcast',
                    () => Get.to(const WeatherApiScreen())),
                menuCompo(sizeMediaquery, 'Daily Alarm',
                    () => Get.to(const AlarmScreen())),
              ])
            ],
          ),
        ),
      ),
    );
  }

  menuCompo(double sizeMediaquery, String title, VoidCallback press) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        width: sizeMediaquery / 2 - 30,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: kBlueColor.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey),
        ),
      ),
    );
  }
}
