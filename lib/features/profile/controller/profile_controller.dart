import 'dart:convert';

import 'package:experience_india/core/network/api_end_points.dart';
import 'package:experience_india/features/auth/screens/login_screen.dart';
import 'package:experience_india/features/profile/models/profile_getall_model.dart';
import 'package:experience_india/services/auth_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  Rxn<ProfileGetAllModel> profileData = Rxn<ProfileGetAllModel>();

  Future<void> profile() async {
    try {
      isLoading.value = true;

      final userId = AuthStorage.userId;
      final token = AuthStorage.token;

      if (userId == null || token == null) {
        Get.snackbar(
          "Session Expired",
          "Please login again",
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(() => const LoginScreen());
        return;
      }

      final url = "${ApiEndpoints.profile}$userId";

      print("========== PROFILE API ==========");
      print("URL : $url");
      print("User ID : $userId");

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status Code : ${response.statusCode}");
      print("Response : ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        profileData.value = ProfileGetAllModel.fromJson(data);

        print("Profile fetched successfully");
      } else {
        final data = jsonDecode(response.body);

        Get.snackbar(
          "Profile Failed",
          data["detail"] ?? "Unable to get profile",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print("Profile Exception : $e");

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;

      final userId = AuthStorage.userId;
      final token = AuthStorage.token;

      if (userId == null || token == null) {
        await AuthStorage.logout();

        Get.offAll(() => const LoginScreen());
        return;
      }

      final url = ApiEndpoints.logout;

      print("========== LOGOUT API ==========");
      print("URL : $url");

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"user_id": userId, "access_token": token}),
      );

      print("Status Code : ${response.statusCode}");
      print("Response : ${response.body}");

      if (response.statusCode == 200) {
        // Clear saved login data
        await AuthStorage.logout();

        profileData.value = null;

        Get.snackbar(
          "Success",
          "Logged out successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(() => const LoginScreen());
      } else {
        final data = jsonDecode(response.body);

        Get.snackbar(
          "Logout Failed",
          data["detail"] ?? "Unable to logout",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print("Logout Exception : $e");

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
