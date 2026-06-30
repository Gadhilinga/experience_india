import 'package:experience_india/common_widgets/common_text_widget.dart';
import 'package:experience_india/core/theme/app_colors.dart';
import 'package:experience_india/features/navbar/main_navbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              Image.asset("assets/images/yatrivo_logo.jpeg", height: 140),

              const SizedBox(height: 30),

              CommonTextWidget(
                title: 'Welcome to YATRIVO',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),

              const SizedBox(height: 10),

              CommonTextWidget(
                title: 'Experience The India 🇮🇳',
                fontSize: 16,
                color: AppColors.indiaGreen,
              ),

              const SizedBox(height: 50),

              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email, color: AppColors.saffron),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock, color: AppColors.saffron),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.saffron,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavbar(),
                      ),
                    );
                  },
                  child: const CommonTextWidget(
                    title: "Login",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton.icon(
                  icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/281/281764.png",
                    height: 24,
                  ),
                  label: CommonTextWidget(
                    title: "Continue with Google",
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CommonTextWidget(
                    title: "Don't have an account?",
                    fontSize: 14,
                  ),

                  TextButton(
                    onPressed: () {},
                    child: CommonTextWidget(
                      title: "Sign Up",
                      color: AppColors.saffron,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
