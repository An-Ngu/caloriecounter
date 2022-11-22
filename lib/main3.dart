import 'package:caloriecounter/service/fitbitService.dart';
import 'package:caloriecounter/service/testRequestService.dart';
import 'package:caloriecounter/service/utils/ProductApi.dart';
import 'package:caloriecounter/utils/FitbitDaily.dart';
import 'package:caloriecounter/utils/fitbitdata.dart';
import 'package:flutter/material.dart';

import 'service/utils/fitbitToken.dart';
import 'utils/Post.dart';

void main() {
  print(Colors.red.toString());
  getdataPost();
}

void testAppLink() {}

getdataPost() async {
  if (await RequestService("asd").getData() is Product) {
    Product data = await RequestService("asd").getData() as Product;
    (data.product.productName.length > 0)
        ? print(data.product.productName )
        : print(data.product.toString());
  } else {
    var data = await RequestService("asd").getData();
    print(data.toString());
  }
}

getdata() async {
  var data = await FitbitService(FitbitToken()).getdata();

  // var steps = 0;
  // for (var value in data.activities) {
  //   print("Steps for ${value.lastModified} ${value.steps}");
  //   steps = steps + value.steps;
  // }
  // print(steps);
}
