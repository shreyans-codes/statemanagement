import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/get_manager/news_manager.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NewsArticlePage extends StatelessWidget {
  int index;
  String title;
  String content;
  NewsArticlePage(this.index, this.title, this.content);
  NewsManagerController nmc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Suchit",
          style: GoogleFonts.galada(fontSize: 35, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              nmc.displayNews[index].urlToImage == "empty"
                  ? Text("No Image Provided")
                  : Hero(
                      tag: Text("newsImage"),
                      child: Image.network(nmc.displayNews[index].urlToImage)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      nmc.displayNews[index].title,
                      style: headlineStyle,
                    ),
                    Text(
                      content,
                      style: contentStyle,
                    ),
                    Text(
                      nmc.displayNews[index].link,
                      style: contentStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var headlineStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
var contentStyle = TextStyle(
  fontSize: 20,
);
