import 'dart:ui';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:statemanagement/get_manager/new_database_manager.dart';
import 'package:statemanagement/get_manager/news_manager.dart';
import 'package:statemanagement/main.dart';
import 'package:statemanagement/ui/news_article_page.dart';
import 'package:statemanagement/ui/starred_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  final NewsManagerController nmc = Get.put(NewsManagerController());
  static var snackbarMessage = {
    "error": "",
    "saved": "You will be able to see all your saved news here",
    "liked": "This article has been saved in your likes folder",
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Suchit",
            style: GoogleFonts.galada(fontSize: 35, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.folder_special),
              onPressed: () => Get.to(
                // StarredNews(),
                MyApp(),
              ),
            ),
          ],
        ),
        body: Center(
          child: GetBuilder<NewsManagerController>(
            init: NewsManagerController(),
            builder: (s) {
              Widget retVal = Text("Emptiness!");
              switch (s.status) {
                case "loading":
                  print("Here at loading!");
                  retVal = CircularProgressIndicator();
                  break;
                case "success":
                  retVal = Swiper(
                    itemCount: s.displayNews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsTile(index);
                    },
                    viewportFraction: 0.8,
                    scale: 0.9,
                    layout: SwiperLayout.TINDER,
                    itemWidth: Get.width * 0.85,
                    itemHeight: Get.height * 0.75,
                    control: SwiperControl(color: Colors.blue),
                    pagination: SwiperPagination(
                      alignment: Alignment.topCenter,
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.blue,
                          color: Get.isDarkMode ? Colors.white : Colors.grey),
                    ),
                  );
                  break;
                case "error":
                  retVal = Center(
                    child: Text("Sorry we encountered an error"),
                  );
                  break;
              }
              return retVal;
            },
          ),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final NewsManagerController nmc = Get.find();
  // final NewsDatabaseController newsDatabaseController =
  //     Get.put(NewsDatabaseController());
  final index;
  NewsTile(this.index);
  @override
  Widget build(BuildContext context) {
    var length = nmc.displayNews[index].content.length;
    String content = length > 20
        ? nmc.displayNews[index].content.substring(0, (length - 14))
        : nmc.displayNews[index].content;
    return GestureDetector(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            nmc.displayNews[index].urlToImage == "empty"
                ? Center(
                    child: Text(
                      "No Image Provided",
                      style: headlineStyle.copyWith(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  )
                : Hero(
                    tag: Text("newsImage"),
                    child: Image.network(
                      nmc.displayNews[index].urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                child: Container(
                  color: Colors.black38,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 2, 2, 8),
                      child: Text(
                        nmc.displayNews[index].title,
                        style: headlineStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Get.to(
        NewsArticlePage(index, nmc.displayNews[index].title, content),
      ),
      onDoubleTap: () {
        // newsDatabaseController.addToList(
        //     nmc.displayNews[index], "India", "None");
        Get.snackbar(
          "You liked it, huh?",
          NewsPage.snackbarMessage["liked"]!,
          backgroundColor: Colors.black87.withOpacity(0.5),
          colorText: Colors.white,
        );
      },
    );
  }
}

var headlineStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
var contentStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);
