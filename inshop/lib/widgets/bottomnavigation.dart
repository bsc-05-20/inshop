import 'package:flutter/material.dart';
import 'package:inshop/screens/home_screen.dart';

class BottomNavigation extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const BottomNavigation({super.key})
      : preferredSize = const Size.fromHeight(56.0);

  @override
  State<BottomNavigation> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigation> {
  int currentIndex = 0; // Current index of the selected item

  // List of screens to navigate to

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(0, 0, 0, 0.541),
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        selectedLabelStyle: const TextStyle(
          fontSize: 18.0, // Size for selected label
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14.0, // Size for unselected label
          fontWeight: FontWeight.bold,
        ),

        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.store,
              size: 36.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(
              Icons.work_history_outlined,
              size: 36.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Wishlist',
            icon: Icon(
              Icons.favorite_border,
              size: 36.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Alerts',
            icon: Icon(
              Icons.notification_important_outlined,
              size: 36.0,
            ),
          ),
        ],
      ),
    );
  }
}
