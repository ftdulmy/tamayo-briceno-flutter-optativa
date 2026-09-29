import 'package:flutter/material.dart';

class ShopingCartScreen extends StatelessWidget {
  const ShopingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de compras')),
      body: Center(child: Text("Pantalla de carrito")),
    );
  }
}
