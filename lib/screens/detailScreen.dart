import 'package:caloriecounter/utils/Product.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  Product product;

  DetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_return_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [Image.asset("assets/icons/${product.icon}")],
          ),
        ),
      ),
    );
  }
}
