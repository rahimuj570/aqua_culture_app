import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget filledButtonPrimary({
  required String title,
  required VoidCallback onTap,
}) {
  return FilledButton(
    onPressed: onTap,
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      backgroundColor: AppColors.appThemeColor,
      fixedSize: Size(.maxFinite, 50.h),
    ),
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16.sp),
    ),
  );
}
