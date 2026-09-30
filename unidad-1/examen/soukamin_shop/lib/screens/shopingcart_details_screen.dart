import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/carts.dart';
import 'package:soukamin_shop/api/products.dart';
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/themes/app_theme.dart';
import 'package:soukamin_shop/widgets/list_custom.dart';

class ShopingcartDetailsScreen extends StatefulWidget {
  final int cartId;
  const ShopingcartDetailsScreen({super.key, required this.cartId});

  @override
  State<ShopingcartDetailsScreen> createState() => _ShopingcartDetailsScreen();
}

class _ShopingcartDetailsScreen extends State<ShopingcartDetailsScreen> {
  late final Future<Map<String, dynamic>> _detailsFuture = _loadCartDetails();

  Future<Map<String, dynamic>> _loadCartDetails() async {
    final cart = await fetchCart(widget.cartId);
    final userFuture = await fetchUser(cart['userId']);
    final productsFuture = Future.wait<Map<String, dynamic>>(
      (cart['products'] as List<dynamic>).map((item) async {
        final product = await fetchProduct(item['productId']);
        return {'product': product, 'quantity': item['quantity']};
      }),
    );

    final user = await userFuture;
    final products = await productsFuture;
    return {'cart': cart, 'user': user, 'products': products};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('Carrito #${widget.cartId}'),
      ),
      body: FutureBuilder(
        future: _detailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final details = snapshot.data!;
          final user = details['user'];
          final products = details['products'] as List<Map<String, dynamic>>;

          final fullname =
              '${user['name']['firstname']} ${user['name']['lastname']}';
          final email = user['email'];

          final total = products.fold<double>(
            0,
            (sum, item) =>
                sum +
                (item['product']['price'] as num).toDouble() *
                    (item['quantity'] as num).toInt(),
          );

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(style: AppTheme.textH2, 'Cliente'),
                  Text('Nombre: $fullname'),
                  Text('Email: $email'),
                  const SizedBox(height: 16.0),
                  Text(style: AppTheme.textH2, 'Productos'),
                  ...products.map((item) {
                    final product = item['product'];
                    final quantity = item['quantity'];
                    return ListCustom(
                      image: product['image'],
                      titleProduct: product['title'],
                      subtitleProduct: '\$${product['price']} x $quantity',
                      trailing:
                          '\$${(product['price'] * quantity).toStringAsFixed(2)}',
                    );
                  }),
                  const SizedBox(height: 16.0),
                  Divider(),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      style: AppTheme.textH2,
                      textAlign: TextAlign.end,
                      'TOTAL: \$$total',
                    ),
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
