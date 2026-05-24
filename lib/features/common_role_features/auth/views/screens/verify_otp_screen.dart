import 'dart:async';

import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/view_models/otp_verification_provider.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/screens/set_password_screen.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/screens/verification_successful_screen.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/widgets/auth_appbar_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/widgets/top_section_logo_n_title_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({
    super.key,
    required this.phone,
    required this.isFromForgotPassword,
  });
  final String phone;
  final bool isFromForgotPassword;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  late Timer _timer;
  late OtpVerificationProvider provider;
  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel();
    provider.resetTimer();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<OtpVerificationProvider>().startTimer();
      provider = context.read<OtpVerificationProvider>();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        context.read<OtpVerificationProvider>().decrementTimer();
        if (provider.timer == 0) {
          _timer.cancel();
        }
      });
    });
    super.initState();
  }

  bool isOTPFilled = false;

  @override
  Widget build(BuildContext context) {
    String maskNumber(String input) {
      if (input.length <= 6) {
        // Not enough characters to mask
        return input;
      }

      String first = input.substring(0, 3);
      String last = input.substring(input.length - 3);
      String middle = '*' * (input.length - 6);

      return '$first$middle$last';
    }

    return Scaffold(
      appBar: AuthAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    topSectionLogoAndTitleWidget(
                      removeTopPadding: true,
                      title: 'Verify Your Account',
                      subtitle: 'We sent a code to ${maskNumber(widget.phone)}',
                    ),

                    Pinput(
                      controller: _otpController,
                      length: 5,
                      defaultPinTheme: PinTheme(
                        textStyle: TextStyle(
                          fontSize: 26.sp,
                          color: Colors.black,
                        ),
                        width: 60.w,
                        height: 77.h,
                        decoration: BoxDecoration(
                          color: Colors.black12,

                          borderRadius: BorderRadius.circular(124.r),
                        ),
                      ),
                      showCursor: true,
                      onChanged: (value) {
                        setState(() {
                          isOTPFilled = false;
                        });
                      },
                      onCompleted: (value) {
                        setState(() {
                          isOTPFilled = true;
                        });
                      },
                    ),
                    SizedBox(height: 16.h),
                    Consumer<OtpVerificationProvider>(
                      builder: (context, otpVerificationProvider, child) =>
                          RichText(
                            text: TextSpan(
                              text: 'Resend code in ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: '${otpVerificationProvider.timer}s',
                                  style: TextStyle(
                                    color: AppColors.appThemeColor,
                                    fontWeight: .bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                    SizedBox(height: 24.h),
                    Consumer<OtpVerificationProvider>(
                      builder: (context, provider, child) => RichText(
                        text: TextSpan(
                          text: 'Did not receive the code? ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Resend',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: provider.timer != 0
                                    ? Colors.grey
                                    : AppColors.appThemeColor,
                                fontWeight: .bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  if (provider.timer == 0) {
                                    context
                                        .read<OtpVerificationProvider>()
                                        .startTimer();
                                    _timer = Timer.periodic(
                                      const Duration(seconds: 1),
                                      (timer) {
                                        context
                                            .read<OtpVerificationProvider>()
                                            .decrementTimer();
                                        if (provider.timer == 0) {
                                          _timer.cancel();
                                        }
                                      },
                                    );
                                  }
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 150.h,
                left: 0,
                right: 0,
                child: filledButtonPrimary(
                  title: 'Submit',
                  onTap: isOTPFilled
                      ? () {
                          if (widget.isFromForgotPassword) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SetPasswordScreen(),
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VerificationSuccessfulScreen(),
                              ),
                            );
                          }
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
