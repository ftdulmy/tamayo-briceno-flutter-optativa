class ShoppingCart {
  final int id;
  final int userId;
  final List<ShoppingItem> products;

  ShoppingCart({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory ShoppingCart.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List<dynamic>? ?? [];
    final products = productsJson
        .map((item) => ShoppingItem.fromJson(item as Map<String, dynamic>))
        .toList();

    return ShoppingCart(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      products: products,
    );
  }
}

class ShoppingItem {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final String thumbnail;

  ShoppingItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] as num? ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
