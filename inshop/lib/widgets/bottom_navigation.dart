// lib/widgets/bottom_navigation.dart
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex; // Track the selected index
  final Function(int) onItemTapped; // Callback to handle item taps

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(0, 0, 0, 0.541),
      unselectedItemColor: Colors.black,
      currentIndex: selectedIndex, // Use the selected index passed in
      selectedLabelStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      onTap: onItemTapped, // Call the callback on item tap
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
    );
  }
}
