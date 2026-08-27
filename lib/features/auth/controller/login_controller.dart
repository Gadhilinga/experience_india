import 'package:experience_india/core/network/api_end_points.dart';
import 'package:experience_india/features/home/home_screen.dart';
import 'package:experience_india/features/navbar/main_navbar.dart';
import 'package:experience_india/services/auth_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  Future<void> registerAPI(
    String? firstName,
    String? lastName,
    String? email,
    String? mobile,
    String? location,
    String? password,
  ) async {
    try {
      isLoading.value = true;

      final payload = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "location": location,
        "password": password,
      };

      print("========== REGISTER API ==========");
      print("URL : ${ApiEndpoints.register}");
      print("Payload : ${jsonEncode(payload)}");

      final response = await http.post(
        Uri.parse(ApiEndpoints.register),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(payload),
      );

      print("Status Code : ${response.statusCode}");
      print("Response : ${response.body}");
      print("==================================");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Registered successfully.",
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar(
          "Registration Failed",
          response.body,
          snackPosition: SnackPosition.BOTTOM,
        );

        print("Registration Failed");
      }
    } catch (e) {
      print("Exception : $e");

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginAPI(String emailOrMobile, String password) async {
    try {
      isLoading.value = true;

      final payload = {
        "emailormbilenumber": emailOrMobile,
        "password": password,
      };

      print("========== LOGIN API ==========");
      print("URL : ${ApiEndpoints.login}");
      print("Payload : ${jsonEncode(payload)}");

      final response = await http
          .post(
            Uri.parse(ApiEndpoints.login),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: jsonEncode(payload),
          );
          // .timeout(const Duration(seconds: 30));

      print("Status Code : ${response.statusCode}");
      print("Response : ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final String token = data["token"];
        final int userId = data["user"]["id"];

        // Save login session
        await AuthStorage.saveLogin(userId: userId, token: token);

        print("========== LOGIN SESSION ==========");
        print("isLoggedIn : ${AuthStorage.isLoggedIn}");
        print("userId : ${AuthStorage.userId}");
        print("Token saved : ${AuthStorage.token != null}");

        Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(() => const MainNavbar());
      } else {
        final data = jsonDecode(response.body);

        Get.snackbar(
          "Login Failed",
          data["detail"] ?? "Invalid Credentials",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print("Login Exception : $e");

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
