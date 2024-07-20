import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/splash_view.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routeName: (context) => HomeView(),
      },
    );
  }
}
