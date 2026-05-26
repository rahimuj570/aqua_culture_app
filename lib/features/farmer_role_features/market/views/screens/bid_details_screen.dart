import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/custom_app_bar_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/farmer_role_features/market/views/widgets/bid_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidDetailsScreen extends StatelessWidget {
  const BidDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Bid Details', showTrailing: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Buyer Offers',
                style: TextStyle(fontSize: 18.sp, fontWeight: .w600),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: .all(16.r),
                decoration: BoxDecoration(
                  borderRadius: .circular(14.r),
                  color: Colors.white,
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
                            Icon(
                              Icons.circle,
                              size: 12.r,
                              color: AppColors.orange,
                            ),
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
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Volume Needed (kg) *',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: .normal,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '100kg',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: .w600,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Buyer Pickup',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Monday, June 29, 2026',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: .w600,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Total Offer',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: .normal,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '₱190/kg',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: .w600,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Buyer Pickup',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Delivery Needed',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: .w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                padding: .all(16.r),
                decoration: BoxDecoration(
                  borderRadius: .circular(14.r),
                  color: Colors.white,
                ),
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
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: .w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Wrap(
                              children: [
                                Container(
                                  padding: .symmetric(
                                    horizontal: 10.0.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.scafoldColor,
                                    borderRadius: .circular(35.r),
                                  ),
                                  child: Text('Pond'),
                                ),
                                SizedBox(width: 8.w),
                                Container(
                                  padding: .symmetric(
                                    horizontal: 10.0.w,
                                    vertical: 5.h,
                                  ),
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
                    SizedBox(height: 24.h),
                    Divider(),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Text(
                          'Species:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Tilapia',
                          style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          'Stock:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '1,358 kg',
                          style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          'Avg Weight',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '280 g',
                          style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          'Price Range',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₱180-195/kg',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .bold,
                            color: AppColors.infoText,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          'Total Offer',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₱251,230',
                          style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          'Harvest Date',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Monday, June 29, 2026',
                          style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          'Location:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Batangas City, Batangas',
                          style: TextStyle(fontSize: 14.sp, fontWeight: .bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 32.h),
                    Text(
                      'Fish & Farm Photos',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return photoCard('assets/images/fish_$index.jpg');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              filledButtonPrimary(
                title: 'Accept',
                onTap: () {},
                prefixIcon: Icons.check,
              ),
              SizedBox(height: 12.h),
              filledButtonPrimary(
                title: 'Reject',
                onTap: () {},
                prefixIcon: Icons.close,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.red,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget photoCard(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
