import 'package:flutter/material.dart';
import 'package:project_app_eateso/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      initialRoute: "/homePage",
      routes: {
        "/homePage":(context) => HomePage(),
      }
    );
  }
}