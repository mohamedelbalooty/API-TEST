// import 'package:covid_19/models/classes.dart';
// import 'package:covid_19/models/item.dart';
// import 'package:covid_19/screan/date.dart';
// import 'package:covid_19/screan/login.dart';
// import 'package:covid_19/screan/splash.dart';
// import 'package:covid_19/widgets/header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Register extends StatefulWidget {
//   int classe_id;
//   int subject_id;
//   double price;
//
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   @override
//   final kHintTextStyle = TextStyle(
//     color: Colors.white,
//     fontSize: 17,
//   );
//
//   final kLabelStyle = TextStyle(
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );
//
//   var kBoxDecorationStyle = BoxDecoration(
//     color: Colors.purple,
//     borderRadius: BorderRadius.circular(10.0),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black12,
//         blurRadius: 6.0,
//         offset: Offset(0, 2),
//       ),
//     ],
//   );
//   final controller = ScrollController();
//   double offset = 0;
// ///////////////////////////////////////////////////
//   final TextEditingController _phoneControl = new TextEditingController();
//   final TextEditingController _passwordControl = new TextEditingController();
//   final TextEditingController _confirm = new TextEditingController();
//
//   // final TextEditingController _cityControl = new TextEditingController();
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//     bool _isload = false;
//   }
//
//   bool _isLoading = false;
//   bool _isload = false;
//
//   final _formKey = GlobalKey<FormState>();
//
//   var prif = SharedPreferences.getInstance();
//
//   /////////////////////////////////////////////////////////////////////
//   register() async {
//     try {
//       if( _confirm.text.trim().isEmpty || _passwordControl.text.trim().isEmpty || _phoneControl.text.trim().isEmpty){
//         _showDialog("error", "اكمل البيانات ");
//       }else if(_phoneControl.text.length < 8 ){
//         _showDialog("error", "ادخل رقم هاتف صحيح ");
//       }
//       else if(_passwordControl.text.length < 6  || _passwordControl.text.length > 20){
//         _showDialog("error", "كلمة المرور من 6 الي 20 رمز احرف او ارقام ");
//       }
//
//       else {
//
//           if (this.mounted) {
//             setState(() {
//               _isload = true;
//             });
//           }
//           final response = await http.post(
//               "https://lifewithyou.online/manag/api/v1/register",
//               headers: {
//                 "Accept": "application/json"
//               },
//               body: {
//                 "phone": _phoneControl.text,
//                 "password": _passwordControl.text,
//
//                 "password_confirmation": _confirm.text
//               });
//
//           final data = jsonDecode(response.body);
//
//           if (data["state"] == "1") {
//             SharedPreferences localStorage =
//                 await SharedPreferences.getInstance();
//             localStorage.setString('token', data['data']["api_token"]);
//             localStorage.setString('user', json.encode(data['data']));
//             return Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (BuildContext context) {
//                   return SplashScreen();
//                 },
//               ),
//             );
//           } else {
//             _showDialog(" error", data["msg"]);
//             //01155556624
//             if (this.mounted) {
//               setState(() {
//                 _isload = false;
//               });
//             }
//           }
//           // _showDialog (data["state"],m);
//
//       }
//     } on SocketException catch (_) {
//       _showDialog(" error", "لا يوجد اتصال بالانترنت");
//     }
//   }
//
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////
// // user defined function
//   void _showDialog(title, body) {
//     // flutter defined function
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: new Text(title),
//           content: new Text(body),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
//             new FlatButton(
//               child: new Text("انهاء"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             new FlatButton(
//               child: new Text("اعادة تحميل"),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (BuildContext context) {
//                       return Register() ;                    },
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(onScroll);
//
//   }
//
//   void onScroll() {
//     setState(() {
//       offset = (controller.hasClients) ? controller.offset : 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final orientation = MediaQuery.of(context).orientation;
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             MyHeader2(
//               image: "assets/icons/coronadr.svg",
//               textTop: " REGISTER ",
//               textBottom: "",
//               offset: offset,
//             ),
//             Directionality(
//               textDirection: TextDirection.rtl,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       decoration: kBoxDecorationStyle,
//                       height: 60.0,
//                       child: TextField(
//                         controller: _phoneControl,
//                         keyboardType: TextInputType.number,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                         ),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14.0),
//                           prefixIcon: Icon(
//                             Icons.phone,
//                             color: Colors.white,
//                           ),
//                           hintText: 'رقم الهاتف',
//                           hintStyle: kHintTextStyle,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 10,
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       decoration: kBoxDecorationStyle,
//                       height: 60.0,
//                       child: TextField(
//                         controller: _passwordControl,
//                         obscureText: true,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                         ),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14.0),
//                           prefixIcon: Icon(
//                             Icons.lock,
//                             color: Colors.white,
//                           ),
//                           hintText: 'كلمة المرور',
//                           hintStyle: kHintTextStyle,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 10,
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       decoration: kBoxDecorationStyle,
//                       height: 60.0,
//                       child: TextField(
//                         controller: _confirm,
//                         obscureText: true,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                         ),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14.0),
//                           prefixIcon: Icon(
//                             Icons.lock,
//                             color: Colors.white,
//                           ),
//                           hintText: 'تاكيد كلمة المرور',
//                           hintStyle: kHintTextStyle,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 10.0),
//                       width: double.infinity,
//                       child: RaisedButton(
//                         elevation: 5.0,
//                         onPressed: register,
//                         padding: EdgeInsets.all(12.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         color: Colors.purple[800],
//                         child: _isload
//                             ? Center(
//                           child: CircularProgressIndicator(),
//                         )
//                             : Text(
//                           'تسجيل',
//                           style: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 1.5,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: FlatButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return Login();
//                               },
//                             ),
//                           );
//                         },
//                         padding: EdgeInsets.only(right: 0.0),
//                         child: Row(
//                           children: <Widget>[
//                             Text('   لديك حساب بالفعل ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold)),
//                             Text('  تسجيل دخول  ',
//                                 style: TextStyle(
//                                     color: Colors.deepOrangeAccent,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
