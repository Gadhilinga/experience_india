import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List savedPlaces = [

      {
        "title": "Goa",
        "subtitle": "Beach Paradise",
        "image":
            "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86",
      },

      {
        "title": "Kashmir",
        "subtitle": "Heaven On Earth",
        "image":
            "https://images.unsplash.com/photo-1598091383021-15ddea10925d",
      },

      {
        "title": "Jaipur",
        "subtitle": "Royal Rajasthan",
        "image":
            "https://images.unsplash.com/photo-1477587458883-47145ed94245",
      },

    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        centerTitle: true,

        title: Text(
          "Saved Places ❤️",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: savedPlaces.length,

        itemBuilder: (context, index) {

          final place = savedPlaces[index];

          return Container(
            margin:
                const EdgeInsets.only(
              bottom: 20,
            ),

            height: 220,

            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(
                      30),

              image: DecorationImage(
                image: NetworkImage(
                  place["image"],
                ),
                fit: BoxFit.cover,
              ),
            ),

            child: Container(
              padding:
                  const EdgeInsets.all(20),

              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(
                        30),

                gradient: LinearGradient(
                  begin:
                      Alignment.topCenter,

                  end:
                      Alignment.bottomCenter,

                  colors: [
                    Colors.transparent,
                    Colors.black
                        .withOpacity(
                            0.7),
                  ],
                ),
              ),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end,

                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(
                              place["title"],

                              style:
                                  const TextStyle(
                                fontSize: 28,
                                fontWeight:
                                    FontWeight
                                        .bold,
                                color:
                                    Colors.white,
                              ),
                            ),

                            Text(
                              place["subtitle"],

                              style:
                                  const TextStyle(
                                color:
                                    Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets
                                .all(12),

                        decoration:
                            BoxDecoration(
                          color:
                              Colors.white,
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),

                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}