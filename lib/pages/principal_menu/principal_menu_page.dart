import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class principalMenu extends StatefulWidget {
  principalMenu({Key? key}) : super(key: key);

  @override
  State<principalMenu> createState()=> principalMenuState();
}

class principalMenuState extends State<principalMenu> {
  var _textController = TextEditingController();
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
        child: Row() 
      ),
      bottomNavigationBar: 
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
          ]
        ),
    );
  }
}