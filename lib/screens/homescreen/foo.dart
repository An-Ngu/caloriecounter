import 'package:flutter/material.dart';

class Foo extends StatelessWidget {
  final String name;

  const Foo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.red),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
