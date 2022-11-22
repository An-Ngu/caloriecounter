import 'package:caloriecounter/service/utils/fitbitToken.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../utils/fitbitdata.dart';

//provides fitbit client with valid access token
class FitbitService {
  FitbitToken fitbit;
  var headers = <String, String>{};
  var client = http.Client();
  String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzkzOEMiLCJzdWIiOiI4TjdESlIiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyYWN0IHJudXQiLCJleHAiOjE2Njg3MDE4OTAsImlhdCI6MTY2ODY3MzA5MH0.uvqdcnyqDF17cLhiDtfUOUqt1WMVBKwbQXx6EqAuSds";

  Uri uri = Uri();

  FitbitService(this.fitbit) {
    fitbit.accessToken = token;
    headers.addAll({'authorization': 'Bearer ${fitbit.accessToken}'});
    fitbit.authorization =
    "Basic MjM5MzhDOjdjMGY2ZWNkYTBlMmFiYmI1MDNiNzgwYTk4NzQ2ZmY1";
  }

  getdata() async {
    var params = {
      'afterDate': '2022-11-17',
      'sort': 'asc',
      'offset': '0',
      'limit': '50',
    };

    uri = Uri.https("api.fitbit.com", "/1/user/-/activities/list.json", params);
    //var response = await client.get(uri, headers: headers);
    String test = ("https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=23938C&redirect_uri=http://localhost&scope=activity%20nutrition");
    Uri uri2 = Uri.parse(test);
    var response = await client.get(uri2);
    print(response..toString());
    //getResponse(response);
  }

  getResponse(Response response) {
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return dataFromJson(json);
    } //if expires, create new access token out of fitbitToken class
    if (response.statusCode == 401) {
      generateNewAccesToken();
      print(response.body);
      print("Creating new Acces token... (No Code yet)");}
 else {
      print( "Maybe Syntax Error?");
      print(response.body);
    }
  }

  generateNewAccesToken() {
    print("test");
  }

}

//get access token
//get refresh access token
