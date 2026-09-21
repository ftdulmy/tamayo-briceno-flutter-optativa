import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _quantityController = TextEditingController(
    text: '0',
  );

  void _incrementQuantity() {
    int currentQuantity = int.tryParse(_quantityController.text) ?? 0;

    setState(() {
      _quantityController.text = (currentQuantity + 1).toString();
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: true,
            controller: _quantityController,
            decoration: const InputDecoration(labelText: 'Cantidad'),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ElevatedButton(
            onPressed: _incrementQuantity,
            child: const Text('+'),
          ),
        ),
      ],
    );
  }
}
