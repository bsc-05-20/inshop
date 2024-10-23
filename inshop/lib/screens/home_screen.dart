import 'package:flutter/material.dart';
import 'package:inshop/models/product_list.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/product.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // This function will be called when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on selected index
    switch (index) {
      case 0:
        // Navigate to Home (already on HomeScreen)
        break;
      case 1:
        // Navigate to Orders
        // Add your Orders screen navigation here
        break;
      case 2:
        // Navigate to Wishlist
        // Add your Wishlist screen navigation here
        break;
      case 3:
        // Navigate to Alerts
        // Add your Alerts screen navigation here
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'InShop',
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
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two products per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Product(
            imageUrl: product.imageUrl,
            title: product.title,
            rating: product.rating,
            price: product.price,
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
