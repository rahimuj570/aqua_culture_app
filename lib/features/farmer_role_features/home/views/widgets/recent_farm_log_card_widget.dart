import 'package:aqua_culture_app/app/constants/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentFarmLogCardWidget extends StatelessWidget {
  final isLastCard;
  const RecentFarmLogCardWidget({super.key, this.isLastCard = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 27.5.h),
        Row(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.balance_rounded, size: 24.r),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Growth Log',
                  style: TextStyle(fontSize: 16.sp, fontWeight: .w500),
                ),
                Text(
                  'Pond A',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: .w400,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text('1 day ago', style: TextStyle(fontSize: 12.sp)),
          ],
        ),
        if (!isLastCard) SizedBox(height: 10.h),
        if (!isLastCard) Divider(),
        if (!isLastCard) SizedBox(height: 4.h),
      ],
    );
  }
}
