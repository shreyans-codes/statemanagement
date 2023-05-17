// import 'package:get/get.dart';
// import 'package:statemanagement/database/news_db_dao.dart';
// import 'package:statemanagement/models/article.dart';
// import 'package:statemanagement/models/news_saved_model.dart';
// import 'package:sembast/timestamp.dart';

// enum DbState {
//   loading,
//   success,
//   error,
// }

// class NewsDatabaseController extends GetxController {
//   DbState dbState = DbState.loading;
//   NewsDBDao newsDBDao = NewsDBDao();
//   List<NewsSavedModel> savedNewsList = [];
//   void reloadList() async {
//     dbState = DbState.loading;
//     update();
//     try {
//       savedNewsList = await newsDBDao.getAllSortedByName();
//       dbState = DbState.success;
//       update();
//       print(savedNewsList[0].publishedAt.toString());
//     } catch (e) {
//       Get.snackbar("Error encountered", "Database error");
//       dbState = DbState.error;
//       update();
//     }
//   }

//   void addToList(Article article, String country, String category) async {
//     print("Well I was called");
//     NewsSavedModel newsSavedModel = NewsSavedModel(
//       title: article.title,
//       description: article.description,
//       author: article.author,
//       urlToImage: article.urlToImage,
//       link: article.link,
//       publishedAt: Timestamp.fromDateTime(article.publishedAt!),
//       content: article.content,
//       category: category,
//       country: country,
//     );
//     try {
//       await newsDBDao.insert(newsSavedModel);
//       dbState = DbState.success;
//       update();
//       print("And I was a success");
//     } catch (e) {
//       Get.snackbar("Error encountered", "Database Error");
//       dbState = DbState.error;
//       update();
//     }
//   }

//   void delete(NewsSavedModel newsSavedModel) async {
//     dbState = DbState.error;
//     update();
//     try {
//       await newsDBDao.delete(newsSavedModel);
//       dbState = DbState.success;
//       update();
//     } catch (e) {
//       Get.snackbar("Error encountered", "Database Error");
//       dbState = DbState.error;
//       update();
//     }
//   }

//   @override
//   void onInit() {
//     reloadList();
//     super.onInit();
//   }
// }
