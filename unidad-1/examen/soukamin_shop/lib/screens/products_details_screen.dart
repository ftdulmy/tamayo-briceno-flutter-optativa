import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/products.dart';
import 'package:soukamin_shop/themes/app_theme.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int productId;
  const ProductsDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Detalle del producto'),
      ),
      body: FutureBuilder(
        future: fetchProduct(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Eror: ${snapshot.error}'));
          }

          final product = snapshot.data ?? [];

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(style: AppTheme.textH2, product['title']),
                  const SizedBox(height: 36.0),
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Image.network(product['image'], fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 36.0),
                  Text(textAlign: TextAlign.center, product['description']),
                  const SizedBox(height: 24.0),
                  Text(style: AppTheme.textH1, 'Precio: \$${product['price']}'),
                  const SizedBox(height: 24.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('Agregar'),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline),
                          label: Text('Elininar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
