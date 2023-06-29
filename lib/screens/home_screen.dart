import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/screens/restaurant_screen.dart';
import 'package:food_delivery_app/widgets/rating_stars..dart';
import 'package:food_delivery_app/widgets/recent_orders.dart';

import '../Model/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _buildRestaurants(context) {
    List<Widget> restaurantList = [];
    List<Restaurant> sortedRestaurants = List.from(restaurants);
   // sortedRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
    sortedRestaurants.forEach((element) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RestaurantScreen(obj:element);

            },));
          },
          child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Color.fromARGB(255, 232, 229, 229)
            )
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: element.imageUrl,
                  child: Image( 
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover
                    ,image: AssetImage(element.imageUrl)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(element.name,
                      style:const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      ),
                    const  SizedBox(height: 4),
                    RatingStars(rating: element.rating),
                    const  SizedBox(height: 4),
              
                          Text(element.address,style:const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                    const  SizedBox(height: 4),
              
                    const Text('0.2 miles away',style:  TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
              )
            ],
          ),
              ),
        ));
    });
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: const IconButton(
          icon: Icon(Icons.account_circle),
          disabledColor: Colors.white,
          iconSize: 30.0,
          onPressed: null,
        ),
        title: const Text('Food Delivery'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Cart (${currentUser.cart.length})',
                style: TextStyle(fontSize: 14, color: Colors.grey[50]),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(width: 1.4)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                        width: 1.4, color: Colors.deepOrangeAccent)),
                hintText: 'Search Food or Restaurants',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurant',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
              ),
              _buildRestaurants(context)
            ],
          )
        ],
      ),
    );
  }
}
