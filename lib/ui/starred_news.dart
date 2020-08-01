import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/get_manager/new_database_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class StarredNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Starred News",
          style: GoogleFonts.grenze(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<NewsDatabaseController>(
        initState: (state) => NewsDatabaseController().reloadList(),
        builder: (controller) {
          switch (controller.dbState) {
            case DbState.loading:
              print("Here in loading");
              return CircularProgressIndicator();
              break;
            case DbState.error:
              print("Here in error");
              return Center(
                child: Text("Sorry, we encountered an error"),
              );
            case DbState.success:
              return ListView.builder(
                itemCount: controller.savedNewsList.length,
                itemBuilder: (context, index) {
                  return NewsListFromDb(
                    index: index,
                  );
                },
              );
              break;
            default:
              print("Here in default");
              break;
          }
          return Container(
            child: Text("Default"),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class NewsListFromDb extends StatelessWidget {
  int index;
  NewsListFromDb({this.index});
  NewsDatabaseController newsDatabaseController =
      Get.find<NewsDatabaseController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          newsDatabaseController.savedNewsList[index].title,
          style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 20),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              newsDatabaseController.savedNewsList[index].country,
              style: subTitle,
            ),
            Text(
              newsDatabaseController.savedNewsList[index].category == "None"
                  ? "Top Headline"
                  : newsDatabaseController.savedNewsList[index].category,
              style: subTitle,
            ),
          ],
        ),
      ),
    );
  }
}

var subTitle = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 21,
  fontWeight: FontWeight.bold,
);
