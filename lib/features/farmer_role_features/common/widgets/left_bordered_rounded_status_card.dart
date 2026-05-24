import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget leftBorderedRoundedStatusCard({
  required String title,
  required String subtitle,
  required IconData icon,
  required Color color,
}) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black)],
    borderRadius: .all(Radius.circular(20.r)),
    border: Border(
      left: BorderSide(width: 6.w, color: color),
    ),
  ),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0.r),
    child: Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20.r, color: color),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: .w500,
                color: AppColors.greyText,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.5.h),
        Text(
          subtitle,
          style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
        ),
      ],
    ),
  ),
);
