import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/farmer_role_features/common/widgets/left_bordered_rounded_status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitScreen extends StatelessWidget {
  const UnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Farm Units',
                        style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Manage your ponds, cages, tanks, and fish pens',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(height: 27.h),
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
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: .none,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              labelText: 'Search by Unit name',
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.appThemeColor,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text('All Units', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 12.h),
                  UnitDetailsCardWidget(),
                  SizedBox(height: 12.h),
                  UnitDetailsCardWidget(),
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

class UnitDetailsCardWidget extends StatelessWidget {
  const UnitDetailsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                  child: ClipRRect(
                    borderRadius: .circular(100.r),
                    child: Image.network(
                      'assets/images/pond.png',
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error_outline_sharp),
                    ),
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
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: .circular(100.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0.w,
                              vertical: 5.h,
                            ),
                            child: Text(
                              'Pond',
                              style: TextStyle(
                                color: AppColors.greyText,
                                fontSize: 14.sp,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.infoLight,
                            borderRadius: .circular(100.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0.w,
                              vertical: 5.h,
                            ),
                            child: Text(
                              '2 Fish',
                              style: TextStyle(
                                color: AppColors.appThemeColor,
                                fontSize: 14.sp,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
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
                    child: Row(
                      children: [
                        Icon(Icons.circle, color: AppColors.green, size: 10.r),
                        SizedBox(width: 4.w),
                        Text(
                          'Active',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 14.sp,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      'Species',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Tilapia',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Avg Weight',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '500g',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Area',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '500 m²',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Days',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '70',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
                SizedBox(width: 100.w),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Fish Stock',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '5,000',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'FCR',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '1.5',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Depth',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '1.5 m',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Harvest Date',
                      style: TextStyle(fontSize: 12.sp, fontWeight: .normal),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '6/29/2026',
                      style: TextStyle(fontSize: 14.sp, fontWeight: .w600),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: AppColors.greyText),
                SizedBox(width: 4.w),
                Text(
                  '43 A, Mohakhali, Dhaka',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyText,
                    fontWeight: .normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: filledButtonPrimary(
                    prefixIcon: MdiIcons.deleteOutline,
                    backgroundColor: AppColors.redLight,
                    foregroundColor: AppColors.red,
                    title: 'Delete',
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: filledButtonPrimary(
                    prefixIcon: MdiIcons.noteEditOutline,
                    title: 'Edit',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
