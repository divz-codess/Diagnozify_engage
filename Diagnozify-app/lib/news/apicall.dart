import 'dart:convert';
import 'package:proj2/news/article.dart';
import 'package:http/http.dart';

// api service class for fetching data from news api
class ApiService {
  // endpoint for fetching data from news api
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=948e2523f52445a4914deb76baba82c7";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      articles.removeWhere((element) =>
          element.author == null ||
          element.content == null ||
          element.description == null ||
          element.publishedAt == null ||
          element.source == null ||
          element.title == null ||
          element.url == null ||
          element.urlToImage == null);
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
