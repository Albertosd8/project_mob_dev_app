import 'package:flutter/material.dart';
import 'package:project_app_eateso/home/home_page.dart';
import 'package:project_app_eateso/home/home_options.dart';
import 'package:project_app_eateso/pages/sign-in/sign_in.dart';
import 'package:project_app_eateso/pages/sign-up/sign_up.dart';

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
        "/homePageOptions":(context) => HomePageOptions(),
        "/sign_in":(context) => SignIn(),
        "/sign_up":(context) => SignUp(),
      }
    );
  }
}