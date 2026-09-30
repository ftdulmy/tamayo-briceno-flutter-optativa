import 'package:flutter/material.dart';

class ListCustom extends StatelessWidget {
  final String image;
  final String titleProduct;
  final String subtitleProduct;
  final String? trailing;
  final VoidCallback? onTap;

  const ListCustom({
    super.key,
    required this.image,
    required this.titleProduct,
    required this.subtitleProduct,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 60,
        height: 60,
        child: Image.network(image, fit: BoxFit.contain),
      ),
      title: Text(titleProduct),
      subtitle: Text(subtitleProduct),
      trailing: trailing != null ? Text(trailing!) : null,
      onTap: onTap,
    );
  }
}
