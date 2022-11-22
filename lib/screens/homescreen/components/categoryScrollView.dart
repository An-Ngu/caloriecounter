import 'package:caloriecounter/utils/Category.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'categoryTile.dart';

class CategoryScrollView extends StatefulWidget {
  Function onSelected;

  CategoryScrollView({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<CategoryScrollView> createState() => _CategoryScrollViewState();
}

class _CategoryScrollViewState extends State<CategoryScrollView> {
  int? _selectedIndex;
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,

      child:
          Expanded(
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          selectedCategory = categories[_selectedIndex!];
                        });
                        widget.onSelected(selectedCategory);
                        //
                      },
                      child: CategoryTile(
                        isSelected: index == _selectedIndex,
                        category: categories[index],
                      ));
                }),
          )
        ,
      );

  }
}
