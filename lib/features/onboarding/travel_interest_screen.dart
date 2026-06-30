import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

import 'budget_screen.dart';

class TravelInterestScreen extends StatefulWidget {
  const TravelInterestScreen({super.key});

  @override
  State<TravelInterestScreen> createState() =>
      _TravelInterestScreenState();
}

class _TravelInterestScreenState
    extends State<TravelInterestScreen> {

  final List<String> interests = [
    "Mountains",
    "Beaches",
    "Food",
    "Temples",
    "Adventure",
    "Night Life",
    "Nature",
    "Luxury",
    "Road Trips",
    "Shopping",
  ];

  List selected = [];

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
              "What do you love exploring? ✨",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "Choose your travel interests for personalized recommendations.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 40),

            Expanded(
              child: Wrap(
                spacing: 14,
                runSpacing: 14,

                children: interests.map((interest) {

                  final isSelected =
                      selected.contains(interest);

                  return GestureDetector(

                    onTap: () {

                      setState(() {

                        if (isSelected) {
                          selected.remove(interest);
                        } else {
                          selected.add(interest);
                        }

                      });

                    },

                    child: AnimatedContainer(
                      duration:
                          const Duration(milliseconds: 300),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 16,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.saffron
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(18),

                        border: Border.all(
                          color: isSelected
                              ? AppColors.saffron
                              : Colors.grey.shade300,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: Text(
                        interest,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );

                }).toList(),
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
                        const BudgetScreen(),
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