import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/auth/views/screens/login_screen.dart';
import 'package:aqua_culture_app/features/auth/views/screens/register_screen.dart';
import 'package:aqua_culture_app/features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/common/views/widgets/filled_button_secondary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/welcome_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                Image.asset('assets/images/logo.png', height: 100, width: 100),
                SizedBox(height: 12.h),

                RichText(
                  text: TextSpan(
                    text: 'AquaCulture',
                    style: TextStyle(
                      fontSize: 28.sp,

                      fontWeight: FontWeight.bold,
                      color: AppColors.appThemeColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'App',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryThemeColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23.5.h),
                Text(
                  'Manage your fish farms, track growth, get AI insights, and connect with buyers — all in one platform.',
                  textAlign: .center,
                  style: TextStyle(color: AppColors.greyText),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 130.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              children: [
                filledButtonPrimary(
                  title: 'Get Started',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                filledButtonSecondary(
                  title: 'Login',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
