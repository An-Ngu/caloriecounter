import 'package:caloriecounter/utils/Category.dart';
import 'package:caloriecounter/utils/Product.dart';
import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF3C531E);
Color kPrimaryColorFont = const Color(0xFF000000);

List<String> sorts = <String>['Vegetables', 'Rice', 'Fruit', 'Noodles'];

List<Category> categories = <Category>[
  Category("burger.png", "Junk"),
  Category("diet.png", "Diet"),
  Category("vegan.png", "Vegan")
];

List<Product> products = <Product>[
  Product("apple.png","Apfel", Category.name("Diet")),
  Product("pear.png","Birne", Category.name("Diet")),
  Product("cherry.png","Kirsche", Category.name("Diet")),
  Product("burger.png","Burger", Category.name("Junk")),
  Product("french-fries.png","Pommes", Category.name("Junk")),
  Product("pizza.png","Pizza", Category.name("Junk")),
  Product("tofu.png","Tofu", Category.name("Vegan")),


];
