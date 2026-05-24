import 'package:aqua_culture_app/features/auth/view_models/set_password_provider.dart';
import 'package:aqua_culture_app/features/auth/views/screens/verification_successful_screen.dart';
import 'package:aqua_culture_app/features/auth/views/widgets/auth_appbar_widget.dart';
import 'package:aqua_culture_app/features/auth/views/widgets/top_section_logo_n_title_widget.dart';
import 'package:aqua_culture_app/features/common/views/widgets/filled_button_primary.dart';
import 'package:aqua_culture_app/features/common/views/widgets/input_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController confirmPasswordTEC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    passwordTEC.dispose();
    confirmPasswordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Consumer<SetPasswordProvider>(
            builder: (context, setPasswordProvider, child) => Stack(
              children: [
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      (kToolbarHeight + 50.h),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        topSectionLogoAndTitleWidget(
                          removeTopPadding: true,
                          title: 'Set Your Password',
                          subtitle:
                              'In order to keep your account safe you need to create a strong password.',
                        ),
                        inputFormFieldWidget(
                          suffixIcon: Icons.visibility_rounded,
                          prefixIcon: Icons.lock_outline_rounded,
                          onSuffixTap: () {
                            setPasswordProvider.setIsPasswordObsecure =
                                !setPasswordProvider.isPasswordObsecure;
                          },
                          isObsecure: setPasswordProvider.isPasswordObsecure,
                          title: 'Password',
                          isRequired: true,
                          hintText: '********',
                          inputValidator: (p0) => p0 == null || p0.isEmpty
                              ? 'Password is required'
                              : null,
                          controller: passwordTEC,
                        ),
                        inputFormFieldWidget(
                          suffixIcon: Icons.visibility_rounded,
                          prefixIcon: Icons.lock_outline_rounded,
                          onSuffixTap: () {
                            setPasswordProvider.setIsConfirmPasswordObsecure =
                                !setPasswordProvider.isConfirmPasswordObsecure;
                          },
                          isObsecure:
                              setPasswordProvider.isConfirmPasswordObsecure,
                          title: 'Confirm Password',
                          isRequired: true,
                          hintText: '********',
                          inputValidator: (p0) => p0 == null || p0.isEmpty
                              ? 'Confirm Password is required'
                              : p0 != passwordTEC.text
                              ? 'Password does not match'
                              : null,
                          controller: confirmPasswordTEC,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: filledButtonPrimary(
                    title: 'Confirm',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VerificationSuccessfulScreen(),
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
    );
  }
}
