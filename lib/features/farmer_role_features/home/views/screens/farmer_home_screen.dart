import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/home_top_hero_section.dart';
import 'package:aqua_culture_app/features/farmer_role_features/common/widgets/left_bordered_rounded_status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FarmerHomeScreen extends StatelessWidget {
  const FarmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_hero_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 24.h),
              child: homeTopHeroSection(image: '', name: 'Jubayer Ahmad'),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
