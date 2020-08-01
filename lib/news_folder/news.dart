import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import 'dart:convert';

class News {
  String country;
  String category = "";
  News({this.country, this.category});
  String key = "4dcabeb7c68e4206bedb10de952c2296";
  String headline = "top-headlines";
  List<Article> news = [];
  Future<String> getNews() async {
    String result = 'fail';
    try {
      String url =
          "http://newsapi.org/v2/$headline?country=$country$category&apiKey=$key";
      var response = await http.get(url);
      var jsonData = await jsonDecode(response.body);
      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach(
          (element) {
            Article article = new Article(
              title: element['title'] ?? "No Title Provided",
              description: element['description'] ?? "No Description Provided",
              publishedAt:
                  DateTime.parse(element['publishedAt']) ?? "No Date Provided",
              content: element['content'] ?? "No Content Provided",
              urlToImage: element['urlToImage'] ?? "empty",
              author: element['author'] ?? "Author Name Not Provided",
              link: element['url'] ?? "empty",
            );
            news.add(article);
          },
        );
      }
      result = 'success';
    } catch (e) {
      Get.snackbar(
        "An Error Occured",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      result = 'fail';
    }
    return result;
  }
}
