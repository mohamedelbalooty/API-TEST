import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  Function onClickSave;

  CustomTextField({@required this.hint, @required this.onClickSave});

  // ignore: missing_return
  String _messageError(String messageHint) {
    switch (messageHint) {
      case 'Phone':
        return 'Enter your phone';
      case 'Password':
        return 'Enter your password';
      case 'User Name':
        return 'Enter your user name';
      case 'Password Confirmation':
        return 'Enter your confirmation';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return _messageError(hint);
        }
      },
      onSaved: onClickSave,
      keyboardType: hint == 'Phone' ? TextInputType.phone : null,
      cursorColor: Colors.pink,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: _textFieldBorder(),
        focusedBorder: _textFieldBorder(),
        errorBorder: _textFieldBorder(),
        focusedErrorBorder: _textFieldBorder(),
      ),
    );
  }

  OutlineInputBorder _textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: Colors.pink,
        width: 1.5,
      ),
    );
  }
}
