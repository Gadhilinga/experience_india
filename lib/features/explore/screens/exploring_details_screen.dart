import 'package:experience_india/common_widgets/common_text_widget.dart';
import 'package:experience_india/core/theme/app_colors.dart';
import 'package:experience_india/features/explore/models/explore_get_model.dart';
import 'package:flutter/material.dart';

class ExploringDetailsScreen extends StatelessWidget {
  final ExploreGetAllModel? destination;

  const ExploringDetailsScreen({super.key, this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,

            elevation: 0,

            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: _circleButton(
                icon: Icons.arrow_back,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _circleButton(icon: Icons.favorite_border, onTap: () {}),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeaderImage(destination?.image),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      title: destination?.name ?? '',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),

                    const SizedBox(height: 8),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: CommonTextWidget(
                            title: destination?.state ?? '',
                            fontSize: 15,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CommonTextWidget(
                        title: destination?.category ?? '',
                        color: AppColors.indiaGreen,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        children: [
                          _infoBox(
                            icon: Icons.calendar_month,
                            title: 'Best Time',
                            value: destination?.bestTime ?? '',
                            iconColor: Colors.green,
                          ),

                          _verticalDivider(),

                          _infoBox(
                            icon: Icons.account_balance_wallet,
                            title: 'Cost Level',
                            value: '${destination?.costLevel ?? ''}',
                            iconColor: Colors.orange,
                          ),

                          _verticalDivider(),

                          _infoBox(
                            icon: Icons.location_on,
                            title: 'Best Spot',
                            value: destination?.bestSpot ?? '',
                            iconColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ==================================================
                    // ABOUT
                    // ==================================================
                    _sectionTitle('About'),

                    const SizedBox(height: 10),

                    Text(
                      destination?.summary ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.grey,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ==================================================
                    // STORY
                    // ==================================================
                    _sectionTitle('Story'),

                    const SizedBox(height: 10),

                    Text(
                      destination?.story ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ==================================================
                    // FOOD
                    // ==================================================
                    _sectionTitle('Food'),

                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.orange.shade700,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              destination?.food ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ==================================================
                    // BEST SPOT
                    // ==================================================
                    _sectionTitle('Best Spot'),

                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.place,
                            color: Colors.green.shade700,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              destination?.bestSpot ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // _sectionTitle('Location'),

                    // const SizedBox(height: 10),

                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue.shade50,
                    //     borderRadius: BorderRadius.circular(14),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       _locationRow(
                    //         icon: Icons.my_location,
                    //         title: 'Latitude',
                    //         value: '${destination?.location?.latitude ?? ''}',
                    //       ),

                    //       Divider(height: 1, color: Colors.blue.shade100),

                    //       _locationRow(
                    //         icon: Icons.my_location,
                    //         title: 'Longitude',
                    //         value: '${destination?.location?.longitude ?? ''}',
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // const SizedBox(height: 32),

                    // ==================================================
                    // BUTTONS
                    // ==================================================
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              side: BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: Icon(
                              Icons.bookmark_border,
                              color: AppColors.primary,
                            ),
                            label: Text(
                              'Save',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              side: const BorderSide(color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.share, color: Colors.blue),
                            label: const Text(
                              'Share',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          flex: 2,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.saffron,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.map_outlined),
                            label: const Text(
                              'Plan Trip',
                              style: TextStyle(fontWeight: FontWeight.bold),
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

  // ================================================================
  // HEADER IMAGE
  // ================================================================

  Widget _buildHeaderImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.trim().isEmpty) {
      return Container(
        color: Colors.grey.shade300,
        child: const Center(
          child: Icon(Icons.image_not_supported, size: 60, color: Colors.grey),
        ),
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Container(
          color: Colors.grey.shade300,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(
              Icons.image_not_supported,
              size: 55,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }

  // ================================================================
  // CIRCLE BUTTON
  // ================================================================

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.black54,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }

  // ================================================================
  // INFO BOX
  // ================================================================

  Widget _infoBox({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 24),

            const SizedBox(height: 8),
            CommonTextWidget(
              title: title,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),

            const SizedBox(height: 5),
            CommonTextWidget(
              title: value,
              fontSize: 12,
              color: AppColors.grey,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(height: 75, width: 1, color: Colors.grey.shade200);
  }

  Widget _sectionTitle(String title) {
    return CommonTextWidget(
      title: title,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }

  Widget _locationRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
