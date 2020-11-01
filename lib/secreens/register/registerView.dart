import 'package:api/secreens/home/homeView.dart';
import 'package:api/secreens/login/loginView.dart';
import 'package:api/secreens/register/registerController.dart';
import 'package:api/secreens/register/registerModel.dart';
import 'package:api/widgets/sharedWidgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _userName;
  String _phone;
  String _password;
  String _passwordConfirmation;
  bool _isLoading = false;
  RegisterModel _registerModel = RegisterModel();
  RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                CustomTextField(
                    hint: 'User Name',
                    onClickSave: (value) {
                      _userName = value;
                    }),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                    hint: 'Phone',
                    onClickSave: (value) {
                      _phone = value;
                    }),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                    hint: 'Password',
                    onClickSave: (value) {
                      _password = value;
                    }),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                    hint: 'Password Confirmation',
                    onClickSave: (value) {
                      _passwordConfirmation = value;
                    }),
                SizedBox(
                  height: 20.0,
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _loginButton(),
                Container(
                  height: 1.5,
                  width: double.infinity,
                  color: Colors.blueGrey,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RaisedButton(
      color: Colors.pink,
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.pink,
          width: 1.5,
        ),
      ),
      onPressed: () async {
        if (_globalKey.currentState.validate()) {
          try {
            _globalKey.currentState.save();
            setState(() {
              _isLoading = true;
            });
            _registerModel = await _registerController.userRegister(
                userName: _userName,
                phone: _phone,
                password: _password,
                passwordConfirmation: _passwordConfirmation);
            setState(() {
              _isLoading = false;
            });
            if (_registerModel.state == '0') {
              Toast.show(_registerModel.msg, context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
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
              _isLoading = false;
            });
            Toast.show(exception.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        }
      },
    );
  }
}
