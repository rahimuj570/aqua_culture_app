import 'package:aqua_culture_app/features/auth/views/widgets/top_section_logo_n_title_widget.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              topSectionLogoAndTitleWidget(
                title: 'Verify Your Account',
                subtitle: 'Enter the OTP sent to your phone number',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
