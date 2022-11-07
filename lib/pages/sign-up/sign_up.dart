import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState()=> _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _textController = TextEditingController();
  var _textControllerEmail = TextEditingController();
  bool light = true;
  // String dropdownvalue = 'MX';  
  //  var items = [   
  //   'MX',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

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
            SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Text(
                        "Create an account", 
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        )
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.70,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       SizedBox(width: 1,),
                    //       DropdownButton(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         dropdownColor: Colors.white,
                    //         // Initial Value
                    //         value: dropdownvalue,
                    //         // Down Arrow Icon
                    //         icon: const Icon(Icons.keyboard_arrow_down), 
                    //         // Array list of items
                    //         items: items.map((String items) {
                    //           return DropdownMenuItem(
                    //             value: items,
                    //             child: Text(items),
                    //           );
                    //         }).toList(),
                    //         // After selecting the desired option,it will
                    //         // change button value to selected value
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             dropdownvalue = newValue!;
                    //           });
                    //         },
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * 0.40,
                    //         child: TextField(
                    //           controller: _textController,
                    //           keyboardType: TextInputType.number,
                    //           decoration: InputDecoration(
                    //             filled: true,  
                    //             fillColor: Colors.white70,
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(20.0),
                    //               borderSide: BorderSide(color: Colors.white)
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(20.0),
                    //               borderSide: BorderSide(color: Colors.white)
                    //             ),
                    //             focusedErrorBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(20.0),
                    //               borderSide: BorderSide(color: Colors.red)
                    //             ),
                    //             labelText: '222 443 232',
                    //             labelStyle: TextStyle(
                    //               color: Colors.black45,
                    //               fontWeight: FontWeight.bold
                    //               )
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Text(
                        "Enter your email", 
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        )
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: TextField(
                        controller: _textControllerEmail,
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
                          labelText: 'Email',
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
                        controller: _textController,
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
                          labelText: 'Full Name',
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
                        controller: _textController,
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
                          labelText: 'Password',
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
                        controller: _textController,
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
                          labelText: 'Confirm password',
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
                        "Create an account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.70, MediaQuery.of(context).size.height * 0.05),
                        backgroundColor: Color.fromARGB(255, 250, 223, 124),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // <-- Radius
                        ),
                      ),
                      onPressed: (){
                        // Navigator.of(context).pushNamed("/principal_menu"); //change later
                      }, 
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   "Don't have an account?"
                          // ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.orange,
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("/principal_menu"); //change later
                            },
                            child: const Text("Become a partner"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                  ],
                ),
            )
          ],
        )
      )
      
    );
  }
}

