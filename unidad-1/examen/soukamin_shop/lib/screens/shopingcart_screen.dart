import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/carts.dart';

class ShopingCartScreen extends StatelessWidget {
  const ShopingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de compras')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCarts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Eror: ${snapshot.error}'));
          }

          final carts = snapshot.data ?? [];
        },
      ),
    );
  }
}
