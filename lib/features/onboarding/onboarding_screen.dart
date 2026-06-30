import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'travel_interest_screen.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Spacer(),

              Text(
                "Discover Incredible India 🇮🇳",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "AI-powered travel experiences, hidden gems, smart planning & unforgettable journeys.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 40),

              Container(
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),

                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1524492412937-b28074a5d7da',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const Spacer(),

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
                          const TravelInterestScreen(),
                       ),
                    );

                  },

                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}