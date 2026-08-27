import 'package:cached_network_image/cached_network_image.dart';
import 'package:experience_india/common_widgets/common_text_field.dart';
import 'package:experience_india/common_widgets/common_text_widget.dart';
import 'package:experience_india/core/theme/app_colors.dart';
import 'package:experience_india/features/explore/controller/explore_controller.dart';
import 'package:experience_india/features/explore/screens/exploring_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreController controller = Get.put(ExploreController());
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.loadDestinations();
  }

  @override
  void dispose() {
    searchController.dispose();
    Get.delete<ExploreController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(
                title: "Explore India 🇮🇳",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),

              const SizedBox(height: 10),
              CommonTextField(
                controller: searchController,
                hintText: 'Search destinations...',
                onChanged: controller.searchDestinations,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 38,
                child: Obx(() {
                  final categories = controller.categories;

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // ALL
                      _categoryItem(
                        title: 'All',
                        isSelected: controller.selectedCategory.value == 'All',
                        onTap: () {
                          controller.filterByCategory('All');
                        },
                      ),

                      // OTHER CATEGORIES
                      ...List.generate(categories.length, (index) {
                        final category = categories[index];

                        return _categoryItem(
                          title: category,
                          isSelected:
                              controller.selectedCategory.value == category,
                          onTap: () {
                            controller.filterByCategory(category);
                          },
                        );
                      }),
                    ],
                  );
                }),
              ),

              const SizedBox(height: 15),

              // DESTINATIONS
              Expanded(
                child: Obx(() {
                  if (controller.filteredDestinations.isEmpty) {
                    return const Center(child: Text("No destinations found"));
                  }

                  return ListView.separated(
                    controller: controller.scrollController,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),

                    itemCount:
                        controller.filteredDestinations.length +
                        (controller.isLoadingMore.value ? 1 : 0),

                    itemBuilder: (context, index) {
                      // Loading indicator at bottom
                      if (index >= controller.filteredDestinations.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final destination =
                          controller.filteredDestinations[index];

                      final name = destination.name ?? 'Unknown destination';

                      final image = destination.image;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExploringDetailsScreen(
                                destination: destination,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // IMAGE
                                if (image != null && image.isNotEmpty)
                                  CachedNetworkImage(
                                    key: ValueKey(image),
                                    imageUrl: image,
                                    fit: BoxFit.cover,

                                    memCacheWidth: 800,
                                    memCacheHeight: 500,

                                    fadeInDuration: const Duration(
                                      milliseconds: 150,
                                    ),

                                    placeholder: (context, url) {
                                      return Container(
                                        color: Colors.grey.shade300,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                            backgroundColor: AppColors.appColor,
                                          ),
                                        ),
                                      );
                                    },

                                    errorWidget: (context, url, error) {
                                      return Container(
                                        color: Colors.grey.shade300,
                                        child: const Center(
                                          child: Icon(
                                            Icons.image_not_supported,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                else
                                  Container(
                                    color: Colors.grey.shade300,
                                    child: const Center(
                                      child: Icon(Icons.image, size: 40),
                                    ),
                                  ),

                                // GRADIENT
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.7),
                                      ],
                                    ),
                                  ),
                                ),

                                // NAME
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CommonTextWidget(
                                        title: name,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.appColor : Colors.grey.shade200,
        ),
        child: CommonTextWidget(
          title: title,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
