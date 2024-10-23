import 'package:flutter/material.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedIndex = 1; // Set initial index to 1 for Orders

  // This function will be called when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on selected index
    switch (index) {
      case 0:
        // Navigate to Home
        Navigator.of(context).pushReplacementNamed('/home'); // Example navigation
        break;
      case 1:
        // Already on Orders
        break;
      case 2:
        // Navigate to Wishlist
        Navigator.of(context).pushReplacementNamed('/wishlist'); // Example navigation
        break;
      case 3:
        // Navigate to Alerts
        Navigator.of(context).pushReplacementNamed('/alerts'); // Example navigation
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Wishlist Screen', // Text to indicate this is the Orders screen
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
