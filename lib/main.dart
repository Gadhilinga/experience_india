import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';


void main() {
  runApp(const ExperienceIndia());
}

class ExperienceIndia extends StatelessWidget {
  const ExperienceIndia({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YATRIVO',
          theme: AppTheme.lightTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}