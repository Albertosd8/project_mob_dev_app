import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context){
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
                    image: AssetImage('assets/icon_for_homepage.png'),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "EATESO", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width / 8,
                )
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.60, MediaQuery.of(context).size.height * 0.05),
                  backgroundColor: Color.fromARGB(255, 243, 168, 97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed("/homePageOptions");
                }, 
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
            ],
          ),
        ],
      )
    );
  }
}