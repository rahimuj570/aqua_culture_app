import 'package:aqua_culture_app/app/app_theme.dart';
import 'package:aqua_culture_app/features/main_nav_holder/view_models/main_nav_holder_provider.dart';
import 'package:aqua_culture_app/features/main_nav_holder/views/main_nav_holder_screen.dart';
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
