import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_app_eateso/pages/sign_in.dart';
import 'package:project_app_eateso/pages/sign_up.dart';

import '../auth/bloc/auth_bloc.dart';

class HomePageOptions extends StatefulWidget {
  HomePageOptions({Key? key}) : super(key: key);

  @override
  State<HomePageOptions> createState() => _HomePageOptionsState();
}

class _HomePageOptionsState extends State<HomePageOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 134, 156, 68),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
          child: SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 4,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  height: MediaQuery.of(context).size.width / 2.8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage('assets/icon_for_options_homepage.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("EATESO",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 8,
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text("Sign up with Google",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.60,
                        MediaQuery.of(context).size.height * 0.05),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("/sign_in");
                    BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text("Sign up with Facebook",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.60,
                        MediaQuery.of(context).size.height * 0.05),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("/sign_in");
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text("Sign up with Email",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.60,
                        MediaQuery.of(context).size.height * 0.05),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
                  },
                  child: const Text('Already have an account?'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
              ],
            ),
          ],
        ));
  }
}
