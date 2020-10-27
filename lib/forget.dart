// import 'package:covid_19/models/classes.dart';
// import 'package:covid_19/models/item.dart';
// import 'package:covid_19/screan/date.dart';
// import 'package:covid_19/screan/login.dart';
// import 'package:covid_19/screan/reset.dart';
// import 'package:covid_19/widgets/header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Forget extends StatefulWidget {
//   int classe_id;
//   int subject_id;
//   double price;
//
//   @override
//   _ForgetState createState() => _ForgetState();
// }
//
// class _ForgetState extends State<Forget> {
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
//
//
//   final TextEditingController _phoneControl = new TextEditingController();
//   final TextEditingController _emailControl = new TextEditingController();
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
//
//   var prif = SharedPreferences.getInstance();
//
//   /////////////////////////////////////////////////////////////////////
//   my_pass() async {
//     try {
//       if(  _emailControl.text.trim().isEmpty || _phoneControl.text.trim().isEmpty){
//         _showDialog("error", "اكمل البيانات ");
//       }else if(_phoneControl.text.length < 8 ){
//         _showDialog("error", "ادخل رقم هاتف صحيح ");
//       }
//
//
//       else {
//
//         if (this.mounted) {
//           setState(() {
//             _isload = true;
//           });
//         }
//         final response = await http.post(
//             "https://lifewithyou.online/manag/api/v1/resetPassword",
//             headers: {
//               "Accept": "application/json"
//             },
//             body: {
//               "phone": _phoneControl.text,
//               "email": _emailControl.text,
//
//             });
//
//         final data = jsonDecode(response.body);
//
//         if (data["state"] == "1") {
//           SharedPreferences localStorage = await SharedPreferences.getInstance();
//           localStorage.setString('email_send',_emailControl.text );
//
//           return   Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (BuildContext context){
//                 return Reset();
//               },
//             ),
//           );
//         } else {
//           _showDialog(" error", data["msg"]);
//           //01155556624
//           if (this.mounted) {
//             setState(() {
//               _isload = false;
//             });
//           }
//         }
//         // _showDialog (data["state"],m);
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
//                       return Login() ;                    },
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
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller.addListener(onScroll);
//   }
//
//
//
//   void onScroll() {
//     setState(() {
//       offset = (controller.hasClients) ? controller.offset : 0;
//     });
//   }
//
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
//       child: Column(
//         children: <Widget>[
//           MyHeader2(
//             image: "assets/icons/forget.svg",
//             textTop: "FORGOT",
//             textBottom: "PASSWORD",
//             offset: offset,
//           ),
//           Directionality(
//             textDirection: TextDirection.rtl,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     decoration: kBoxDecorationStyle,
//                     height: 60.0,
//                     child: TextField(
//                       controller: _phoneControl,
//                       keyboardType: TextInputType.number,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'OpenSans',
//                       ),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.only(top: 14.0),
//                         prefixIcon: Icon(
//                           Icons.phone,
//                           color: Colors.white,
//                         ),
//                         hintText: 'رقم الهاتف',
//                         hintStyle: kHintTextStyle,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 10,
//                   ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     decoration: kBoxDecorationStyle,
//                     height: 60.0,
//                     child: TextField(
//                       controller: _emailControl,
//                       keyboardType: TextInputType.emailAddress,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'OpenSans',
//                       ),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.only(top: 14.0),
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.white,
//                         ),
//                         hintText: 'بريد الكتروني لارسال اليه الكود',
//                         hintStyle: kHintTextStyle,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 10,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 10.0),
//                     width: double.infinity,
//                     child: RaisedButton(
//                       elevation: 5.0,
//                       onPressed: my_pass,
//                       padding: EdgeInsets.all(12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       color: Colors.purple[800],
//                       child:
//                       _isload
//                           ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                           :
//                       Text(
//                         'تأكيد',
//                         style: TextStyle(
//                           color: Colors.white,
//                           letterSpacing: 1.5,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     child: FlatButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return Login();
//                             },
//                           ),
//                         );
//                       },
//                       padding: EdgeInsets.only(right: 0.0),
//                       child: Row(
//                         children: <Widget>[
//                           Text('   الرجوع الي صفحة  ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold)),
//                           Text('  تسجيل دخول  ',
//                               style: TextStyle(
//                                   color: Colors.deepOrangeAccent,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
