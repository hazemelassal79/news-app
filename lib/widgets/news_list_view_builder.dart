import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(
        category:
            widget.category); //to access NewsListViewBuilder StatefulWidget
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future, //request
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return SliverToBoxAdapter(
                  child: Center(
                      child: Text(
                "there is no data",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )));
            }
            return NewsListView(articels: snapshot.data!);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: Text("oops there was an error, try again latter"));
          } else {
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
