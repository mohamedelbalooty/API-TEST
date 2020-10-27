import 'package:flutter/cupertino.dart';

class Article {
  String newsAuthor,
      newsTitle,
      newsDescription,
      newsURL,
      newsUrlToImage,
      newsPublishedAt;

  Article(
      {@required this.newsAuthor,
      @required this.newsTitle,
      @required this.newsDescription,
      @required this.newsURL,
      @required this.newsUrlToImage,
      @required this.newsPublishedAt});

  // Article.fromJson(Map<String, dynamic> json) {
  //   newsAuthor = json['author'];
  //   newsTitle = json['title'];
  //   newsDescription = json['description'];
  //   newsURL = json['url'];
  //   newsUrlToImage = json['urlToImage'];
  //   newsPublishedAt = json['publishedAt'];
  // }
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        newsAuthor: json['author'],
        newsTitle: json['title'],
        newsDescription: json['description'],
        newsURL: json['url'],
        newsUrlToImage: json['urlToImage'],
        newsPublishedAt: json['publishedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.newsAuthor;
    data['title'] = this.newsTitle;
    data['description'] = this.newsDescription;
    data['url'] = this.newsURL;
    data['urlToImage'] = this.newsUrlToImage;
    data['publishedAt'] = this.newsPublishedAt;
    return data;
  }
}
