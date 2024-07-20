import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_data.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key, required this.articels});
  List<ArticleModel> articels; 

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articels.length,
          (context, index) {
        return NewsData(
          articleModel: articels[index],
        );
      }),
    );
  }
}
