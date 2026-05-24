import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/auth/view_models/auth_provider.dart';
import 'package:aqua_culture_app/features/auth/view_models/register_provider.dart';
import 'package:aqua_culture_app/features/auth/views/screens/login_screen.dart';
import 'package:aqua_culture_app/features/auth/views/widgets/toggle_farmer_buyer_button_widget.dart';
import 'package:aqua_culture_app/features/auth/views/widgets/top_section_logo_n_title_widget.dart';
import 'package:aqua_culture_app/features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/common/views/widgets/input_form_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameTEC = TextEditingController();
  TextEditingController phoneTEC = TextEditingController();
  TextEditingController locationTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController confirmPasswordTEC = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameTEC.dispose();
    phoneTEC.dispose();
    locationTEC.dispose();
    passwordTEC.dispose();
    confirmPasswordTEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer2<AuthProvider, RegisterProvider>(
            builder: (context, authProvider, registerProvider, child) => Column(
              children: [
                topSectionLogoAndTitleWidget(),
                toggleFarmerBuyerButtonWidget(context),
                SizedBox(height: 40.h),
                Form(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      SizedBox(height: 20.h),
                      inputFormFieldWidget(
                        title: 'Full Name',
                        isRequired: true,
                        hintText: 'John Doe',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Full name is required'
                            : null,
                        controller: nameTEC,
                      ),
                      inputFormFieldWidget(
                        prefixIcon: MdiIcons.phoneOutline,
                        title: 'Phone Number',
                        isRequired: true,
                        hintText: '+880 1757976790',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Phone number is required'
                            : null,
                        controller: phoneTEC,
                      ),
                      if (authProvider.getIsFarmer)
                        inputFormFieldWidget(
                          prefixIcon: MdiIcons.mapMarkerOutline,
                          suffixIcon: MdiIcons.mapLegend,
                          onSuffixTap: () {},
                          title: 'Farm Location',
                          isRequired: true,
                          hintText: '43 A, Mohakhali, Dhaka',
                          inputValidator: (p0) => p0 == null || p0.isEmpty
                              ? 'Farm location is required'
                              : null,
                          controller: locationTEC,
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: inputFormFieldWidget(
                              suffixIcon: Icons.visibility_rounded,
                              onSuffixTap: () {
                                registerProvider.togglePasswordObscure();
                              },
                              isObsecure: registerProvider.isPasswordObscure,
                              title: 'Password',
                              isRequired: true,
                              hintText: '*********',
                              inputValidator: (p0) => p0 == null || p0.isEmpty
                                  ? 'Password is required'
                                  : null,
                              controller: passwordTEC,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: inputFormFieldWidget(
                              isObsecure:
                                  registerProvider.isConfirmPasswordObscure,
                              suffixIcon: Icons.visibility_rounded,
                              onSuffixTap: () {
                                registerProvider.toggleConfirmPasswordObscure();
                              },
                              title: 'Confirm Password',
                              isRequired: true,
                              hintText: '********',
                              inputValidator: (p0) {
                                return p0 == null || p0.isEmpty
                                    ? 'Cannot be empty'
                                    : p0 != passwordTEC.text
                                    ? 'Password does not match'
                                    : null;
                              },
                              controller: confirmPasswordTEC,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36 - 20.h),

                Row(
                  children: [
                    Checkbox(
                      value: registerProvider.isTermsAccepted,
                      onChanged: (value) {
                        registerProvider.toggleTermsAccepted();
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: AppColors.appThemeColor,
                              decoration: .underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: AppColors.appThemeColor,
                              decoration: .underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                filledButtonPrimary(
                  title: 'Register',
                  onTap: registerProvider.isTermsAccepted ? () {} : null,
                ),
                SizedBox(height: 12.h),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: AppColors.appThemeColor,
                          decoration: .underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
