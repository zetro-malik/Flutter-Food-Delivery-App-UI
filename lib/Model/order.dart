import 'package:food_delivery_app/Model/food.dart';
import 'package:food_delivery_app/Model/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;


  Order({
    required this.restaurant,
    required this.food, 
    required this.date,
    required this.quantity
  });
  
}