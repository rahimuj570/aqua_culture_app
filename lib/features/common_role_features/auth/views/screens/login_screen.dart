import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/view_models/auth_provider.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/view_models/login_provider.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/screens/forgot_password_screen.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/screens/register_screen.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/widgets/toggle_farmer_buyer_button_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/views/widgets/top_section_logo_n_title_widget.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/input_form_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer2<AuthProvider, LoginProvider>(
            builder: (context, authProvider, loginProvider, child) => Column(
              children: [
                topSectionLogoAndTitleWidget(
                  title: 'Welcome Back',
                  subtitle: 'Login to continue managing your aquaculture',
                ),
                toggleFarmerBuyerButtonWidget(context),
                SizedBox(height: 40.h),
                Form(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      SizedBox(height: 20.h),

                      inputFormFieldWidget(
                        keyboardType: TextInputType.phone,
                        prefixIcon: MdiIcons.phoneOutline,
                        title: 'Phone Number',
                        isRequired: true,
                        hintText: '+880 1757976790',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Phone number is required'
                            : null,
                        controller: phoneTEC,
                      ),
                      inputFormFieldWidget(
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: Icons.visibility_rounded,
                        onSuffixTap: () {
                          loginProvider.togglePasswordObscure();
                        },
                        isObsecure: loginProvider.isPasswordObscure,
                        title: 'Password',
                        isRequired: true,
                        hintText: '*********',
                        inputValidator: (p0) => p0 == null || p0.isEmpty
                            ? 'Password is required'
                            : null,
                        controller: passwordTEC,
                      ),
                      Align(
                        alignment: .centerEnd,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 36 - 26.h),
                filledButtonPrimary(title: 'Login', onTap: () {}),
                SizedBox(height: 12.h),
                RichText(
                  text: TextSpan(
                    text: 'New here? ',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: TextStyle(
                          color: AppColors.appThemeColor,
                          decoration: .underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
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
