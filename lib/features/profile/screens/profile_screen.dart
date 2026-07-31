import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  bool notifications = true;

  String selectedLanguage = "English";

  Future<void> openWhatsApp() async {

    final Uri url = Uri.parse(
      "https://wa.me/+917093365749",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> openEmail() async {

    final Uri email = Uri(
      scheme: 'mailto',
      path: 'support@yatrivo.com',
      query:
          'subject=YATRIVO Support',
    );

    if (await canLaunchUrl(email)) {
      await launchUrl(email);
    }
  }

  void showLanguageBottomSheet() {

    showModalBottomSheet(
      context: context,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),

      builder: (context) {

        return Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              Text(
                "Choose Language",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 20),

              languageTile("English"),
              languageTile("తెలుగు"),
              languageTile("हिन्दी"),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget languageTile(String language) {

    return ListTile(

      leading: Icon(
        Icons.language,
        color: AppColors.saffron,
      ),

      title: Text(
        language,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),

      trailing:
          selectedLanguage == language
              ? Icon(
                  Icons.check_circle,
                  color:
                      AppColors.indiaGreen,
                )
              : null,

      onTap: () {

        setState(() {
          selectedLanguage = language;
        });

        Navigator.pop(context);
      },
    );
  }

  void showEditProfileDialog() {

    final TextEditingController nameController =
        TextEditingController(
      text: "YATRIVO User",
    );

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(24),
          ),

          title: Text(
            "Edit Profile",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: TextField(
            controller: nameController,

            decoration: InputDecoration(
              hintText: "Enter your name",

              focusedBorder:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                        14),
                borderSide: BorderSide(
                  color: AppColors.saffron,
                ),
              ),

              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                        14),
              ),
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.saffron,
              ),

              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showPrivacyDialog() {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(24),
          ),

          title: Text(
            "Privacy & Security",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: const Text(
            "Your account and travel data are securely protected with Firebase authentication and encrypted cloud storage.",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: Text(
                "OK",
                style: TextStyle(
                  color: AppColors.saffron,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void logoutDialog() {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(24),
          ),

          title: const Text(
            "Logout",
          ),

          content: const Text(
            "Are you sure you want to logout?",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),

              onPressed: () {

                Navigator.pop(context);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(

                  const SnackBar(
                    content:
                        Text("Logged out"),
                  ),
                );
              },

              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          AppColors.background,

      appBar: AppBar(
        backgroundColor:
            Colors.transparent,

        elevation: 0,

        centerTitle: true,

        title: Text(
          "My Profile",

          style: TextStyle(
            color: AppColors.primary,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 10),

            Container(
              padding:
                  const EdgeInsets.all(4),

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient:
                    LinearGradient(
                  colors: [
                    AppColors.saffron,
                    AppColors.indiaGreen,
                  ],
                ),
              ),

              child: const CircleAvatar(
                radius: 55,

                backgroundImage:
                    AssetImage(
                  "assets/images/app_logo.png",
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "YATRIVO User",

              style: TextStyle(
                fontSize: 28,
                fontWeight:
                    FontWeight.bold,
                color:
                    AppColors.primary,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "travel@yatrivo.com",

              style: TextStyle(
                color:
                    Colors.grey.shade700,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 40),

            settingsTile(
              icon: Icons.edit,
              title: "Edit Profile",

              onTap:
                  showEditProfileDialog,
            ),

            settingsSwitchTile(),

            settingsTile(
              icon: Icons.language,
              title:
                  "Language ($selectedLanguage)",

              onTap:
                  showLanguageBottomSheet,
            ),

            settingsTile(
              icon: Icons.lock,
              title:
                  "Privacy & Security",

              onTap:
                  showPrivacyDialog,
            ),

            settingsTile(
              icon: Icons.support_agent,
              title:
                  "Help & Support",

              onTap:
                  openWhatsApp,
            ),

            settingsTile(
              icon: Icons.email,
              title:
                  "Email Support",

              onTap:
                  openEmail,
            ),

            settingsTile(
              icon: Icons.logout,
              title: "Logout",

              color: Colors.red,

              onTap: logoutDialog,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 18,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
                22),

        boxShadow: [

          BoxShadow(
            color:
                Colors.black.withOpacity(
                    0.04),

            blurRadius: 10,
          ),
        ],
      ),

      child: ListTile(

        leading: Icon(
          icon,
          color:
              color ??
              AppColors.saffron,
        ),

        title: Text(
          title,

          style: TextStyle(
            fontWeight:
                FontWeight.w600,

            color:
                color ??
                AppColors.primary,
          ),
        ),

        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color:
              Colors.grey.shade400,
        ),

        onTap: onTap,
      ),
    );
  }

  Widget settingsSwitchTile() {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 18,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
                22),

        boxShadow: [

          BoxShadow(
            color:
                Colors.black.withOpacity(
                    0.04),

            blurRadius: 10,
          ),
        ],
      ),

      child: SwitchListTile(

        value: notifications,

        activeColor:
            AppColors.indiaGreen,

        secondary: Icon(
          Icons.notifications,
          color:
              AppColors.saffron,
        ),

        title: Text(
          "Notifications",

          style: TextStyle(
            fontWeight:
                FontWeight.w600,

            color:
                AppColors.primary,
          ),
        ),

        onChanged: (value) {

          setState(() {
            notifications = value;
          });
        },
      ),
    );
  }
}