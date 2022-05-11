import 'package:flutter/material.dart';
import 'package:news_app/details/details_screen.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        DetailsScreen.routeName:(_)=>DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        primaryColor: Color(0xFF39A552),
        appBarTheme: AppBarTheme(
         color: Color(0xFF39A552),
        )
      ),
    );
  }
}


