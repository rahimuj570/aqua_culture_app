import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/view_models/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget toggleFarmerBuyerButtonWidget(BuildContext context) {
  final AuthProvider provider = context.read<AuthProvider>();
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: .circular(100.r),
    ),
    child: Row(
      children: [
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              fixedSize: Size(.maxFinite, 50.h),
              backgroundColor: provider.getIsFarmer
                  ? AppColors.secondaryThemeColor
                  : Colors.white,
            ),
            onPressed: provider.getIsFarmer
                ? () {}
                : () {
                    provider.setIsFarmer = true;
                  },
            child: Text(
              'Farmer',
              style: TextStyle(
                fontSize: 16.sp,
                color: provider.getIsFarmer ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              fixedSize: Size(.maxFinite, 50.h),
              backgroundColor: !provider.getIsFarmer
                  ? AppColors.secondaryThemeColor
                  : Colors.white,
            ),
            onPressed: provider.getIsFarmer
                ? () {
                    provider.setIsFarmer = false;
                  }
                : () {},
            child: Text(
              'Buyer',
              style: TextStyle(
                fontSize: 16.sp,
                color: !provider.getIsFarmer ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
