import 'package:aqua_culture_app/app/app_theme.dart';
import 'package:aqua_culture_app/features/auth/view_models/auth_provider.dart';
import 'package:aqua_culture_app/features/auth/view_models/login_provider.dart';
import 'package:aqua_culture_app/features/auth/view_models/otp_verification_provider.dart';
import 'package:aqua_culture_app/features/auth/view_models/register_provider.dart';
import 'package:aqua_culture_app/features/auth/view_models/set_password_provider.dart';
import 'package:aqua_culture_app/features/farmer_role_features/main_nav_holder/view_models/main_nav_holder_provider.dart';
import 'package:aqua_culture_app/features/welcome/views/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AquaCultureApp extends StatelessWidget {
  const AquaCultureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainNavHolderProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => OtpVerificationProvider()),
        ChangeNotifierProvider(create: (_) => SetPasswordProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        themeMode: ThemeMode.light,
        home: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
