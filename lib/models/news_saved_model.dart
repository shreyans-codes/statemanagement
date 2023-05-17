import 'package:sembast/timestamp.dart';

class NewsSavedModel {
  int id = 0;
  String title;
  String author;
  String description;
  String content;
  String? urlToImage;
  String? link;
  Timestamp? publishedAt;
  String country;
  String category;

  NewsSavedModel({
    this.country = "",
    this.category = "",
    this.title = "",
    this.author = "",
    this.description = "",
    this.content = "",
    this.urlToImage,
    this.link,
    this.publishedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'content': content,
      'urlToImage': urlToImage,
      'link': link,
      'publishedAt': publishedAt,
      'country': country,
      'category': category,
    };
  }

  static NewsSavedModel fromMap(Map<String, dynamic> map) {
    return NewsSavedModel(
      title: map['title'],
      author: map['author'],
      description: map['description'],
      content: map['content'],
      urlToImage: map['urlToImage'],
      link: map['link'],
      publishedAt: map['publishedAt'],
      country: map['country'],
      category: map['category'],
    );
  }
}
