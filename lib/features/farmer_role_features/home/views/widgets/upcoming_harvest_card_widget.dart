import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingHervestCardWidget extends StatelessWidget {
  final bool isLastCard;
  final int progress;
  final String species;
  final String name;
  final int day;
  const UpcomingHervestCardWidget({
    super.key,
    this.isLastCard = false,
    required this.progress,
    required this.species,
    required this.name,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Pond A',
              style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.greenLight,
                borderRadius: .circular(100.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                  vertical: 5.h,
                ),
                child: Text(
                  '$day days',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 14.sp,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        LinearProgressIndicator(
          value: 0.5,
          minHeight: 8.h,
          borderRadius: .circular(100.r),
          color: AppColors.secondaryThemeColor,
        ),
        SizedBox(height: 4.h),
        Text(
          'Tilapia',
          style: TextStyle(fontSize: 12.sp, color: AppColors.appThemeColor),
        ),
        if (isLastCard == false) SizedBox(height: 12.h),
        if (isLastCard == false) Divider(),
        if (isLastCard == false) SizedBox(height: 12.h),
      ],
    );
  }
}
