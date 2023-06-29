
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/Model/order.dart';

import '../data/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order item){
    double price = item.quantity*item.food.price;
  
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(item.food.imageUrl),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)
                ),
              ),
        
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.food.name, style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                      const SizedBox(height: 10),
                      Text(item.restaurant.name,style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,)),

                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:Border.all(
                            width: 2.0,
                            color: Colors.black54
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        
                          GestureDetector(onTap: () {
                            if (item.quantity !=1)
                            item.quantity =item.quantity-1; 
                               setState(() {
                              
                            });
                          }, child:const Icon(Icons.remove,color: Colors.deepOrangeAccent,)),

                          Text(item.quantity.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),


                          GestureDetector(onTap: () {
                          
                            item.quantity =item.quantity+1; 
                            setState(() {
                              
                            });
                          }, child:const Icon(Icons.add,color: Colors.deepOrangeAccent,)),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              Text('\$${price.toString()}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
        )
      ]),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
          title: Text(
        'Cart (${currentUser.cart.length})',
        style: TextStyle(fontSize: 18, color: Colors.grey[50]),
      )),
      body: ListView.separated(
        itemCount: currentUser.cart.length,
        itemBuilder: (context, index) {
          Order order = currentUser.cart[index];
          return _buildCartItem(order);
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1,color: Colors.grey,);
        },
      )
    );

  }
}
