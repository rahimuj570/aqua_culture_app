import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/farmer_role_features/market/view_models/market_provider.dart';
import 'package:aqua_culture_app/features/farmer_role_features/market/views/widgets/harvest_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer<MarketProvider>(
              builder: (context, provider, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Pre-Harvest Marketplace',
                    style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Receive and manage bids for your upcoming harvests',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.greyText,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
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
                              backgroundColor: provider.getIsActiveTabSelected
                                  ? AppColors.secondaryThemeColor
                                  : Colors.white,
                            ),
                            onPressed: provider.getIsActiveTabSelected
                                ? () {}
                                : () {
                                    provider.setIsActiveTabSelected = true;
                                  },
                            child: Text(
                              'Active Listings (2)',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: provider.getIsActiveTabSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              fixedSize: Size(.maxFinite, 50.h),
                              backgroundColor: !provider.getIsActiveTabSelected
                                  ? AppColors.secondaryThemeColor
                                  : Colors.white,
                            ),
                            onPressed: provider.getIsActiveTabSelected
                                ? () {
                                    provider.setIsActiveTabSelected = false;
                                  }
                                : () {},
                            child: Text(
                              'Completed Sales (0)',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: !provider.getIsActiveTabSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21.h),
                  harvestCardWidget(context),
                  SizedBox(height: 16.h),
                  harvestCardWidget(context),

                  SizedBox(height: 160.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
