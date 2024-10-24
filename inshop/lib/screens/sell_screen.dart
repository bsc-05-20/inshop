import 'package:flutter/material.dart';
import 'package:inshop/screens/alerts_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/home_screen.dart'; // Import HomeScreen
import 'package:inshop/screens/orders_screen.dart'; // Import OrdersScreen
import 'package:inshop/screens/deliveries_screen.dart'; // Import AlertsScreen
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  int _selectedIndex = 2; // Set initial index to 2 for Wishlist

  // This function will be called when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // Navigate to Home
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
        break;
      case 1:
        // Navigate to Orders
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OrdersScreen()),
        );
        break;
      case 2:
        // Already on Wishlist
        break;
      case 3:
        // Navigate to Alerts
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DeliveryScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  automaticallyImplyLeading: false, // This removes the back arrow
  title: const Text(
    'Sell',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.search, size: 36),
      onPressed: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
    ),
    IconButton(
      icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
    ),
              IconButton(
            icon: const Icon(Icons.notification_important_outlined, size: 36),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AlertsScreen()));
            },
          ),
    Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: IconButton(
        icon: const Icon(Icons.manage_accounts_rounded, size: 38),
                      onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
      ),
    ),
  ],
),

      body: const Center(
        child: Text(
          'Add product to Sell',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
