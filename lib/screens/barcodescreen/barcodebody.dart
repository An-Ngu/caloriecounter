import 'dart:convert';
import 'package:caloriecounter/constants/constants.dart';
import 'package:caloriecounter/screens/barcodescreen/components/ScanTile.dart';
import 'package:caloriecounter/screens/homescreen/components/categoryScrollView.dart';
import 'package:caloriecounter/screens/homescreen/components/foodTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/testRequestService.dart';
import '../../service/utils/ProductApi.dart';
import '../../utils/Category.dart';
import '../homescreen/components/searchBar.dart';

class BarcodeBody extends StatefulWidget {
  BarcodeBody({Key? key}) : super(key: key);

  @override
  State<BarcodeBody> createState() => _BarcodeBodyState();
}

class _BarcodeBodyState extends State<BarcodeBody> {
  List<Product> products = [];
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    loadProductFromStorage();
  }

  void storeProducts(List<dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('scannedProducts', jsonEncode(data));
  }

  Future<List<dynamic>> getStoredProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> data = jsonDecode(prefs.getString('scannedProducts') ?? '{}');
    return data;
  }

  void loadProductFromStorage() async {
    List<dynamic> data = await getStoredProducts();
    List<Product> p = [];
    for (Map<String, dynamic> d in data) {
      p.add(Product.fromJson(d));
    }
    setState(() {
      products = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: Color(0xFFB6B6B6),
                ),
                margin: EdgeInsets.only(top: size.height * 0.3),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Recent Scans",
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  products.isEmpty
                      ? Center(child: TextButton(onPressed: () { 
                        simulateProduct();
                  }, child: Text("Simulate Product"),),)
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ScanTile(
                                  product: products[index],
                                  onPressed: (String productCode) {
                                    setState(() {
                                      products.removeWhere(
                                        (element) =>
                                            element.product.code == productCode,
                                      );
                                      storeProducts(products);

                                    });
                                  },
                                );
                              }),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scanBarcode();
        },
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future scanBarcode() async {
    String result;

    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      result = "Failed to get platform version.";
    }
    getdataPost(result);
  }

  getdataPost(String id) async {
    if (await RequestService(id).getData() is Product) {
      Product data = await RequestService(id).getData() as Product;

      if (data.product != null) {
        // Checks if product (by code) is already in the list
        products.removeWhere(
            (element) => element.product.code == data.product.code);

        storeProducts(products);

        setState(() {
          products.add(data);
          // Newest to top.
          products = products.reversed.toList();
        });

        List<Map<String, dynamic>> jsonList = [];
        for (Product p in products) {
          jsonList.add(p.toJson());
        }
        storeProducts(jsonList);
      } else {
        print("Product has not a name. ${data.product.productName}");
      }
    }
  }

  void simulateProduct() {
    getdataPost("20224462");
  }
}
