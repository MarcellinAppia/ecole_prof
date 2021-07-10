import 'package:http/http.dart' as http;

class Constant {
  static const String URL = "backend-ecole-yapi.herokuapp.com";
  static const String loginRoute = "$URL/login";
  static const String patchRoute = "$URL/api/v1/parents/id";

  static const headers = {
//"apiKey": "",
    "content-Type": "application/json"
   
  };
}
