import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/Model/order.dart';
import 'package:food_delivery_app/data/data.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  _buildRecentOrders(contxt, order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              width: 1.0, color: Color.fromARGB(255, 236, 236, 236))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Expanded(
        child: Row(
          children: [
              ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
                image: AssetImage(order.food.imageUrl)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
               order.food.name,
                    style:
                        const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order.restaurant.name,
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                
                  Text(
                    order.date,
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  
                  ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
        Container(
          margin: const EdgeInsets.only(right: 20.0),
          width: 48.0,
          decoration: BoxDecoration(
            color:  Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(30)
          ),
          child: IconButton(icon:const Icon(Icons.add) ,onPressed: () {},color: Colors.white,),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            padding:const EdgeInsets.only(left: 10.0),
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (context, index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrders(context, order);
            },
          ),
        )
      ],
    );
  }
}
