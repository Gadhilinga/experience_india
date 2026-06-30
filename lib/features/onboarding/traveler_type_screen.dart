import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

import 'ai_setup_screen.dart';

class TravelerTypeScreen extends StatefulWidget {
  const TravelerTypeScreen({super.key});

  @override
  State<TravelerTypeScreen> createState() =>
      _TravelerTypeScreenState();
}

class _TravelerTypeScreenState
    extends State<TravelerTypeScreen> {

  String selectedType = "";

  final List<Map<String, dynamic>> travelerTypes = [

    {
      "title": "Solo",
      "icon": Icons.person,
    },

    {
      "title": "Couple",
      "icon": Icons.favorite,
    },

    {
      "title": "Family",
      "icon": Icons.family_restroom,
    },

    {
      "title": "Friends",
      "icon": Icons.groups,
    },

    {
      "title": "Luxury",
      "icon": Icons.workspace_premium,
    },

    {
      "title": "Backpacker",
      "icon": Icons.backpack,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            Text(
              "Who are you traveling with? ✈️",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "Select your traveler type for better AI trip planning.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 40),

            Expanded(
              child: GridView.builder(
                itemCount: travelerTypes.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),

                itemBuilder: (context, index) {

                  final item = travelerTypes[index];

                  final isSelected =
                      selectedType == item["title"];

                  return GestureDetector(

                    onTap: () {

                      setState(() {
                        selectedType = item["title"];
                      });

                    },

                    child: AnimatedContainer(
                      duration:
                          const Duration(milliseconds: 300),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.saffron
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(28),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Icon(
                            item["icon"],
                            size: 50,
                            color: isSelected
                                ? Colors.white
                                : AppColors.primary,
                          ),

                          const SizedBox(height: 20),

                          Text(
                            item["title"],

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,

                              color: isSelected
                                  ? Colors.white
                                  : AppColors.dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.indiaGreen,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const AISetupScreen(),
    ),
  );

},

                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}