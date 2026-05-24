import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget filledButtonSecondary({
  required String title,
  required VoidCallback onTap,
}) {
  return FilledButton(
    onPressed: onTap,
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      backgroundColor: Color(0xffE2E8F0),
      fixedSize: Size(.maxFinite, 50.h),
    ),
    child: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 16.sp),
    ),
  );
}
