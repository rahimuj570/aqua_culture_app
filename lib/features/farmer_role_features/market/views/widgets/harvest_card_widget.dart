import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/farmer_role_features/market/views/widgets/bid_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget harvestCardWidget(BuildContext context) => Container(
  padding: .all(20.r),
  decoration: BoxDecoration(color: Colors.white, borderRadius: .circular(14.r)),
  child: Column(
    crossAxisAlignment: .start,
    children: [
      Row(
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
              color: AppColors.greenLight,
              borderRadius: .circular(100.r),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Pond A-1',
                style: TextStyle(fontSize: 16.sp, fontWeight: .w600),
              ),
              SizedBox(height: 8.h),
              Wrap(
                children: [
                  Container(
                    padding: .symmetric(horizontal: 10.0.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.scafoldColor,
                      borderRadius: .circular(35.r),
                    ),
                    child: Text('Pond'),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: .symmetric(horizontal: 10.0.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.infoLight,
                      borderRadius: .circular(35.r),
                    ),
                    child: Text(
                      'Pond',
                      style: TextStyle(color: AppColors.infoText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 20.h),
      Row(
        crossAxisAlignment: .center,
        children: [
          Text(
            'Tilapia',
            style: TextStyle(fontSize: 14.sp, fontWeight: .normal),
          ),
          SizedBox(width: 16.w),
          Icon(Icons.circle, size: 8.r),
          SizedBox(width: 16.w),
          Text(
            '1,358 kg total',
            style: TextStyle(fontSize: 14.sp, fontWeight: .normal),
          ),
          SizedBox(width: 16.w),
          Icon(Icons.circle, size: 8.r),
          SizedBox(width: 16.w),
          Text(
            'Avg 280g',
            style: TextStyle(fontSize: 14.sp, fontWeight: .normal),
          ),
        ],
      ),
      SizedBox(height: 20.h),
      Divider(),
      SizedBox(height: 12.h),
      Row(
        children: [
          Text(
            'Bids Received (2)',
            style: TextStyle(fontSize: 14.sp, fontWeight: .normal),
          ),
          Spacer(),
          Text(
            'Highest: ₱190/kg',
            style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
          ),
        ],
      ),
      SizedBox(height: 12.h),
      Divider(),
      SizedBox(height: 12.h),
      Row(
        children: [
          Text(
            'Harvest Date',
            style: TextStyle(fontSize: 14.sp, fontWeight: .normal),
          ),
          Spacer(),
          Text(
            'Monday, June 29, 2026',
            style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
          ),
        ],
      ),
      SizedBox(height: 12.h),
      Divider(),
      SizedBox(height: 12.h),
      Row(
        children: [
          Icon(Icons.location_on_outlined, size: 24.r),
          SizedBox(width: 8.w),
          Text('43 A, Mohakhali, Dhaka', style: TextStyle(fontSize: 14.sp)),
        ],
      ),
      SizedBox(height: 13.h),
      bidCardWidget(context),
    ],
  ),
);
