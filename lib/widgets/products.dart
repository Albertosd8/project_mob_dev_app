import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget{
  const ProductWidget({
    super.key,
    required this.image,
    required this.product_name,
    required this.product_description,
    required this.product_price,
  });

  final String image;
  final String product_name;
  final String product_description;
  final double product_price;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed("/establishment_page"); //change later
          },
          child:Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 1,),
                  Container(
                    // color: Colors.purple,
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.20,
                    child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LimitedBox(
                            maxWidth: 162,
                            child: Text(
                            '$product_name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                              ),
                            ) 
                          ),
                          LimitedBox(
                            maxWidth: 162,
                            child: Text(
                            '$product_description',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                              ),
                            ) 
                          ),
                          Text("\$$product_price",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                              ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              print("hey");
                            }, 
                            child: Text(
                              "Add",
                              style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.30, MediaQuery.of(context).size.height * 0.05),
                              backgroundColor: Color.fromARGB(255, 250, 223, 124),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10.0),
                      color: Colors.orangeAccent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          '$image',
                        ) 
                      )
                    ),
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                ],
          ),
            )
        ) 
      )
    );
  }

}
