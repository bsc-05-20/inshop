import 'package:flutter/material.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 1; // Set initial index to 1 for Orders

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Add padding to the left
            child: IconButton(
              icon: const Icon(Icons.search, size: 36),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Add padding to the right
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
              onPressed: () {
                // Add your cart functionality here
              },
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Your "Cart" is empty', // Text to indicate this is the Orders screen
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
