import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AIPlannerScreen extends StatefulWidget {
  const AIPlannerScreen({super.key});

  @override
  State<AIPlannerScreen> createState() =>
      _AIPlannerScreenState();
}

class _AIPlannerScreenState
    extends State<AIPlannerScreen> {

  double budget = 15000;

  int days = 3;

  String selectedType = "Budget";

  final List interests = [
    "Beaches",
    "Mountains",
    "Food",
    "Adventure",
    "Temples",
    "Luxury",
  ];

  final List selectedInterests = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text(
          "AI Trip Planner ✨",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              "Where do you want to go?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter destination",

                prefixIcon: Icon(
                  Icons.location_on,
                  color: AppColors.saffron,
                ),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 35),

            Text(
              "Budget ₹${budget.toInt()}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            Slider(
              value: budget,
              min: 5000,
              max: 100000,

              activeColor: AppColors.saffron,

              onChanged: (value) {

                setState(() {
                  budget = value;
                });
              },
            ),

            const SizedBox(height: 25),

            Text(
              "Trip Days",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: List.generate(
                7,
                (index) {

                  final day = index + 1;

                  return GestureDetector(

                    onTap: () {

                      setState(() {
                        days = day;
                      });
                    },

                    child: Container(
                      margin:
                          const EdgeInsets.only(
                        right: 12,
                      ),

                      width: 50,
                      height: 50,

                      decoration: BoxDecoration(
                        color: days == day
                            ? AppColors.saffron
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                                16),
                      ),

                      child: Center(
                        child: Text(
                          "$day",

                          style: TextStyle(
                            color: days == day
                                ? Colors.white
                                : AppColors.primary,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 35),

            Text(
              "Travel Type",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                typeCard("Budget"),
                typeCard("Luxury"),

              ],
            ),

            const SizedBox(height: 35),

            Text(
              "Interests",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 12,
              runSpacing: 12,

              children: interests.map((item) {

                final isSelected =
                    selectedInterests.contains(item);

                return GestureDetector(

                  onTap: () {

                    setState(() {

                      if (isSelected) {
                        selectedInterests
                            .remove(item);
                      } else {
                        selectedInterests
                            .add(item);
                      }
                    });
                  },

                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.indiaGreen
                          : Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                              30),
                    ),

                    child: Text(
                      item,

                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : AppColors.primary,

                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 45),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.saffron,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                ),

                onPressed: () {},

                child: const Text(
                  "Generate AI Trip 🚀",

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,

                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget typeCard(String title) {

    final bool isSelected =
        selectedType == title;

    return GestureDetector(

      onTap: () {

        setState(() {
          selectedType = title;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(right: 16),

        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 16,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.saffron
              : Colors.white,

          borderRadius:
              BorderRadius.circular(20),
        ),

        child: Text(
          title,

          style: TextStyle(
            color: isSelected
                ? Colors.white
                : AppColors.primary,

            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}