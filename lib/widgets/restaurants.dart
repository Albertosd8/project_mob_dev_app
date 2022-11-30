import 'package:flutter/material.dart';
import 'package:project_app_eateso/pages/establishment_products.dart';

class RestaurantWidget extends StatelessWidget{
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.establishment_name,
    required this.products,
    required this.open,
    required this.close
  });

  final List<dynamic> products;
  final String image;
  final String establishment_name;
  final String close;
  final String open;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => establishmentMenu(restaurant_data: {
              "restaurant_name": establishment_name,
              "restaurant_image": image,
              "products": products,
              "open": open,
              "close": close,
            }
            ),)); //change and get data
          },
          child:Container(  
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: 300,  
          height: 210,  
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width:double.infinity,
                  height: 150,
                  child: Image.network('$image',
                  fit: BoxFit.fill,)
                ),
                SizedBox(height:4),
                Row(
                  children: [
                    SizedBox(width: 8,),
                    Text(
                      '$establishment_name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ) 
                  ],
                )
              ],
          )
        ) 
      )
    );
  }

}
