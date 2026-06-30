import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../home/home_screen.dart';
import '../navbar/main_navbar.dart';

class AISetupScreen extends StatefulWidget {
  const AISetupScreen({super.key});

  @override
  State<AISetupScreen> createState() =>
      _AISetupScreenState();
}

class _AISetupScreenState extends State<AISetupScreen> {

  double progress = 0;

  @override
  void initState() {
    super.initState();

    startLoading();
  }

  void startLoading() {

    Timer.periodic(
      const Duration(milliseconds: 120),
      (timer) {

        setState(() {
          progress += 0.02;
        });

        if (progress >= 1) {

          timer.cancel();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const MainNavbar(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 160,
                width: 160,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: LinearGradient(
                    colors: [
                      AppColors.saffron,
                      AppColors.indiaGreen,
                    ],
                  ),
                ),

                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 80,
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "AI is Building Your Experience ✨",
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Analyzing your travel style, interests & preferences for smarter recommendations.",
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 50),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 14,

                  backgroundColor: Colors.grey.shade300,
                  color: AppColors.indiaGreen,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.saffron,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}