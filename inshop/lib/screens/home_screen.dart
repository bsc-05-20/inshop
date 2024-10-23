import 'package:flutter/material.dart';
import 'package:inshop/screens/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 20.0, // Horizontal space between items
            runSpacing: 20.0, // Vertical space between rows
            children: [
              // Add multiple instances of the Product widget
              //Product(),
              // Add more Product widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
