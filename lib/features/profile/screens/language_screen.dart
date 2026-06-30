import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() =>
      _LanguageScreenState();
}

class _LanguageScreenState
    extends State<LanguageScreen> {

  String selected = "English";

  @override
  Widget build(BuildContext context) {

    final languages = [
      "English",
      "తెలుగు",
      "हिन्दी",
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text(
          "Language",
          style: TextStyle(
            color: AppColors.primary,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: languages.length,

        itemBuilder: (context, index) {

          final item = languages[index];

          return RadioListTile(
            value: item,
            groupValue: selected,

            activeColor:
                AppColors.saffron,

            title: Text(item),

            onChanged: (value) {

              setState(() {
                selected = value!;
              });
            },
          );
        },
      ),
    );
  }
}