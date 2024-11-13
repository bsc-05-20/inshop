import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String title;
  final double rating;
  final double price;

  const Product({
    super.key,
    required this.title,
    required this.rating,
    required this.price,
  });

  // Map JSON data to Product model, with null check for rating
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['product_name'], // Use 'product_name' as column name in Supabase
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0, // Check if rating is null
      price: json['price'].toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text('$rating', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$$price', style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
