import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {

  File? image;

  final TextEditingController nameController =
      TextEditingController(
    text: "YATRIVO User",
  );

  Future pickImage() async {

    final picked =
        await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {

      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: AppColors.primary,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            GestureDetector(
              onTap: pickImage,

              child: CircleAvatar(
                radius: 60,

                backgroundColor:
                    AppColors.saffron,

                backgroundImage:
                    image != null
                        ? FileImage(image!)
                        : null,

                child: image == null
                    ? const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 40,
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,

              decoration: InputDecoration(
                hintText: "Name",

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.saffron,
                ),

                onPressed: () {

                  ScaffoldMessenger.of(context)
                      .showSnackBar(

                    const SnackBar(
                      content:
                          Text("Profile Updated"),
                    ),
                  );
                },

                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}