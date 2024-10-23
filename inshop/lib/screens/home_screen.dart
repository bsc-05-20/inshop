// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:inshop/models/product_list.dart';
import 'package:inshop/widgets/product.dart'; // Import your Product widget
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        itemCount: products.length, // Get the number of products
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
    );
  }
}
