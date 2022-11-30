import 'package:flutter/material.dart';
import 'package:project_app_eateso/widgets/restaurants.dart';
import 'package:project_app_eateso/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantPage extends StatefulWidget {
  RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState()=> _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>{

  Widget build(BuildContext context){
  return BlocConsumer<DataRestaurantBloc,RestaurantState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is LoadingRestaurantData){
          return Center(
            child: Text("Loading"),
          );
        } else if (state is LoadedRestaurantData){
          return
          ListView.separated( 
              scrollDirection: Axis.vertical,
              itemCount: state.restaurant_data.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 6,),
              itemBuilder: (BuildContext context, int index){
                return RestaurantWidget(
                  image: state.restaurant_data[index]['restaurant_image']!, //consider null case
                  establishment_name: state.restaurant_data[index]['restaurant_name']!, 
                  products: state.restaurant_data[index]['products'],
                  open: state.restaurant_data[index]['open_schedule'],
                  close: state.restaurant_data[index]['close_schedule'],
                );
            },
          );
        } else if (state is NoRestaurantData) {
          return Center(
            child: Text("No hay restaurantes disponibles"),
          );
        } 
        return Container();
      },
    );
  }
}