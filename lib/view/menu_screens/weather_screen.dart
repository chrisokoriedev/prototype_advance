import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prototype_advance/controller/weathercontroller.dart';

import 'package:prototype_advance/style/style.dart';

class WeatherApiScreen extends StatefulWidget {
  const WeatherApiScreen({Key? key}) : super(key: key);

  @override
  State<WeatherApiScreen> createState() => _WeatherApiScreenState();
}

class _WeatherApiScreenState extends State<WeatherApiScreen> {
  final WeatherApiController weatherApiController =
      Get.put(WeatherApiController());
  @override
  void initState() {
    super.initState();
    weatherApiController.onInit();
  }
  //how to use image in flutter?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => weatherApiController.isLoading.isTrue
              ? Container(
                  padding: EdgeInsets.only(top: 350.sp),
                  child: Center(
                      child: Image.asset(
                    'assets/loading.gif',
                    width: 150.w,
                  )))
              : Container(
                  padding: kDefaultPaddingII,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        padding: kDefaultPadding,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.cloud,
                                        color: whiteColor,
                                        size: 100.sp,
                                      ),
                                      Text(
                                        weatherApiController.data.value
                                            .currentObservation.condition.text,
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            weatherApiController
                                                .data.value.location.city,
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 20.sp),
                                          ),
                                          const Text(','),
                                          Text(
                                            weatherApiController
                                                .data.value.location.country,
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 20.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${weatherApiController.data.value.currentObservation.atmosphere.pressure.round()}°',
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 100.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Feels like ${weatherApiController.data.value.currentObservation.atmosphere.pressure}°',
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.h,
                        padding: kDefaultPadding,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: kBlueColor.withOpacity(0.2),
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            middleCompo(
                              'Wind',
                              '${weatherApiController.data.value.currentObservation.wind.speed}m/h',
                            ),
                            middleCompo(
                              'Humidity',
                              '${weatherApiController.data.value.currentObservation.atmosphere.humidity}km',
                            ),
                            middleCompo(
                              'Visibility',
                              '${weatherApiController.data.value.currentObservation.atmosphere.visibility}%',
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount:
                              weatherApiController.data.value.forecasts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = weatherApiController
                                .data.value.forecasts[index];
                            return SizedBox(
                              width: double.infinity,
                              height: 50.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.day),
                                  if (data.text == 'Thunderstorms')
                                    Icon(
                                      Icons.thunderstorm,
                                      color: Colors.blueGrey,
                                      size: 40.sp,
                                    )
                                  else if (data.text == 'Cloudy')
                                    Icon(
                                      Icons.cloud,
                                      color: Colors.blue,
                                      size: 40.sp,
                                    )
                                  else if (data.text == 'Partly Cloudy')
                                    Icon(
                                      Icons.sunny,
                                      color: Colors.amber,
                                      size: 40.sp,
                                    )
                                  else if (data.text == 'Mostly Cloudy')
                                    Icon(
                                      Icons.cloud_circle_sharp,
                                      color: Colors.grey,
                                      size: 40.sp,
                                    )
                                  else
                                    Container(),
                                  Text(data.code.toString())
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Column middleCompo(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600),
        ),
        Text(data,
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600))
      ],
    );
  }
}
