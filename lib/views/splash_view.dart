import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  static const String routeName = "SplashView";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset("assets/splash_logo.png")),
      ),
    );
  }
}
