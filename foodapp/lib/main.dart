import 'package:flutter/material.dart';
import 'package:foodapp/Pages/HomePage.dart';
import 'package:foodapp/Pages/ItemPage.dart';
import 'package:foodapp/Pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        "homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },
    );
  }
}
