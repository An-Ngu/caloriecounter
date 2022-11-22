import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: ThemeData(
            primaryColor: Colors.white38,
            primaryColorDark: Colors.orange),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: (BorderRadius.circular(20))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blueGrey, width: 1),
                borderRadius: BorderRadius.circular(20)),
            hintText: 'Search..',
          ),
        ),
      ),
    );;
  }
}
