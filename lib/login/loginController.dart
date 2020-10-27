import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LoginController {
  final String _loginURL = 'http://lifewithyou.online/manag/api/v1/login';

  userLogin({@required phone, @required password}) async {
    Map<String, dynamic> _formData = {'phone': phone, 'password': password};
    var response = await http.post(_loginURL,
        headers: {'Accept': 'application/json'}, body: _formData);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      print(response.body);
    }
  }
}
