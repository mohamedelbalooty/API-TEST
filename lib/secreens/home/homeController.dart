import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'homeModel.dart';

class HomeController {

  String newsUrl =
      'http://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=d2c6784d9ce6486dbaedb5cb5c736300';

  Future<List<Article>> getArticles() async {
    http.Response response = await http.get(newsUrl);
    List<Article> articles = [];
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['articles'];
      for (var article in data) {
        articles.add(Article.fromJson(article));
      }
      return articles;
    } else {
      throw Exception('Can not load articles');
    }
  }

  //TODO if you want return one Article
  // Future<Article> getArticles() async {
  //   http.Response response = await http.get(newsUrl);
  //   if (response.statusCode == 200) {
  //     return Article.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Can not load articles');
  //   }
  // }



   Future<http.Response> addArticles(String title) async{
    String url = 'https://jsonplaceholder.typicode.com/albums';
    var response = await http.post(
        url,
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String> {
        "title": title
      })
    );
    if(response.statusCode == 201){
      print(response.body);
      Article.fromJson(jsonDecode(response.body));
    }else {
      print(response.statusCode);
    }
  }


   Future<http.Response> editArticles() async{
    String url = 'https://jsonplaceholder.typicode.com/albums/100';
    // int id = 101;
    var response = await http.put(
        url,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String> {
          "title": "medo00000"
        })
    );
    if(response.statusCode == 200){
      print(response.body);
      Article.fromJson(jsonDecode(response.body));
    }else {
      print(response.statusCode);
    }
  }

  Future<http.Response> deleteArticles() async{
    String url = 'https://jsonplaceholder.typicode.com/albums/100';
    // int id = 101;
    var response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
    );
    if(response.statusCode == 200){
      print(response.statusCode);
      Article.fromJson(jsonDecode(response.body));
    }else {
      print(response.statusCode);
    }
  }
}
