// lib/models/product_model.dart
class CartProductModel {
  final String imageUrl;
  final String title;
  final double quantity;
  final double price;

  CartProductModel({
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.price,
  });
}
