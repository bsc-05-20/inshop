// lib/widgets/product.dart
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 175,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star_border_purple500_rounded, size: 18, color: Colors.orange),
                  Text('$rating Review', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              Text('\$$price', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('Add', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Buy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
