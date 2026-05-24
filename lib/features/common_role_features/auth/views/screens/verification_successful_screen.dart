import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/screens/login_screen.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationSuccessfulScreen extends StatelessWidget {
  const VerificationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(32.0.r),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset('assets/images/successful_icon.png'),
                    SizedBox(height: 32.h),
                    Text(
                      'Successful',
                      style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Congratulations! Your password has been successfully updated. Click Continue to login',
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: filledButtonPrimary(
                    title: 'Back to Login',
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
