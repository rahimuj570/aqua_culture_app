import 'package:aqua_culture_app/features/auth/views/screens/verify_otp_screen.dart';
import 'package:aqua_culture_app/features/auth/views/widgets/auth_appbar_widget.dart';
import 'package:aqua_culture_app/features/auth/views/widgets/top_section_logo_n_title_widget.dart';
import 'package:aqua_culture_app/features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/common/views/widgets/input_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController phoneTEC = TextEditingController();
    return Scaffold(
      appBar: AuthAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height - (kToolbarHeight + 50.h),
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Column(
                    children: [
                      topSectionLogoAndTitleWidget(
                        removeTopPadding: true,
                        title: 'Forgot Password',
                        subtitle:
                            'Don’t worry ! It happens. Please enter the phone number  we will send the OTP in this phone number .',
                      ),
                      SizedBox(height: 30.h),
                      inputFormFieldWidget(
                        keyboardType: TextInputType.phone,
                        controller: phoneTEC,
                        prefixIcon: MdiIcons.phoneOutline,
                        title: 'Phone Number',
                        isRequired: true,
                        hintText: '+880 1757976790',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Phone number is required'
                            : null,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 40.h,
                    right: 0,
                    left: 0,
                    child: filledButtonPrimary(
                      title: 'Send OTP',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyOtpScreen(
                                phone: phoneTEC.text.trim(),
                                isFromForgotPassword: true,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
