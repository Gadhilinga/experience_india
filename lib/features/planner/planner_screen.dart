import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() =>
      _PlannerScreenState();
}

class _PlannerScreenState
    extends State<PlannerScreen> {

  final TextEditingController
      destinationController =
      TextEditingController();

  String selectedBudget = "Medium";
  String selectedTrip = "Family";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                "AI Trip Planner ✨",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Generate smart travel plans powered by AI",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 40),

              Text(
                "Destination",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: destinationController,

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

              const SizedBox(height: 30),

              Text(
                "Budget",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [

                  budgetCard("Low"),
                  budgetCard("Medium"),
                  budgetCard("Luxury"),

                ],
              ),

              const SizedBox(height: 30),

              Text(
                "Trip Type",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 14,
                runSpacing: 14,

                children: [

                  tripType("Solo"),
                  tripType("Family"),
                  tripType("Friends"),
                  tripType("Couple"),
                  tripType("Adventure"),
                  tripType("Business"),

                ],
              ),

              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.saffron,
                      AppColors.indiaGreen,
                    ],
                  ),

                  borderRadius:
                      BorderRadius.circular(30),
                ),

                child: Column(
                  children: [

                    const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 70,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Generate Your Smart AI Trip",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "AI will create hotels, itinerary, food spots & travel plans instantly.",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 58,

                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    18),
                          ),
                        ),

                        onPressed: () {

                          showDialog(
                            context: context,

                            builder: (context) {

                              return AlertDialog(
                                title: const Text(
                                  "AI Planner 🚀",
                                ),

                                content: Text(
                                  "Trip generated for ${destinationController.text.isEmpty ? "your destination" : destinationController.text}.\n\nBudget: $selectedBudget\nTrip Type: $selectedTrip",
                                ),
                              );
                            },
                          );

                        },

                        child: Text(
                          "Generate AI Plan",
                          style: TextStyle(
                            color:
                                AppColors.primary,
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget budgetCard(String title) {

    final bool isSelected =
        selectedBudget == title;

    return Expanded(
      child: GestureDetector(

        onTap: () {

          setState(() {
            selectedBudget = title;
          });

        },

        child: Container(
          margin:
              const EdgeInsets.only(right: 12),

          padding:
              const EdgeInsets.symmetric(
            vertical: 18,
          ),

          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.saffron
                : Colors.white,

            borderRadius:
                BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.04),
                blurRadius: 10,
              ),
            ],
          ),

          child: Center(
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
        ),
      ),
    );
  }

  Widget tripType(String title) {

    final bool isSelected =
        selectedTrip == title;

    return GestureDetector(

      onTap: () {

        setState(() {
          selectedTrip = title;
        });

      },

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.indiaGreen
              : Colors.white,

          borderRadius:
              BorderRadius.circular(30),

          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.04),
              blurRadius: 10,
            ),
          ],
        ),

        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : AppColors.primary,

            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}