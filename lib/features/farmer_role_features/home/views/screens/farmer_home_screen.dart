import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/home_top_hero_section.dart';
import 'package:aqua_culture_app/features/farmer_role_features/common/widgets/dropdown_button_widget.dart';
import 'package:aqua_culture_app/features/farmer_role_features/common/widgets/left_bordered_rounded_status_card.dart';
import 'package:aqua_culture_app/features/farmer_role_features/home/views/widgets/recent_farm_log_card_widget.dart';
import 'package:aqua_culture_app/features/farmer_role_features/home/views/widgets/upcoming_harvest_card_widget.dart';
import 'package:aqua_culture_app/features/farmer_role_features/home/views/widgets/water_quality_status_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FarmerHomeScreen extends StatelessWidget {
  const FarmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Pond A', 'Cage 1', 'Pond B'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_hero_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                  vertical: 24.h,
                ),
                child: homeTopHeroSection(image: '', name: 'Jubayer Ahmad'),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  GridView.custom(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 2 / 1.1,
                    ),

                    childrenDelegate: SliverChildListDelegate.fixed([
                      leftBorderedRoundedStatusCard(
                        title: 'Total Farm Units',
                        subtitle: '10',
                        icon: Icons.home_filled,
                        color: AppColors.appThemeColor,
                      ),
                      leftBorderedRoundedStatusCard(
                        title: 'Active Farm units',
                        subtitle: '10',
                        icon: Icons.home_filled,
                        color: AppColors.secondaryThemeColor,
                      ),
                      leftBorderedRoundedStatusCard(
                        title: 'Active Bids',
                        subtitle: '3',
                        icon: Icons.gavel_outlined,
                        color: AppColors.secondaryThemeColor,
                      ),
                      leftBorderedRoundedStatusCard(
                        title: 'Total Aquaculture',
                        subtitle: '10',
                        icon: Icons.attach_money_outlined,
                        color: AppColors.appThemeColor,
                      ),
                    ]),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Upcoming Harvests',
                    style: TextStyle(fontSize: 18.sp, fontWeight: .w500),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          UpcomingHervestCardWidget(
                            name: 'Pond A',
                            species: 'Carp',
                            progress: 5,
                            day: 14,
                          ),
                          UpcomingHervestCardWidget(
                            name: 'Pond B',
                            species: 'Carp',
                            progress: 9,
                            day: 10,
                          ),
                          UpcomingHervestCardWidget(
                            day: 5,
                            name: 'Pond C',
                            species: 'Carp',
                            progress: 12,
                            isLastCard: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                'Water Quality Status',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: .w500,
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: dropdownButtonWidget(
                                  items: items,
                                  selectedValue: items.first,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          WaterQualityStatusCardWidget(
                            isSafe: true,
                            title: 'Temperature',
                            value: '28C',
                          ),
                          WaterQualityStatusCardWidget(
                            isSafe: true,
                            title: 'Temperature',
                            value: '28C',
                          ),
                          WaterQualityStatusCardWidget(
                            isLastCard: true,
                            isSafe: false,
                            title: 'Temperature',
                            value: '28C',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                'Recent Farm Logs',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: .w500,
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: dropdownButtonWidget(
                                  items: items,
                                  selectedValue: items.first,
                                ),
                              ),
                            ],
                          ),
                          RecentFarmLogCardWidget(),
                          RecentFarmLogCardWidget(isLastCard: true),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 160.h),
          ],
        ),
      ),
    );
  }
}
