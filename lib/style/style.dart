import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const blackColor=Colors.black;
const whiteColor=Colors.white;
const kBlueColor=Color(0xFF053891);
final kDefaultPadding=EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h);
final kDefaultPaddingII=EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h);
OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)));
}