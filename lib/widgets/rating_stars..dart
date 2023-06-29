import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i=0 ;i<rating;i++){
      stars +="⭐ ";
    }
    stars.trim();
    return Text(stars);
  }
}