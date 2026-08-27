import 'dart:convert';

import 'package:experience_india/features/explore/models/explore_get_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// class ExploreController extends GetxController {
//   final RxList<ExploreGetAllModel> destinations = <ExploreGetAllModel>[].obs;

//   final RxList<ExploreGetAllModel> filteredDestinations =
//       <ExploreGetAllModel>[].obs;

//   // Initially All is selected
//   final RxString selectedCategory = 'All'.obs;

//   Future<void> loadDestinations() async {
//     try {
//       final jsonString = await rootBundle.loadString(
//         'assets/json/destinations-backup.json',
//       );

//       final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

//       final loadedDestinations = decoded.values
//           .whereType<List<dynamic>>()
//           .expand(
//             (stateDestinations) =>
//                 stateDestinations.whereType<Map<String, dynamic>>(),
//           )
//           .map((json) => ExploreGetAllModel.fromJson(json))
//           .toList();

//       destinations.assignAll(loadedDestinations);

//       // Initially show ALL destinations
//       filteredDestinations.assignAll(loadedDestinations);
//     } catch (e) {
//       print("Explore JSON Error: $e");
//     }
//   }

//   List<String> get categories {
//     return destinations
//         .map((item) => item.category)
//         .whereType<String>()
//         .where((category) => category.isNotEmpty)
//         .toSet()
//         .toList();
//   }

//   void filterByCategory(String category) {
//     selectedCategory.value = category;

//     if (category == 'All') {
//       filteredDestinations.assignAll(destinations);
//       return;
//     }

//     final result = destinations.where(
//       (destination) =>
//           destination.category?.toLowerCase() == category.toLowerCase(),
//     );

//     filteredDestinations.assignAll(result);
//   }
// }

class ExploreController extends GetxController {
  final RxList<ExploreGetAllModel> destinations = <ExploreGetAllModel>[].obs;

  final RxList<ExploreGetAllModel> filteredDestinations =
      <ExploreGetAllModel>[].obs;

  final RxString selectedCategory = 'All'.obs;

  List<ExploreGetAllModel> currentFilteredList = [];

  final int pageSize = 10;
  int currentPage = 1;

  final RxBool isLoadingMore = false.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();

    super.onClose();
  }

  Future<void> loadDestinations() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/json/destinations-backup.json',
      );

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

      final loadedDestinations = decoded.values
          .whereType<List<dynamic>>()
          .expand(
            (stateDestinations) =>
                stateDestinations.whereType<Map<String, dynamic>>(),
          )
          .map((json) => ExploreGetAllModel.fromJson(json))
          .toList();

      destinations.assignAll(loadedDestinations);

      currentFilteredList = loadedDestinations;

      currentPage = 1;

      _loadFirstPage();
    } catch (e) {
      debugPrint("Explore JSON Error: $e");
    }
  }

  List<String> get categories {
    return destinations
        .map((item) => item.category)
        .whereType<String>()
        .where((category) => category.isNotEmpty)
        .toSet()
        .toList();
  }

  void _loadFirstPage() {
    final firstPage = currentFilteredList.take(pageSize).toList();

    filteredDestinations.assignAll(firstPage);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 300) {
      loadMore();
    }
  }

  Future<void> loadMore() async {
    if (isLoadingMore.value) return;

    // No more data
    if (filteredDestinations.length >= currentFilteredList.length) {
      return;
    }

    isLoadingMore.value = true;

    try {
      await Future.delayed(const Duration(milliseconds: 300));

      // Start from currently loaded count
      final startIndex = filteredDestinations.length;

      final nextItems = currentFilteredList
          .skip(startIndex)
          .take(pageSize)
          .toList();

      if (nextItems.isNotEmpty) {
        filteredDestinations.addAll(nextItems);

        currentPage++;
      }
    } finally {
      isLoadingMore.value = false;
    }
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;

    currentPage = 1;

    if (category == 'All') {
      currentFilteredList = destinations.toList();
    } else {
      currentFilteredList = destinations
          .where(
            (destination) =>
                destination.category?.toLowerCase() == category.toLowerCase(),
          )
          .toList();
    }

    _loadFirstPage();

    // Start list from top after changing category
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  void searchDestinations(String query) {
    final search = query.trim().toLowerCase();

    if (search.isEmpty) {
      filterByCategory(selectedCategory.value);
      return;
    }

    final categoryFiltered = selectedCategory.value == 'All'
        ? destinations.toList()
        : destinations
              .where(
                (destination) =>
                    destination.category?.toLowerCase() ==
                    selectedCategory.value.toLowerCase(),
              )
              .toList();

    final results = categoryFiltered.where((destination) {
      return destination.name?.toLowerCase().contains(search) == true ||
          destination.state?.toLowerCase().contains(search) == true ||
          destination.category?.toLowerCase().contains(search) == true;
    }).toList();

    currentFilteredList = results;
    currentPage = 1;

    filteredDestinations.assignAll(results.take(pageSize).toList());
  }
}
