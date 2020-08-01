import 'package:get/get.dart';
import 'package:statemanagement/models/article.dart';
import 'package:statemanagement/news_folder/news.dart';

enum CountrySource {
  india, //in
  southKorea, //kr
  usa, //us
}

enum NewsCategory {
  none,
  business,
  entertainment,
  health,
  science,
  sports,
  technology,
}

String getCountryString({CountrySource countrySource}) {
  String returnString = "in";
  switch (countrySource) {
    case CountrySource.india:
      returnString = "in";
      break;
    case CountrySource.southKorea:
      returnString = "kr";
      break;
    case CountrySource.usa:
      returnString = "us";
      break;
    default:
      break;
  }
  return returnString;
}

String getCategoryString({NewsCategory newsCategory}) {
  String returnString = "";
  switch (newsCategory) {
    case NewsCategory.none:
      returnString = "";
      break;
    case NewsCategory.business:
      returnString = "&category=business";
      break;
    case NewsCategory.entertainment:
      returnString = "&category=entertainment";
      break;
    case NewsCategory.health:
      returnString = "&category=health";
      break;
    case NewsCategory.science:
      returnString = "&category=science";
      break;
    case NewsCategory.sports:
      returnString = "&category=sports";
      break;
    case NewsCategory.technology:
      returnString = "&category=technology";
      break;
    default:
      break;
  }
  return returnString;
}

class NewsManagerController extends GetxController {
  String status = "loading";
  List<Article> displayNews = [];
  Future<List<Article>> fetch({
    CountrySource countrySource,
    NewsCategory newsCategory,
  }) async {
    status = "loading";
    update();
    String country = getCountryString(countrySource: countrySource);
    String category = getCategoryString(newsCategory: newsCategory);
    News news = News(country: country, category: category);
    String result = await news.getNews();
    if (result == 'success') {
      status = "success";
      update();
      displayNews = news.news;
    } else {
      status = "error";
      update();
    }
    return news.news;
  }

  @override
  void onInit() async {
    print("Started fetching");
    fetch(
      countrySource: CountrySource.india,
      newsCategory: NewsCategory.health,
    );
    super.onInit();
  }
}
