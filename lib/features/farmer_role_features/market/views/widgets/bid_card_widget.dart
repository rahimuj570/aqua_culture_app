import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bidCardWidget() {
  return Container(
    padding: .all(16.r),
    decoration: BoxDecoration(
      borderRadius: .circular(14.r),
      color: AppColors.scafoldColor,
    ),
    child: Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          crossAxisAlignment: .start,
          children: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.secondaryThemeColor,
                borderRadius: .circular(100.r),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Jubayer Ahmad',
              style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.circle, size: 12.r, color: AppColors.orange),
                SizedBox(width: 8.w),
                Text(
                  'Pending',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: .w600,
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Volume Needed (kg) *',
                  style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                ),
                SizedBox(height: 4.h),
                Text(
                  '100kg',
                  style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                ),
              ],
            ),
            SizedBox(width: 25.w),
            Column(
              children: [
                Text(
                  'Total Offer',
                  style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                ),
                SizedBox(height: 4.h),
                Text(
                  '₱190/kg',
                  style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Text('Buyer Pickup', style: TextStyle(fontSize: 12.sp)),
        SizedBox(height: 4.h),
        Text(
          'Monday, June 29, 2026',
          style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: filledButtonPrimary(
                title: 'View',
                onTap: () {},
                prefixIcon: Icons.remove_red_eye_outlined,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.appThemeColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: filledButtonPrimary(
                title: 'Accept',
                onTap: () {},
                prefixIcon: Icons.check,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
