import 'package:caloriecounter/utils/Category.dart';

class Product{
  String _name;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String icon;
  Category _category;

  Product(this.icon,this._name, this._category);

  Category get category => _category;

  set category(Category value) {
    _category = value;
  }
}

