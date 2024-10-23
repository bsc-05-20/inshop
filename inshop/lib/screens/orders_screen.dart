// Example for OrdersScreen
import 'package:flutter/material.dart';
import 'package:inshop/screens/alerts_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/screens/wishlist_screen.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _selectedIndex = 1; // Set initial index to 1 for Orders

  // This function will be called when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    // Navigate and update the selected index
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
        break;
      case 1:
        // Already on Orders
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const WishlistScreen()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AlertsScreen()),
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
    'Orders',
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
          'Orders Screen',
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
