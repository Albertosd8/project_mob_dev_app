import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app_eateso/blocs/search_bloc/search_bloc.dart';
import 'package:project_app_eateso/home/home_page.dart';
import 'package:project_app_eateso/home/home_options.dart';
import 'package:project_app_eateso/pages/sign_in.dart';
import 'package:project_app_eateso/pages/sign_up.dart';
import 'package:project_app_eateso/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/bloc/auth_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthEvent()),
    ),
    BlocProvider(
      create: (context) => DataRestaurantBloc(), //check how to do this without having to do it at first
    ),
    BlocProvider(
      create: (context) => SearchDataBloc(), //check how to do this without having to do it at first
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: HomePage(),
    );
  }
}
