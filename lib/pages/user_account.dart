import 'package:flutter/material.dart';
import 'package:project_app_eateso/blocs/user_account_bloc/user_account_bloc.dart';
import 'package:project_app_eateso/home/home_page.dart';
import 'package:project_app_eateso/pages/edit_account_user.dart';
import 'package:project_app_eateso/widgets/restaurants.dart';
import 'package:project_app_eateso/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';

class UserAccountPage extends StatefulWidget {
  UserAccountPage({Key? key}) : super(key: key);

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  initState() {
    super.initState();
    BlocProvider.of<UserAccountEditBloc>(context).add(LoadUserData());
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            BlocConsumer<UserAccountEditBloc, UserAccountEditState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is LoadingUserAccountEdit) {
                  return Center(
                    child: Text("loading"),
                  );
                } else if (state is LoadedUserAccountEdit) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                            image: NetworkImage(((state.userdata[0]
                                            ['profile_image']) !=
                                        null ||
                                    (state.userdata[0]['profile_image']) != '')
                                ? state.userdata[0]['profile_image']
                                : 'https://htmlcolorcodes.com/assets/images/colors/steel-gray-color-solid-background-1920x1080.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(
                        state.userdata[0]['username'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.07),
                      ),
                    ],
                  );
                }
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Text(
                      "Username",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.07),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.edit,
                      color: Colors.lightGreen,
                      size: MediaQuery.of(context).size.width * 0.08),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text("Edit Account",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.75,
                    MediaQuery.of(context).size.height * 0.08),
                backgroundColor: Color.fromARGB(255, 253, 253, 253),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditUserAccountPage(),
                    ));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.note,
                      color: Colors.lightGreen,
                      size: MediaQuery.of(context).size.width * 0.08),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text("Orders",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.75,
                    MediaQuery.of(context).size.height * 0.08),
                backgroundColor: Color.fromARGB(255, 253, 253, 253),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageOptions(),));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.credit_card,
                      color: Colors.lightGreen,
                      size: MediaQuery.of(context).size.width * 0.08),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text("Payment",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.75,
                    MediaQuery.of(context).size.height * 0.08),
                backgroundColor: Color.fromARGB(255, 253, 253, 253),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageOptions(),));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              child: Text("Log out",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.75,
                    MediaQuery.of(context).size.height * 0.05),
                backgroundColor: Color.fromARGB(255, 243, 168, 97),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // <-- Radius
                ),
              ),
              onPressed: () {
                //BlocProvider for logging out
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          ]),
        ],
      ),
    );
  }
}
