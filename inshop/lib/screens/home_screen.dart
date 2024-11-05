import 'package:flutter/material.dart';
import 'package:inshop/models/product_list.dart';
import 'package:inshop/screens/alerts_screen.dart';
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/screens/orders_screen.dart';
import 'package:inshop/screens/sell_screen.dart';
import 'package:inshop/screens/deliveries_screen.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/product.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';
import 'package:inshop/widgets/logout_confirmation_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrdersScreen()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SellScreen()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DeliveryScreen()));
        break;
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => LogoutConfirmationDialog(
        onConfirm: () {
          // Log out functionality
        },
        onCancel: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _goToPreviousTab() {
    if (_tabIndex > 0) {
      setState(() {
        _tabIndex--;
        _tabController.animateTo(_tabIndex);
      });
    }
  }

  void _goToNextTab() {
    if (_tabIndex < _tabController.length - 1) {
      setState(() {
        _tabIndex++;
        _tabController.animateTo(_tabIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'InShop',
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notification_important_outlined, size: 36),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AlertsScreen()));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    break;
                  case 2:
                    _showLogoutDialog();
                    break;
                }
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _goToPreviousTab,
              ),
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Electronics'),
                    Tab(text: 'Estate'),
                    Tab(text: 'Clothes'),
                    Tab(text: 'Shoes'),
                    Tab(text: 'Cars'),
                    Tab(text: 'Accessories'),
                    Tab(text: 'Furniture'),
                    Tab(text: 'Sports'),
                  ],
                  isScrollable: true,
                  onTap: (index) {
                    setState(() {
                      _tabIndex = index;
                    });
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: _goToNextTab,
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCategoryView('Electronics'),
          _buildCategoryView('Estate'),
          _buildCategoryView('Clothes'),
          _buildCategoryView('Shoes'),
          _buildCategoryView('Cars'),
          _buildCategoryView('Accessories'),
          _buildCategoryView('Furniture'),
          _buildCategoryView('Sports'),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryView(String category) {
    final filteredProducts = products.where((product) => product.category == category).toList();
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return Product(
          imageUrl: product.imageUrl,
          title: product.title,
          rating: product.rating,
          price: product.price,
        );
      },
    );
  }
}
