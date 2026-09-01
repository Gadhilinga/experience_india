import 'package:flutter/material.dart';
import 'package:experience_india/core/theme/app_colors.dart';
import 'package:experience_india/features/auth/screens/login_screen.dart';
import 'package:experience_india/features/navbar/main_navbar.dart';
import 'package:experience_india/services/auth_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.18,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _goToLogin();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToLogin() {
    if (!mounted) return;
    Future.microtask(() {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AuthStorage.isLoggedIn
              ? const MainNavbar()
              : const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SizedBox(
            width: 190,
            height: 190,

            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/app_logo.png',
                  width: 154,
                  height: 154,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.travel_explore,
                      color: AppColors.secondary,
                      size: 120,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
