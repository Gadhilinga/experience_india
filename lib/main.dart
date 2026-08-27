import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Open authentication box
  await Hive.openBox('auth');

  runApp(
    const ExperienceIndia(),
  );

}

class ExperienceIndia extends StatelessWidget {
  const ExperienceIndia({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yatrivo',
      theme: AppTheme.lightTheme,
      useInheritedMediaQuery: true,
      home: const SplashScreen(),
    );
  }
}