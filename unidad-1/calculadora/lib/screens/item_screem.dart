import 'package:calculadora/widgets/add_product.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 3')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: const Text(
                  'Nombre del producto',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Image.network(
                  'https://www.coca-cola.com/content/dam/onexp/us/en/brands/minute-maid/products/orange-juice/premium-original-orange-juice-packshot.png',
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: const Text(
                  'Precio: \$10000',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: const Text(
                  'Descripción del producto',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit torquent ante metus, pulvinar fames praesent pellentesque suscipit ut mattis gravida vulputate massa, tempor sed lacinia id risus at leo malesuada eleifend.',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              AddProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
