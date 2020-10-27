import 'package:api/login/loginController.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String phone;
  String password;
  LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              _textField('User name', (value) {
                phone = value;
              }),
              SizedBox(
                height: 10.0,
              ),
              _textField('Password', (value) {
                password = value;
              }),
              RaisedButton(
                color: Colors.pink,
                child: Text('Login'),
                onPressed: () {
                  if(_globalKey.currentState.validate()){
                    _globalKey.currentState.save();
                    _loginController.userLogin(phone: phone, password: password);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String _messageError(String hint) {
    switch (hint) {
      case 'User name':
        return 'Enter your phone';
      case 'Password':
        return 'Enter your password';
    }
  }

  Widget _textField(String hint, Function save) {
    return TextFormField(
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return _messageError(hint);
        }
      },
      onSaved: save,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
