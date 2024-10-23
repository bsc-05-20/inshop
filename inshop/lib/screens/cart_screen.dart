import 'package:flutter/material.dart';
import 'package:inshop/screens/base_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Center(
        child: Text(
          'Cart Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
