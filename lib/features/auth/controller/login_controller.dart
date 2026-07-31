import 'package:experience_india/core/constants/app_constants.dart';
import 'package:experience_india/features/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

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
      print("URL : ${ApiConstants.register}");
      print("Payload : ${jsonEncode(payload)}");

      final response = await http.post(
        Uri.parse(ApiConstants.register),
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
}
