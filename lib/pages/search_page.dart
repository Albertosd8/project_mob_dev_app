import 'package:flutter/material.dart';
import 'package:project_app_eateso/blocs/search_bloc/search_bloc.dart';
import 'package:project_app_eateso/widgets/restaurants.dart';
import 'package:project_app_eateso/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState()=> _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  var _textController = TextEditingController();

  Widget build(BuildContext context){
  return 
  Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: TextField(
              onChanged: (text) {
                BlocProvider.of<SearchDataBloc>(context).add(LoadSearchRestaurantResults(search_text:text));
              },
              controller: _textController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: _textController.clear,
                  icon: Icon(
                    Icons.clear,
                  ),
                ),
                filled: true,  
                fillColor: Colors.white,
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
                labelText: 'Search',
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            child: BlocConsumer<SearchDataBloc,SearchState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if(state is LoadingSearchRestaurantsResults){
                  return Center(
                    child: Text("Loading"),
                  );
                } else if (state is LoadedSearchRestaurantsResults){
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
                } else if (state is NoRestaurantSearchRestaurantsResults) {
                  return Center(
                    child: Text("No hay resultados"),
                  );
                } 
                return Container();
              },
            ),
          ),
        )
      ]
    ),

  );
  }
}