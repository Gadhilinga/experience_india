import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      {
        "title": "Kashmir",
        "subtitle": "Paradise On Earth",
        "image":
            "https://images.unsplash.com/photo-1506744038136-46273834b3fb"
      },
      {
        "title": "Goa",
        "subtitle": "Beach Paradise",
        "image":
            "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86"
      },
      {
        "title": "Kerala",
        "subtitle": "God's Own Country",
        "image":
            "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// TOP HEADER

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "Good Evening, Sujith 👋",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Where shall we explore today?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR

              Container(
                height: 58,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),

                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    hintText:
                        "Search places, experiences...",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// AUTO HERO SLIDER

              CarouselSlider.builder(
                itemCount: banners.length,

                itemBuilder:
                    (context, index, realIndex) {

                  final item = banners[index];

                  return Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(24),

                      image: DecorationImage(
                        image: NetworkImage(
                            item["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),

                    child: Container(
                      padding:
                          const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                                24),

                        gradient:
                            LinearGradient(
                          begin:
                              Alignment.topCenter,
                          end:
                              Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black
                                .withOpacity(.7)
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        mainAxisAlignment:
                            MainAxisAlignment.end,

                        children: [

                          Text(
                            item["title"]!,
                            style:
                                const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            item["subtitle"]!,
                            style:
                                const TextStyle(
                              color:
                                  Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: .95,
                ),
              ),

              const SizedBox(height: 20),

              /// QUICK MENU

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,

                children: const [

                  _Menu(Icons.auto_awesome,
                      "AI Planner"),

                  _Menu(Icons.location_on,
                      "Nearby"),

                  _Menu(Icons.travel_explore,
                      "Hidden Gems"),

                  _Menu(Icons.festival,
                      "Festivals"),

                  _Menu(Icons.more_horiz,
                      "More"),
                ],
              ),

              const SizedBox(height: 25),

              sectionTitle(
                "AI Recommendations",
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 210,

                child: ListView(
                  scrollDirection:
                      Axis.horizontal,

                  children: [

                    recommendationCard(
                      "Meghalaya",
                      "₹15000",
                      "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
                    ),

                    recommendationCard(
                      "Hampi",
                      "₹10000",
                      "https://images.unsplash.com/photo-1564507592333-c60657eea523",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              sectionTitle(
                "Hidden Gems Near You",
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 150,

                child: ListView(
                  scrollDirection:
                      Axis.horizontal,

                  children: [

                    gemCard(
                      "Araku",
                      "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                    ),

                    gemCard(
                      "Lepakshi",
                      "https://images.unsplash.com/photo-1516483638261-f4dbaf036963",
                    ),

                    gemCard(
                      "Coorg",
                      "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
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

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Text("See all"),
      ],
    );
  }

  Widget recommendationCard(
      String title,
      String price,
      String image) {
    return Container(
      width: 160,
      margin:
          const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget gemCard(
      String title,
      String image) {
    return Container(
      width: 120,
      margin:
          const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(18),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  
  // CarouselOptions({required int height, required bool autoPlay, required bool enlargeCenterPage, required double viewportFraction}) {}
}

class _Menu extends StatelessWidget {
  final IconData icon;
  final String title;

  const _Menu(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(height: 6),
        Text(
          title,
          style:
              const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}