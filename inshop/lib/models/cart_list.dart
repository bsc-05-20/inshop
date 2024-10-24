// lib/data/product_list.dart
import 'package:inshop/models/cart_product_model.dart';

final List<CartProductModel> cartItems = [
  CartProductModel(
    imageUrl: 'assets/House2.jpg',
    title: 'House 2',
    quantity: 30,
    price: 500000,
  ),
  CartProductModel(
    imageUrl: 'assets/Bike.jpg', 
    title: 'Bike',
    quantity: 20,
    price: 3000,
  ),
  CartProductModel(
    imageUrl: 'assets/Car.jpg', 
    title: 'Car',
    quantity: 25,
    price: 16000,
  ),
  // Add more products as needed
];
