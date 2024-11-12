import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final double price;

  const Product({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
  });

  // Map JSON data to Product model
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imageUrl: json['imageUrl'],
      title: json['title'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return a widget to represent the product
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl), // Display the image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge, // Updated to titleLarge
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text('$rating', style: TextStyle(fontSize: 16)),
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
