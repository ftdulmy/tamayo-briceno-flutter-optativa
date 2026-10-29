import 'package:flutter/material.dart';
import 'package:soukamin_shop/themes/app_theme.dart';
import 'package:soukamin_shop/widgets/list_custom.dart';
import 'package:soukamin_shop/service/shopping_cart_service.dart';
import 'package:soukamin_shop/models/cart_response.dart';
import 'package:soukamin_shop/service/users_service.dart';
import 'package:soukamin_shop/models/user_response.dart';

class ShopingcartDetailsScreen extends StatefulWidget {
  final int cartId;
  final ShoppingCartService cartService;
  final UserByIdService userService;
  const ShopingcartDetailsScreen({
    super.key,
    required this.cartId,
    required this.cartService,
    required this.userService,
  });

  @override
  State<ShopingcartDetailsScreen> createState() => _ShopingcartDetailsScreen();
}

class _ShopingcartDetailsScreen extends State<ShopingcartDetailsScreen> {
  late final Future<({ShoppingCart cart, UserDto user})> _detailsFuture;

  @override
  void initState() {
    super.initState();
    _detailsFuture = _loadDetails();
  }

  Future<({ShoppingCart cart, UserDto user})> _loadDetails() async {
    final cart = await widget.cartService.getCartById(widget.cartId);
    final user = await widget.userService.getUserById(cart.userId);
    return (cart: cart, user: user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('Carrito #${widget.cartId}'),
      ),
      body: FutureBuilder<({ShoppingCart cart, UserDto user})>(
        future: _detailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No se encontró el carrito'));
          }

          final details = snapshot.data!;
          final cart = details.cart;
          final user = details.user;
          final total = cart.products.fold<double>(
            0,
            (sum, item) => sum + item.price * item.quantity,
          );

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(style: AppTheme.textH2, 'Carrito #${cart.id}'),
                  Text('Cliente: ${user.firstName} ${user.lastName}'),
                  Text('Email: ${user.email}'),
                  const SizedBox(height: 16.0),
                  Text(style: AppTheme.textH2, 'Artículos'),
                  if (cart.products.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text('Este carrito no tiene artículos.'),
                    ),
                  ...cart.products.map((item) {
                    return ListCustom(
                      image: item.thumbnail,
                      titleProduct: item.title,
                      subtitleProduct:
                          '\$${item.price.toStringAsFixed(2)} x ${item.quantity}',
                      trailing:
                          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
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
                      'TOTAL: \$${total.toStringAsFixed(2)}',
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
