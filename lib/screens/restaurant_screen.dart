import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/Model/food.dart';
import 'package:food_delivery_app/Model/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_stars..dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant obj;

  RestaurantScreen({required this.obj});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
 
 _builderMenuItem(Food food){
  return Center(
    child: Stack(
      children: [
       Container(
        height: 175.0,
        width: 175.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(image: AssetImage(food.imageUrl),fit: BoxFit.cover)),
       ),
       Container(
         height: 175.0,
        width: 175.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black87.withOpacity(0.3),
             Colors.black54.withOpacity(0.3),
             Colors.black38.withOpacity(0.3),
            ],
            stops: const [
              0.1,
              0.4,
              0.6,
              0.9
            ]
          )
        ),
       )
      ],
    ),
  );
 }
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 30.0,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.favorite),
                        color: Colors.deepOrangeAccent,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.obj.name,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        '0.2 miles away',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RatingStars(rating: widget.obj.rating),
                  const SizedBox(height: 5),
                  Text(
                    widget.obj.address,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120, 
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button 1 press
                              },
                              style: ElevatedButton.styleFrom(                              primary: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child:const Text('Reviews'),
                            ),
                          ),
                   
                          Container(
                            width: 120, 
                            child: ElevatedButton(
                              onPressed: () {
                               
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child:const Text('Contact'),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(height: 10.0,),
                      const Center(child: Text('Menu',style: TextStyle(letterSpacing: 0.6,fontSize: 22,fontWeight: FontWeight.w600),),),
                      const SizedBox(height: 10.0,),
                ],
              ),
            ),
              Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(widget.obj.menu.length, (index) {
                            Food food = widget.obj.menu[index];
                            return _builderMenuItem(food);
                          }),
                          ),
                      )
          ],
        ),
      
    );
  }
}
