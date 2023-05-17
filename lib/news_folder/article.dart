class Article {
  String title;
  String author;
  String description;
  String content;
  String? urlToImage;
  String? link;
  DateTime? publishedAt;
  Article(
      {this.link,
      this.author = "",
      this.content = "",
      this.description = "",
      this.publishedAt,
      this.title = "",
      this.urlToImage});
}
