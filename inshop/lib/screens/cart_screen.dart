import 'package:flutter/material.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 1; // Set initial index to 1 for Orders

  // Sample cart data
  final List<Map<String, dynamic>> cartItems = [
    {
      'imageUrl': 'assets/Car.jpg',
      'productName': 'Car',
      'quantity': 1,
      'price': 480.00,
    },
    // Add more items as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: const Icon(Icons.search, size: 36),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
              onPressed: () {
                // Add your cart functionality here
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return _buildCartItem(cartItems[index]);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Add checkout functionality here
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: Text(
            'Checkout for \$${totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                item['imageUrl'],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['productName'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Quantity: ${item['quantity']}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey), // Bold quantity
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${item['price'].toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
            // Quantity control buttons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      if (item['quantity'] > 1) {
                        item['quantity']--; // Decrease quantity
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      item['quantity']++; // Increase quantity
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Add remove item functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
