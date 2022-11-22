import 'package:flutter/material.dart';

class Category{

  String _icon = "";
  String _name;
  bool _isselected = false;

  bool get isselected => _isselected;

  set isselected(bool value) {
    _isselected = value;
  }

  Category.name(this._name);

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  Category(this._icon, this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
