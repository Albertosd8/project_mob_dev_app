import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_app_eateso/blocs/filter_bloc/filter_bloc.dart';
import 'package:project_app_eateso/blocs/user_account_bloc/user_account_bloc.dart';
import 'package:project_app_eateso/pages/filter_page.dart';
import 'package:project_app_eateso/pages/restaurants_page.dart';
import 'package:project_app_eateso/pages/search_page.dart';
import 'package:project_app_eateso/pages/user_account.dart';
import 'package:project_app_eateso/pages/user_cart.dart';
import 'package:project_app_eateso/widgets/restaurants.dart';
import 'package:project_app_eateso/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:project_app_eateso/blocs/search_bloc/search_bloc.dart';

class principalMenu extends StatefulWidget {
  principalMenu({Key? key}) : super(key: key);

  @override
  State<principalMenu> createState()=> _principalMenuState();
}

class _principalMenuState extends State<principalMenu> {
  int index = 0; //new changes

  final _menupages = <Widget>[
      RestaurantPage(),
      SearchPage(), 
      FilterProductsPage(),
      UserCartPage(),
      UserAccountPage(),
  ];

  initState() {
    super.initState();
    BlocProvider.of<DataRestaurantBloc>(context).add(LoadRestaurantData());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),            
      body: _menupages[index],
      bottomNavigationBar: 
      BottomNavigationBar(
        currentIndex: index, //new changes index of menu
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.black,
        onTap: ((int i) {
          setState(() {
            if(i == 0){
              BlocProvider.of<DataRestaurantBloc>(context).add(LoadRestaurantData());
            }else if(i == 1){
              BlocProvider.of<SearchDataBloc>(context).add(LoadSearchRestaurantResults(search_text: ''));
            }else if(i == 2){
              BlocProvider.of<FilterSearchDataBloc>(context).add(LoadFilteredSearchRestaurantResults(search_text: ''));
            }else if(i == 4){
              BlocProvider.of<UserAccountEditBloc>(context).add(LoadUserData());
            }
            index = i;
          });
        }),
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
          icon: Icon(Icons.filter_list),
          label: 'Filter',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Account',
          ),
        ]
      ),
    );
  }
}