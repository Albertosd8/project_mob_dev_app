import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app_eateso/home/home_page.dart';
import 'package:project_app_eateso/home/home_options.dart';
import 'package:project_app_eateso/pages/sign-in/sign_in.dart';
import 'package:project_app_eateso/pages/sign-up/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/bloc/auth_bloc.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     /*options: const FirebaseOptions(
  //   apiKey: "AIzaSyCoRtMFbjeQrNbG8m1Egx36Y7NjAT22dac",
  //   appId: "project-mob-49634",
  //   messagingSenderId: ""
  //   projectId: "961243009208"
  // )*/
  //     );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthEvent()),
    ),
    /*BlocProvider(
      create: (context) => JoinBloc(),
    )*/
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: HomePage(),
        initialRoute: "/homePage",
        routes: {
          "/homePage": (context) => HomePage(),
          "/homePageOptions": (context) => HomePageOptions(),
          "/sign_in": (context) => SignIn(),
          "/sign_up": (context) => SignUp(),
        });
  }
}
