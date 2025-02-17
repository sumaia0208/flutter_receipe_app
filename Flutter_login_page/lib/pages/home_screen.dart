import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'detail_screen.dart';




class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Receipe App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),

        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: recipes.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>DetailScreen(
                          title: recipes[index].title,
                          imgUrl: recipes[index].imageUrl,
                          ingredients: recipes[index].ingredients,
                          steps: recipes[index].steps,
                          duration: recipes[index].duration,
                        )));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)
                        )
                    ),
                    elevation: 4.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(recipes[index].imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 250,
                          ),
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black54
                              ),
                              child: Text(recipes[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                            )),
                        Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                color: Colors.white,
                              ),

                              height: 50,
                              width: 100,
                              child: Center(
                                child: Text('${recipes[index].duration} min',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),),

                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }),
        )
    );
  }
}