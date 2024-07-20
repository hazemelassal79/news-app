import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          // "https://newsapi.org/v2/everything?q=tesla&from=2024-06-19&sortBy=publishedAt&apiKey=10bf9772a18d42d68873068e9ac43a17");
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=10bf9772a18d42d68873068e9ac43a17&category=$category");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        if (article["urlToImage"] != null) {
          ArticleModel articleModel = ArticleModel.fromJson(article);
          articlesList.add(articleModel);
        }
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
