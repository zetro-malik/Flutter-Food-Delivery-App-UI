import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/Model/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
   
   final Restaurant obj;

   RestaurantScreen({required this.obj});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.obj.imageUrl,
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.obj.imageUrl)),
              ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  20.0, vertical: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () => Navigator.pop(context), icon:const Icon(Icons.arrow_back),color: Colors.white,iconSize: 30.0,),
                      IconButton(onPressed: () => Navigator.pop(context), icon:const Icon(Icons.favorite),color: Colors.deepOrangeAccent,iconSize: 30.0,),
                            
                    ],
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}