import 'package:flutter/material.dart';
import 'package:inshop/screens/alerts_screen.dart';
import 'package:inshop/screens/deliveries_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/screens/sell_screen.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';
import 'package:inshop/widgets/logout_confirmation_dialog.dart'; // Import the dialog

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final int _selectedIndex = 1; // Set initial index to 1 for Orders

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
        break;
      case 1:
        // Already on Orders
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SellScreen()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DeliveryScreen()),
        );
        break;
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => LogoutConfirmationDialog(
        onConfirm: () {
          // Add log out functionality here
        },
        onCancel: () {
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 36),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notification_important_outlined, size: 36),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AlertsScreen()));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.manage_accounts_rounded, size: 38),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Logged in as Morten Msiska',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.black87),
                      SizedBox(width: 8),
                      Text(
                        'Settings',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black87),
                      SizedBox(width: 8),
                      Text(
                        'Log Out',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
              onSelected: (item) {
                switch (item) {
                  case 1:
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    break;
                  case 2:
                    _showLogoutDialog(); // Show the logout dialog
                    break;
                }
              },
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Sorry you have no new "Orders"',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
