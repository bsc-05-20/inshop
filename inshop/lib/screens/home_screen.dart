import 'package:flutter/material.dart';
import 'package:inshop/screens/deliveries_screen.dart';
import 'package:inshop/screens/orders_screen.dart';
import 'package:inshop/screens/sell_screen.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/custom_app_bar.dart';
import 'package:inshop/widgets/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final supabase = Supabase.instance.client;
  int _selectedIndex = 0; // Track the selected index

  // Fetch products by category from Supabase
  Future<List<Product>> _fetchProducts(String category) async {
    try {
      final data = await supabase
          .from('product')
          .select('id, product_name, price, rating, imageUrl')
          .limit(10);

      if ((data as List<dynamic>).isEmpty) {
        return [];
      }

      return (data as List<dynamic>)
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Widget _buildCategoryView(String category) {
    return FutureBuilder<List<Product>>(
      future: _fetchProducts(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products found.'));
        }
        final products = snapshot.data!;
        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Product(
              title: product.title,
              rating: product.rating,
              price: product.price,
              imageUrl: product.imageUrl,
            );
          },
        );
      },
    );
  }

  // Navigation handling for bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OrdersScreen()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SellScreen()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DeliveryScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'), // Use the reusable AppBar
      body: _selectedIndex == 0
          ? _buildCategoryView('cars') // Replace with a valid category
          : Center(
              child: Text(
                  'Screen $_selectedIndex')), // Placeholder for other screens
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
