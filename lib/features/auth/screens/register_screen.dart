import 'package:experience_india/common_widgets/common_text_button.dart';
import 'package:experience_india/common_widgets/common_text_field.dart';
import 'package:experience_india/common_widgets/common_text_widget.dart';
import 'package:experience_india/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController locationController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController());
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _fieldsHeading('First Name'),
              _textFeild('Enter your first name', nameController),

              _fieldsHeading('Last Name'),
              _textFeild('Enter your last name', lastNameController),

              _fieldsHeading('Email'),
              _textFeild(
                'Enter your email',
                emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              _fieldsHeading('Mobile Number'),
              _textFeild(
                'Enter your mobile number',
                mobileController,
                keyboardType: TextInputType.phone,
              ),

              _fieldsHeading('Password'),
              _textFeild(
                'Enter your password',
                passwordController,
                obscureText: true,
              ),

              _fieldsHeading('Location'),
              CommonTextField(
                hintText: 'Enter your location',
                controller: locationController,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: getCurrentLocation,
                ),
              ),

              const SizedBox(height: 20),
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: CommonTextButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            await controller.registerAPI(
                              nameController.text,
                              lastNameController.text,
                              emailController.text,
                              mobileController.text,
                              locationController.text,
                              passwordController.text,
                            );
                          },
                    isLoading: controller.isLoading.value,
                    text: 'Register',
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.snackbar("Location", "Please enable location services");
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      Get.snackbar("Location", "Location permission denied");
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Location",
        "Location permission permanently denied. Please enable it from settings.",
      );
      return;
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        return;
      }

      final Placemark place = placemarks.first;

      final List<String> addressParts =
          [
                place.name,
                place.street,
                place.subLocality,
                place.locality,
                place.subAdministrativeArea,
                place.administrativeArea,
                place.postalCode,
                place.country,
              ]
              .where((value) => value != null && value.trim().isNotEmpty)
              .map((value) => value!.trim())
              .toList();

      locationController.text = addressParts.join(", ");

      print("========== CURRENT LOCATION ==========");
      print("Latitude : ${position.latitude}");
      print("Longitude : ${position.longitude}");
      print("Address : ${locationController.text}");
    } catch (e) {
      print("Location Exception : $e");

      Get.snackbar("Location Error", "Unable to get your current location");
    }
  }

  Widget _textFeild(
    String hintText,
    TextEditingController controller, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onPressed,
  }) {
    return CommonTextField(
      controller: controller,
      hintText: hintText,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onPressed,
    );
  }

  Widget _fieldsHeading(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: CommonTextWidget(
        title: title,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
