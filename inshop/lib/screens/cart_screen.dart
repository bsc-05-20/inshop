import 'package:flutter/material.dart';
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
            padding:
                const EdgeInsets.only(left: 16.0), // Add padding to the left
            child: IconButton(
              icon: const Icon(Icons.search, size: 36),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 16.0), // Add padding to the right
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
              onPressed: () {
                // Add your cart functionality here
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 200, // Specify the height
          width: 300, // Specify the width
          color: Colors.blue, // Specify the background color
          child: const Center(
            child: Text(
              'This is your cart screen',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Add checkout functionality here
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            backgroundColor: Colors.green, // Button background color
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: const Text(
            'Checkout for \$480.00',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
