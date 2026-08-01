import 'package:experience_india/common_widgets/common_text_button.dart';
import 'package:experience_india/common_widgets/common_text_field.dart';
import 'package:experience_india/common_widgets/common_text_widget.dart';
import 'package:experience_india/core/theme/app_colors.dart';
import 'package:experience_india/features/auth/controller/login_controller.dart';
import 'package:experience_india/features/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final LoginController controller = Get.put(LoginController());

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              _appIcon(),
              const SizedBox(height: 30),
              _welcomeText(),
              const SizedBox(height: 10),
              _description(),
              const SizedBox(height: 50),
              _emailOrPhone(),
              const SizedBox(height: 20),
              _passWord(),
              const SizedBox(height: 30),
              _login(),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
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

  Widget _login() {
    return Obx(
      () => CommonTextButton(
        onPressed: controller.isLoading.value
            ? null
            : () async {
                await controller.loginAPI(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
        isLoading: controller.isLoading.value,
        text: "Login",
        backgroundColor: AppColors.saffron,
        textColor: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        borderRadius: 10,
        width: double.infinity,
      ),
    );
  }

  Widget _passWord() {
    return Obx(
      () => CommonTextField(
        controller: passwordController,
        hintText: "Password",
        obscureText: !controller.isPasswordVisible.value,
        prefixIcon: const Icon(Icons.lock, color: AppColors.saffron),
        suffixIcon: IconButton(
          icon: Icon(
            controller.isPasswordVisible.value
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColors.saffron,
          ),
          onPressed: () {
            controller.isPasswordVisible.toggle();
          },
        ),
      ),
    );
  }

  Widget _emailOrPhone() {
    return CommonTextField(
      controller: emailController,
      hintText: "Email or Mobile Number",
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email, color: AppColors.saffron),
    );
  }

  Widget _description() {
    return CommonTextWidget(
      title: 'Experience The India 🇮🇳',
      fontSize: 16,
      color: AppColors.indiaGreen,
    );
  }

  Widget _welcomeText() {
    return CommonTextWidget(
      title: 'Welcome to YATRIVO',
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }

  Widget _appIcon() {
    return ClipOval(
      child: Image.asset(
        "assets/images/app_logo.png",
        width: 160,
        height: 160,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.travel_explore,
            color: Color(0xFFFF7A00),
            size: 120,
          );
        },
      ),
    );
  }
}
