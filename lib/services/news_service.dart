//import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=1a3d839585cb422d885c58f2a71564d4&category=$category");
          // api key abdo 1a3d839585cb422d885c58f2a71564d4
          // api key hazem 10bf9772a18d42d68873068e9ac43a17 

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        if (article["urlToImage"] != null) {
          ArticleModel articleModel = ArticleModel.fromJson(article);
          articlesList.add(articleModel);
          //log(article["urlToImage"].toString());
        }
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
