import 'package:flutter/material.dart';
import 'package:soukamin_shop/screens/products_screen.dart';
import 'package:soukamin_shop/screens/shopingcart_screen.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 0;

  final List<Widget> screens = const [ProductsScreen(), ShopingCartScreen()];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Productos'),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      label: 'Carrito',
    ),
  ];

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
