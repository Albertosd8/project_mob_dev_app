import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

import 'package:project_app_eateso/widgets/restaurants.dart';
import 'package:project_app_eateso/pages/principal_menu/principal_menu_bloc/principal_menu_bloc.dart';

class principalMenu extends StatefulWidget {
  principalMenu({Key? key}) : super(key: key);
  String url = 'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg';

  @override
  State<principalMenu> createState()=> principalMenuState();
}

class principalMenuState extends State<principalMenu> {
  // int _selectedIndex = 0;
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
      BlocConsumer<EstablishmentsBloc,EstablishmentsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is LoadingEstablishments){
            return ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return Spacer();
              },
              itemBuilder: (BuildContext context, int index) {
                return ProfilePageShimmer(
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  isRectBox: true,
                );
              },
            );
          } else if (state is LoadedEstablishments){
            ListView.separated( //For long dynamic list, .separated
                scrollDirection: Axis.vertical,
                itemCount: EstablishmentsBloc.establishment_list.length,
                separatorBuilder: (BuildContext context, int index){
                  return SizedBox(height: 6,);
                },
                itemBuilder: (BuildContext context, int index){
                  return RestaurantWidget(
                    image: EstablishmentsBloc.establishment_list[index]['image']!, 
                    establishment_name: EstablishmentsBloc.establishment_list[index]['establishment_name']!, 
                  );
              },
            );
          } else if (state is NoEstablishments) {
            return Center(
              child: Text("No hay restaurantes disponibles"),
            );
          }
          return ListView.separated( //Error with emiting states, so trying hardcore for seing list
                scrollDirection: Axis.vertical,
                itemCount: EstablishmentsBloc.establishment_list.length,
                separatorBuilder: (BuildContext context, int index){
                  return SizedBox(height: 6,);
                },
                itemBuilder: (BuildContext context, int index){
                  return RestaurantWidget(
                    image: EstablishmentsBloc.establishment_list[index]['image']!, 
                    establishment_name: EstablishmentsBloc.establishment_list[index]['establishment_name']!, 
                  );
              },
            );
        },
      ),
      bottomNavigationBar: 
      BottomNavigationBar(
        currentIndex: 0, //index of menu
        fixedColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'ABC',
          ),
        ]
      ),
    );
  }
}