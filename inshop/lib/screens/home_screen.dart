import 'package:flutter/material.dart';
import 'package:inshop/widgets/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final supabase = Supabase.instance.client;

  // Fetch products by category from Supabase
  Future<List<Product>> _fetchProducts(String category) async {
    try {
      final response = await supabase
          .from('Product') // Ensure this matches your actual table name
          .select('id, imageUrl, title, rating, price') // Specify columns explicitly
          .eq('category', category)
          .limit(10);

      if (response == null) {
        print('Error: No data received');
        return [];
      }

      // Convert response data to a list of Product objects
      final data = response as List<dynamic>;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      print('Unexpected error: $e');
      return [];
    }
  }

  Widget _buildCategoryView(String category) {
    return FutureBuilder<List<Product>>(
      future: _fetchProducts(category), // Ensure the category is passed
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
              imageUrl: product.imageUrl,
              title: product.title,
              rating: product.rating,
              price: product.price,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {}); // Refresh the FutureBuilder by calling setState
            },
          ),
        ],
      ),
      body: _buildCategoryView('electronics'), // Replace 'electronics' with an actual category
    );
  }
}
