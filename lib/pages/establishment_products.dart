import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_app_eateso/widgets/products.dart';

class establishmentMenu extends StatefulWidget {
  final Map<dynamic,dynamic> restaurant_data;
  establishmentMenu({Key? key, required this.restaurant_data}) : super(key: key,);

  @override
  State<establishmentMenu> createState()=> establishmentMenuState();
}

class establishmentMenuState extends State<establishmentMenu> {
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
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.restaurant_data['restaurant_image']),
                fit: BoxFit.cover,),
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.restaurant_data['restaurant_name'],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.watch_later),
                            SizedBox(width: 4,),
                            Text('Open from '+widget.restaurant_data['open']+' to '+widget.restaurant_data['close'],
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.033,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                        Row( //implement API
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 4,),
                            Text('Distance from you: 2 km',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.033,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                        // Text('Open until 9:00'), // Ratings, good extra
                      ],
                    ),
                  ],
                ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(31, 184, 184, 184),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index){
                    return ProductWidget(
                      image: widget.restaurant_data['products'][index]['image']!,
                      product_name: widget.restaurant_data['products'][index]['name']!,
                      product_description: widget.restaurant_data['products'][index]['description']!,
                      product_price: widget.restaurant_data['products'][index]['price']!
                    );
                  },
                  separatorBuilder: (BuildContext context, int index){
                  return SizedBox(height: 1,);
                  }, 
                  itemCount: widget.restaurant_data['products'].length
                )
              ),
            )
          ],
        ),
      )
    );
  }
}