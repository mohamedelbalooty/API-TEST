import 'package:api/secreens/register/registerModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class RegisterController {
  final String _registerURL = 'http://lifewithyou.online/manag/api/v1/register';
  RegisterModel _registerModel = RegisterModel();

  Future<RegisterModel> userRegister(
      {@required userName,
      @required phone,
      @required password,
      @required passwordConfirmation}) async {
    Map<String, dynamic> _formData = {
      'username': userName,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation
    };
    var response = await http.post(_registerURL,
        headers: {'Accept': 'application/json'}, body: _formData);
    var jsonData = jsonDecode(response.body);
    if (_registerModel.state == '1') {
      _registerModel = RegisterModel.fromJson(jsonData);
    } else {
      _registerModel =
          RegisterModel(state: jsonData['state'], msg: jsonData['msg']);
    }
    return _registerModel;
  }
}
