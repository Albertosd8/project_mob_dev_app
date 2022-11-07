import 'package:flutter/material.dart';

class RestaurantWidget extends StatelessWidget{
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.establishment_name,
  });

  final String image;
  final String establishment_name;

  @override
  Widget build(BuildContext context){
    return Container(  
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
  );
  }

}
