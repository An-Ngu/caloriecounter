import 'dart:convert';

import 'package:caloriecounter/utils/Post.dart';
import 'package:http/http.dart' as http;

import 'utils/ProductApi.dart';

class RequestService {
  RequestService(this.id);



  String id;
  Future<Object> getData() async {
    var client = http.Client();

    var uriFoodFacts =
        Uri.parse('https://world.openfoodfacts.org/api/v0/product/$id');
    var response = await client.get(uriFoodFacts);
    if (response.statusCode == 200) {
      var json = response.body;
      if (json.contains("product not found")) {
        return "Produkt nicht gefunden.";
      } else {
        return productFromJson(json);
      }
    }
    return "Hat nischt funktioniert..";
  }


}
