import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget filledButtonPrimary({
  required String title,
  required VoidCallback? onTap,
  IconData? prefixIcon,
  Color backgroundColor = AppColors.appThemeColor,
  Color foregroundColor = Colors.white,
}) {
  return FilledButton(
    onPressed: onTap,
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      backgroundColor: backgroundColor,
      fixedSize: Size(.maxFinite, 50.h),
    ),
    child: Row(
      mainAxisAlignment: .center,
      children: [
        if (prefixIcon != null) Icon(prefixIcon, color: foregroundColor),
        if (prefixIcon != null) SizedBox(width: 4.w),
        Text(
          title,
          style: TextStyle(color: foregroundColor, fontSize: 16.sp),
        ),
      ],
    ),
  );
}
