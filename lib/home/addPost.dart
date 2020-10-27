import 'package:api/home/homeController.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String title;
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (String value){
                setState(() {
                  title = value;
                });
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
               // homeController.addArticles(title);
              homeController.deleteArticles();
            },
            child: Text('click'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
