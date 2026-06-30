import 'package:experience_india/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF7A00), Colors.white, Color(0xFF138808)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset("assets/images/yatrivo_logo.jpeg", height: 180),

              const SizedBox(height: 30),

              Text(
                "YATRIVO",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "EXPERIENCE THE INDIA",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.5,
                  color: AppColors.indiaGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 50),

              CircularProgressIndicator(color: AppColors.saffron),
            ],
          ),
        ),
      ),
    );
  }
}
