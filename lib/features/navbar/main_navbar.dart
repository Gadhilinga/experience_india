import 'package:experience_india/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../explore/explore_screen.dart';
import '../home/home_screen.dart';
import '../planner/planner_screen.dart';
import '../profile/screens/profile_screen.dart';
import '../saved/saved_screen.dart';
import '../ai/ai_planner_screen.dart';

class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const SavedScreen(),
    const ProfileScreen(),

    // const AIPlannerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: AppColors.appColor,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
