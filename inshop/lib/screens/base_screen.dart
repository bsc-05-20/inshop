import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/widgets/bottomnavigation.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class BaseScreen extends StatelessWidget {
  final Widget child; // The screen content

  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'InShop',
          style: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 36,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_sharp,
              size: 36,
            ),
            onPressed: () {
              // Navigate to CartScreen when cart icon is pressed
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.manage_accounts_rounded,
                size: 38,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: child, // The main content of the screen
      bottomNavigationBar: const BottomNavigation(), // Add the bottom navigation
    );
  }
}
