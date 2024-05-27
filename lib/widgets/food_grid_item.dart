import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/widgets/favorite_button.dart';

import '../models/food_item.dart';

class FoodGridItem extends StatelessWidget {
  final int foodindex;
  final List<FoodItem> filteredfood;
  FoodGridItem({
    super.key,
    required this.foodindex,
    required this.filteredfood,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final targetedIndex = food.indexOf(filteredfood[foodindex]);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
          padding: EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(food[foodindex].imgUrl,
                        height: constraints.maxHeight * 0.55),
                    Align(
                      alignment: Alignment.topRight,
                      child: FavoriteButton(
                        foodindex: targetedIndex,
                        height: constraints.maxHeight * 0.2,
                        width: constraints.maxWidth * 0.2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: FittedBox(
                    child: Text(filteredfood[foodindex].name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontFamily: 'OpenSans')),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.017,
                ),
                FittedBox(
                  child: Text(
                    ' ${filteredfood[foodindex].price}\$',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )),
    );
  }
}
