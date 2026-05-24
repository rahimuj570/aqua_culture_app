import 'package:aqua_culture_app/features/auth/views/widgets/top_section_logo_n_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              topSectionLogoAndTitle(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(100.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        child: Text('Farmer'),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        child: Text('Buyer'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
