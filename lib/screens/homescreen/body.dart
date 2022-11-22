import 'package:caloriecounter/constants/constants.dart';
import 'package:caloriecounter/screens/homescreen/components/categoryScrollView.dart';
import 'package:caloriecounter/screens/homescreen/components/foodTile.dart';
import 'package:caloriecounter/utils/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/Category.dart';
import 'components/searchBar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                color: Color(0xFFCBCBCB),
              ),
              margin: EdgeInsets.only(top: size.height * 0.3),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              child: Image.network(
                                  "https://media-exp1.licdn.com/dms/image/C4D03AQEasXYhgJQmBw/profile-displayphoto-shrink_800_800/0/1637765445659?e=1674086400&v=beta&t=fZuz4PFV_WeyW7_qp7_ECziq_MynHhgjF1nYI6dIggo"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "How are you today?",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    searchBar(),
                    SizedBox(
                      height: 25,
                    ),
                    CategoryScrollView(onSelected: (Category category) {
                      print('Parent: ${category.name}');
                      // Compute a new product list based on selected category
                      setState(() {
                        filteredProducts = products;
                        filteredProducts = products.where((element) => element.category.name.contains(category.name)).toList();

                      });
                    }),
                    popularFoodAndViewAll(),
                    Container(
                      height: size.height * 0.4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            return Foodtile(

                              product: filteredProducts[index],
                            );
                          }),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding popularFoodAndViewAll() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Foods",
            style: TextStyle(fontSize: 24),
          ),
          TextButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "View all..>",
                  style: TextStyle(color: Colors.amber[900]),
                ),
              ))
        ],
      ),
    );
  }
}
