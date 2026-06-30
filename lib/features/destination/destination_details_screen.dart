import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const DestinationDetailsScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          // HEADER IMAGE
          SizedBox(
            height: 380,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          // TOP BUTTONS
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  circleIcon(
                    Icons.arrow_back,
                    () => Navigator.pop(context),
                  ),

                  circleIcon(
                    Icons.favorite_border,
                    () {},
                  ),
                ],
              ),
            ),
          ),

          // MAIN CARD
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            bottom: 0,

            child: Container(
              padding: const EdgeInsets.all(24),

              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [

                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          "4.8 (12K reviews)",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        infoBox(
                          "22°C",
                          "Weather",
                          Icons.wb_sunny,
                        ),

                        infoBox(
                          "Low",
                          "Crowd",
                          Icons.groups,
                        ),

                        infoBox(
                          "2 Days",
                          "Ideal Trip",
                          Icons.calendar_month,
                        ),

                        infoBox(
                          "₹5,000",
                          "Budget",
                          Icons.account_balance_wallet,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "About",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "$title is a beautiful tourist destination known for breathtaking landscapes, local culture, food experiences and unforgettable memories.",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        height: 1.8,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: const [

                        Text(
                          "Top Experiences",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height: 110,

                      child: ListView(
                        scrollDirection:
                            Axis.horizontal,

                        children: [

                          experienceCard(
                            "Borra Caves",
                            "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                          ),

                          experienceCard(
                            "Tribal Museum",
                            "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86",
                          ),

                          experienceCard(
                            "Coffee Plantation",
                            "https://images.unsplash.com/photo-1526772662000-3f88f10405ff",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    Row(
                      children: [

                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.favorite_border,
                            ),

                            label: const Text("Save"),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.share,
                            ),

                            label: const Text("Share"),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          flex: 2,

                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColors.saffron,

                              padding:
                                  const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),

                            onPressed: () {},

                            child: const Text(
                              "Plan Trip",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget circleIcon(
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget infoBox(
    String value,
    String title,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  static Widget experienceCard(
    String title,
    String image,
  ) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),

      alignment: Alignment.bottomCenter,

      child: Container(
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.black54,
        ),

        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}