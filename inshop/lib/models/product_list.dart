// lib/data/product_list.dart
import 'package:inshop/models/product_model.dart';

final List<ProductModel> products = [
  ProductModel(
    imageUrl: 'assets/House2.jpg',
    title: 'House 2',
    rating: 5.1,
    price: 500000.0,
  ),
  ProductModel(
    imageUrl: 'assets/Bike.jpg', // Add a valid image asset path
    title: 'Bike',
    rating: 4.5,
    price: 3000.0,
  ),
  // Add more products as needed
];
