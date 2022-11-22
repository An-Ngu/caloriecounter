import 'package:caloriecounter/utils/Category.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  bool isSelected;

  CategoryTile({Key? key, required this.category, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? Colors.green : Colors.black),
            color: const Color(0x77FFFFFF)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Image.asset('assets/icons/' + category.icon)),
              Text(category.name),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
