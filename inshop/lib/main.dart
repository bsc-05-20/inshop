import 'package:flutter/material.dart';
import 'package:inshop/screens/alerts_screen.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/orders_screen.dart';
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // This will be your HomeScreen without any extra text
    );
  }
}
