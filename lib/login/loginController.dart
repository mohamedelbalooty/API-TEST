import 'package:api/login/loginModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LoginController {
  final String _loginURL = 'http://lifewithyou.online/manag/api/v1/login';
  LoginModel _loginModel = LoginModel();

  Future<LoginModel> userLogin({@required phone, @required password}) async {
    Map<String, dynamic> _formData = {'phone': phone, 'password': password};
    var response = await http.post(_loginURL,
        headers: {'Accept': 'application/json'}, body: _formData);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (_loginModel.state == "1") {
      _loginModel = LoginModel.fromJson(jsonData);
    } else {
      _loginModel = LoginModel(state: jsonData['state'], msg: jsonData['msg'], data: jsonData['data']);
    }
    return _loginModel;
  }
}
