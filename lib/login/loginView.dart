import 'package:api/home/homeView.dart';
import 'package:api/login/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'loginModel.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String phone;
  String password;
  bool isLoading = false;

  LoginController _loginController = LoginController();
  LoginModel _loginModel;

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
              _textField('Phone', (value) {
                phone = value;
              }),
              SizedBox(
                height: 10.0,
              ),
              _textField('Password', (value) {
                password = value;
              }),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : RaisedButton(
                      color: Colors.pink,
                      child: Text('Login'),
                      onPressed: () async {
                        if (_globalKey.currentState.validate()) {
                          try {
                            _globalKey.currentState.save();
                            setState(() {
                              isLoading = true;
                            });
                            _loginModel = await _loginController.userLogin(
                                phone: phone, password: password);
                            setState(() {
                              isLoading = false;
                            });
                            if (_loginModel.state == '0') {
                              Toast.show('Error', context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                ),
                              );
                            }
                          } on PlatformException catch (exception) {
                            setState(() {
                              isLoading = false;
                            });
                            Toast.show(exception.message, context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM);
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  String _messageError(String hint) {
    switch (hint) {
      case 'Phone':
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
