import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_app_eateso/blocs/user_account_bloc/user_account_bloc.dart';
import 'package:project_app_eateso/pages/sign_up.dart';

class EditUserAccountPage extends StatefulWidget {
  EditUserAccountPage({Key? key}) : super(key: key);

  @override
  State<EditUserAccountPage> createState()=> _EditUserAccountPageState();
}

class _EditUserAccountPageState extends State<EditUserAccountPage> {
  var _textControllerUser = TextEditingController();
  var _textControllerImage = TextEditingController();
  bool light = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),            
      body: 
      Container(
        padding: EdgeInsets.all(20),
        child: 
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Account", 
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        LimitedBox(
                            maxWidth: MediaQuery.of(context).size.width * 0.70,
                            child: Text(
                            'Press confirm changes for save changes',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                              ),
                            ) 
                          ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextField(
                    controller: _textControllerUser,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,  
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red)
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextField(
                    controller: _textControllerImage,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,  
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red)
                      ),
                      labelText: 'Profile pic image url',
                      labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text(
                    "Confirm changes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.70, MediaQuery.of(context).size.height * 0.05),
                    backgroundColor: Color.fromARGB(255, 134, 156, 68),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                  onPressed: (){
                    BlocProvider.of<UserAccountEditBloc>(context).add(UpdateUserAccount(newUserData: {
                      'user_id' : 'user_test',
                      'username' : _textControllerUser.text,
                      'profile_image': _textControllerImage.text
                    }));
                    Navigator.pop(context); //insert alert dialog of success before pop
                  }, 
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text(
                    "Go back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    )
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.70, MediaQuery.of(context).size.height * 0.05),
                    backgroundColor: Color.fromARGB(255, 236, 236, 236),
                    foregroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    // Navigator.of(context).pushNamed("/sign_in");
                  }, 
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
              ],
            ),
          ],
        )
      )
      
    );
  }
}