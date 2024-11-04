// lib/models/product_model.dart
class ProductModel {
  final String imageUrl;
  final String title;
  final double rating;
  final double price;
  final String category; // Add this line to define the category

  ProductModel({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
    required this.category, // Update constructor
  });
}
