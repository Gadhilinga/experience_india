import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../destination/destination_details_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> destinations = [
      {
        "title": "Goa",
        "subtitle": "Beach Paradise",
        "image": "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86",
      },

      {
        "title": "Kashmir",
        "subtitle": "Heaven on Earth",
        "image": "https://images.unsplash.com/photo-1598091383021-15ddea10925d",
      },

      {
        "title": "Jaipur",
        "subtitle": "Royal Rajasthan",
        "image": "https://images.unsplash.com/photo-1477587458883-47145ed94245",
      },

      {
        "title": "Kerala",
        "subtitle": "God’s Own Country",
        "image": "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Explore India 🇮🇳",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Discover destinations powered by AI",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    icon: Icon(Icons.search, color: AppColors.saffron),

                    hintText: "Search destinations...",
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 50,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    categoryChip("Beach"),
                    categoryChip("Mountains"),
                    categoryChip("Temples"),
                    categoryChip("Food"),
                    categoryChip("Adventure"),
                    categoryChip("Luxury"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Trending Places 🔥",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: destinations.length,

                  itemBuilder: (context, index) {
                    final item = destinations[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationDetailsScreen(
                              title: item["title"],
                              subtitle: item["subtitle"],
                              imageUrl: item["image"],
                            ),
                          ),
                        );
                      },

                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),

                        height: 240,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),

                          image: DecorationImage(
                            image: NetworkImage(item["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),

                        child: Container(
                          padding: const EdgeInsets.all(20),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,

                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Text(
                                item["title"],

                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                item["subtitle"],

                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryChip(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 14),

      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10),
        ],
      ),

      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
      ),
    );
  }
}
