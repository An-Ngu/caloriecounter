import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../service/requestService.dart' as http;
import '../utils/Post.dart';
class RequestService{
  Future<List<Posts>?> getData() async{

    var client = http.Client();
    String url = "https://jsonplaceholder.typicode.com/posts";
    var uri = Uri.parse(url);
    var response = await client.get(uri);
    if(response.statusCode==200){
      var json = response.body;
      return postsFromJson(json);
    }
  }
}