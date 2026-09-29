import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/products.dart';
import 'package:soukamin_shop/screens/products_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Eror: ${snapshot.error}'));
          }

          final products = snapshot.data ?? [];

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network(product['image'], fit: BoxFit.contain),
                ),
                title: Text(product['title']),
                subtitle: Text('${product['category']} - ${product['price']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductsDetailsScreen(productId: product['id']),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
