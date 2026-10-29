import 'package:flutter/material.dart';
import 'package:soukamin_shop/models/cart_response.dart';
import 'package:soukamin_shop/screens/shopingcart_details_screen.dart';
import 'package:soukamin_shop/service/shopping_cart_service.dart';
import 'package:soukamin_shop/widgets/list_custom.dart';
import 'package:soukamin_shop/service/users_service.dart';

class ShopingCartScreen extends StatelessWidget {
  final ShoppingCartsService shoppingCartsService;
  final ShoppingCartService cartService;
  final UserByIdService userService;
  const ShopingCartScreen({
    super.key,
    required this.shoppingCartsService,
    required this.cartService,
    required this.userService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carritos de compras')),
      body: FutureBuilder<List<ShoppingCart>>(
        future: shoppingCartsService.getCarts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Eror: ${snapshot.error}'));
          }

          final carts = snapshot.data ?? [];

          return ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index) {
              final cart = carts[index];

              return ListCustom(
                image: 'https://www.graphicsfuel.com/wp-content/uploads/2012/01/shopping-cart-icon-515.png',
                titleProduct: 'Cliente - ${cart.userId}',
                subtitleProduct: 'Click para ver detalles',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopingcartDetailsScreen(
                        cartId: cart.id,
                        cartService: cartService,
                        userService: userService,
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
