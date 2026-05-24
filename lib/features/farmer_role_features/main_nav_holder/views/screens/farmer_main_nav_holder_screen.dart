import 'dart:math';

import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/farmer_role_features/main_nav_holder/view_models/farmer_main_nav_holder_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FarmerMainNavHolderScreen extends StatefulWidget {
  const FarmerMainNavHolderScreen({super.key});

  @override
  State<FarmerMainNavHolderScreen> createState() =>
      _FarmerMainNavHolderScreenState();
}

class _FarmerMainNavHolderScreenState extends State<FarmerMainNavHolderScreen>
    with SingleTickerProviderStateMixin {
  bool isMenuOpen = false;

  List<CircularMenuItemModal> circularMenuItems = [
    CircularMenuItemModal(icon: MdiIcons.fishbowlOutline, label: 'Feed Log'),
    CircularMenuItemModal(icon: MdiIcons.skullOutline, label: 'Morality Log'),
    CircularMenuItemModal(icon: MdiIcons.scaleBalance, label: 'Growth Log'),
    CircularMenuItemModal(icon: MdiIcons.cubeOutline, label: 'Harvest Log'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmerMainNavHolderProvider>(
      builder: (context, provider, child) => Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            provider.screens[provider.currentIndex],

            /// HALF CIRCLE MENU
            Positioned(
              bottom: -140.h,

              child: IgnorePointer(
                ignoring: !isMenuOpen,

                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutBack,
                  offset: isMenuOpen ? Offset.zero : const Offset(0, 2),

                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,

                      child: Container(
                        height: 350.h,
                        width: 350.w,

                        decoration: BoxDecoration(
                          color: Color(0xffc4d4e2),
                          shape: BoxShape.circle,
                        ),

                        child: Stack(
                          children: [
                            ...List.generate(4, (index) {
                              double angle = (pi / 3) * index + pi;

                              double radius = 100.r;

                              double centerX = 175.w;
                              double centerY = 175.h;

                              double x = centerX + radius * cos(angle);

                              double y = centerY + radius * sin(angle);

                              return Positioned(
                                left: x - 35.w,
                                top: y - 35.h,

                                child: menuItem(
                                  icon: circularMenuItems[index].icon,
                                  label: circularMenuItems[index].label,
                                  screenIndex: index + 4,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
          elevation: 1,
          shape: const CircleBorder(),
          backgroundColor: isMenuOpen ? AppColors.appThemeColor : Colors.white,
          foregroundColor: isMenuOpen ? Colors.white : AppColors.appThemeColor,

          onPressed: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },

          child: AnimatedRotation(
            turns: isMenuOpen ? .125 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(Icons.add),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          notchMargin: 10.r,
          shape: const CircularNotchedRectangle(),
          color: Colors.white,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomBarItem(
                iconData: CupertinoIcons.home,
                label: 'Home',
                screenIndex: 0,
                selectedIcon: MdiIcons.home,
              ),

              bottomBarItem(
                iconData: Icons.table_chart_outlined,
                label: 'Units',
                screenIndex: 1,
                selectedIcon: Icons.table_chart,
              ),

              SizedBox(width: 40.w),

              bottomBarItem(
                iconData: Icons.shopping_bag_outlined,
                label: 'Market',
                screenIndex: 2,
                selectedIcon: Icons.shopping_bag,
              ),

              bottomBarItem(
                iconData: Icons.person_outline,
                label: 'Profile',
                screenIndex: 3,
                selectedIcon: Icons.person_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBarItem({
    required IconData iconData,
    required IconData selectedIcon,
    required String label,
    required int screenIndex,
  }) {
    bool isActive =
        context.read<FarmerMainNavHolderProvider>().currentIndex == screenIndex;
    return GestureDetector(
      // splashColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      onTap: () {
        setState(() {
          isMenuOpen = false;
        });
        context.read<FarmerMainNavHolderProvider>().currentIndex = screenIndex;
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Icon(
              isActive ? selectedIcon : iconData,
              size: 25.r,
              color: isActive ? AppColors.appThemeColor : AppColors.greyText,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isActive ? .bold : .normal,
                color: isActive ? AppColors.appThemeColor : AppColors.greyText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem({
    required dynamic icon,
    required String label,
    required int screenIndex,
  }) {
    bool isActive =
        context.read<FarmerMainNavHolderProvider>().currentIndex == screenIndex;
    return Material(
      color: Colors.transparent,

      child: InkWell(
        borderRadius: BorderRadius.circular(16),

        onTap: () {
          print('index: $screenIndex');

          context.read<FarmerMainNavHolderProvider>().currentIndex =
              screenIndex;

          setState(() {
            isMenuOpen = false;
          });
        },

        child: SizedBox(
          width: 70.w,
          height: 70.h,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 25.r),

              SizedBox(height: 4.h),

              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: isActive ? .bold : .normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularMenuItemModal {
  final dynamic icon;
  final String label;

  CircularMenuItemModal({required this.icon, required this.label});
}
