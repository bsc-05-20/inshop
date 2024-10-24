class CartItem {
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

// Sample cart data
List<CartItem> cartItems = [
  CartItem(
    title: 'Car',
    imageUrl: 'assets/Car.png', // Replace with actual asset path
    price: 570.00,
    quantity: 20,
  ),
];
