import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topSectionLogoAndTitle() => Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 100.h),
      Image.asset('assets/images/logo.png', height: 68, width: 68),
      SizedBox(height: 12.h),

      RichText(
        text: TextSpan(
          text: 'AquaCulture',
          style: TextStyle(
            fontSize: 28.sp,

            fontWeight: FontWeight.bold,
            color: AppColors.appThemeColor,
          ),
          children: [
            TextSpan(
              text: 'App',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryThemeColor,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20.h),
      Text(
        'Create Account',
        style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
      ),
      SizedBox(height: 4.h),
      Text(
        'Join AquaCulture to start managing your farms',
        textAlign: .center,
        style: TextStyle(color: AppColors.greyText, fontSize: 14.sp),
      ),
      SizedBox(height: 39.h),
    ],
  ),
);
