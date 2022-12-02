import 'package:flutter/material.dart';
import 'package:project_app_eateso/blocs/filter_bloc/filter_bloc.dart';
import 'package:project_app_eateso/widgets/restaurants.dart';
import 'package:project_app_eateso/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterProductsPage extends StatefulWidget {
  FilterProductsPage({Key? key}) : super(key: key);

  @override
  State<FilterProductsPage> createState()=> _FilterProductsState();
}

class _FilterProductsState extends State<FilterProductsPage>{
  var _textControllerMoneyFilter = TextEditingController();

  Widget build(BuildContext context){
  return 
  Container(
    child: Column( 
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: TextField(
                  controller: _textControllerMoneyFilter,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: Colors.green,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _textControllerMoneyFilter.clear,
                      icon: Icon(
                        Icons.clear,
                        color: Colors.green,
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
                    labelText: 'Max Amount',
                    labelStyle: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
                SizedBox(width:  MediaQuery.of(context).size.width * 0.02,),
                Expanded(
                  child: ElevatedButton(
                    child: Text("Apply filter",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.15,
                          MediaQuery.of(context).size.height * 0.05),
                      backgroundColor: Color.fromARGB(255, 134, 156, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<FilterSearchDataBloc>(context).add(LoadFilteredSearchRestaurantResults(search_text: _textControllerMoneyFilter.text));
                    },
                  ),
                )
              ],
            ),
        ),
        Expanded(
          child: Container(
            child: BlocConsumer<FilterSearchDataBloc,FilterSearchState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if(state is LoadingFilteredSearchRestaurantsResults){
                  return Center(
                    child: Text("Loading"),
                  );
                } else if (state is LoadedFilteredSearchRestaurantsResults){
                  return
                  ListView.separated( 
                      scrollDirection: Axis.vertical,
                      itemCount: state.restaurant__filterdata.length,
                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 6,),
                      itemBuilder: (BuildContext context, int index){
                        return RestaurantWidget(
                          image: state.restaurant__filterdata[index]['restaurant_image']!, //consider null case
                          establishment_name: state.restaurant__filterdata[index]['restaurant_name']!, 
                          products: state.restaurant__filterdata[index]['products'],
                          open: state.restaurant__filterdata[index]['open_schedule'],
                          close: state.restaurant__filterdata[index]['close_schedule'],
                        );
                    },
                  );
                } else if (state is NoFilteredRestaurantSearchRestaurantsResults) {
                  return Center(
                    child: Text("No hay resultados"),
                  );
                } else if (state is NoDataYet) {
                  return Container();
                }  
                return Container();
              },
            ),
          ),
        ),
      ]
    ),

  );
  }
}