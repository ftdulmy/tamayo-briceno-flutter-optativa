import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soukamin_shop/api/products.dart';
import 'package:soukamin_shop/api/carts.dart';
import 'package:soukamin_shop/screens/products_screen.dart';
import 'package:soukamin_shop/screens/shopingcart_screen.dart';
import 'package:soukamin_shop/service/products_service.dart';
import 'package:soukamin_shop/service/shopping_cart_service.dart';
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/service/users_service.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 0;
  final http.Client _httpClient = http.Client();

  late final ProductsService _productsService = ProductsService(
    productsApi: ProductsApi(httpClient: _httpClient),
  );
  late final ProductByIdService _productByIdService = ProductByIdService(
    productByIdApi: ProductByIdApi(httpClient: _httpClient),
  );

  late final ShoppingCartsService _shoppingCartsService = ShoppingCartsService(
    shoppingCartsApi: ShoppingCartsApi(httpClient: _httpClient),
  );

  late final ShoppingCartService _shoppingCartService = ShoppingCartService(
    shoppingCartApi: ShoppingCartApi(httpClient: _httpClient),
  );
  late final UserByIdService _userByIdService = UserByIdService(
    userByIdApi: UserByIdApi(httpClient: _httpClient),
  );

  late final List<Widget> screens = [
    ProductsScreen(
      productsService: _productsService,
      productByIdService: _productByIdService,
    ),
    ShopingCartScreen(
      shoppingCartsService: _shoppingCartsService,
      cartService: _shoppingCartService,
      userService: _userByIdService,
    ),
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Productos'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
  ];

  @override
  void dispose() {
    _httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}
