import 'package:aqua_culture_app/app/constants/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterQualityStatusCardWidget extends StatelessWidget {
  final bool isLastCard;
  final bool isSafe;
  final String title;
  final String value;
  const WaterQualityStatusCardWidget({
    super.key,
    this.isLastCard = false,
    required this.isSafe,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              isSafe ? Icons.check_circle_outline : Icons.warning_amber_rounded,
              size: 24.r,
              color: isSafe ? AppColors.green : AppColors.orange,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: .w500),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(
                color: isSafe ? AppColors.green : AppColors.orange,
                fontSize: 18.sp,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
        if (!isLastCard) SizedBox(height: 18.h),
        if (!isLastCard) Divider(),
        if (!isLastCard) SizedBox(height: 20.h),
      ],
    );
  }
}
