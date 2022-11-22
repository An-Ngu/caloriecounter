import 'package:caloriecounter/screens/detailScreen.dart';
import 'package:caloriecounter/utils/Product.dart';
import 'package:flutter/material.dart';

class Foodtile extends StatelessWidget {
  final Product product;

  Foodtile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(product: this.product)));
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
                color: Color(0x38FFFFFF),
              ),
              width: size.width * 0.4,
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFFFFFFF),
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.08),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/icons/" + product.icon),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        product.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_pin),
                          Expanded(
                            child: Text(
                              "Hamburg, Tondernstieg 5",
                              style: TextStyle(fontSize: 8),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ])),
        ));
  }
}
