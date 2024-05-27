import 'package:flutter/material.dart';

import '../models/food_item.dart';
import 'custom_secondry_button.dart';

class FavoriteButton extends StatefulWidget {
  final int foodindex;
  final double height;
  final double width;

  const FavoriteButton({
    Key? key,
    required this.foodindex,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CustomSecondryButton(
      height: widget.height,
      width: widget.width,
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
          food[widget.foodindex] = food[widget.foodindex].copyWith(
            isFavorite: !food[widget.foodindex].isFavorite,
          );
        });
      },
      iconData: food[widget.foodindex].isFavorite
          ? Icons.favorite
          : Icons.favorite_border,
    );
  }
}
