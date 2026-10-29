import 'package:flutter/material.dart';
import 'package:soukamin_shop/screens/products_details_screen.dart';
import 'package:soukamin_shop/widgets/list_custom.dart';
import 'package:soukamin_shop/service/products_service.dart';
import 'package:soukamin_shop/models/product_response.dart';

class ProductsScreen extends StatelessWidget {
  final ProductsService productsService;
  final ProductByIdService productByIdService;

  const ProductsScreen({
    super.key,
    required this.productsService,
    required this.productByIdService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: FutureBuilder<List<Product>>(
        future: productsService.getProducts(),
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

              return ListCustom(
                image: product.image,
                titleProduct: product.title,
                subtitleProduct: '${product.category} - ${product.price}',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductsDetailsScreen(
                        productId: product.id,
                        productByIdService: productByIdService,
                      ),
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
