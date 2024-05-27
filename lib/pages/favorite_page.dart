import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_arg.dart';
import 'package:food_delivery/utilities/app_assests.dart';

import '../widgets/adaptive_fav_button.dart';
import 'food_details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Widget buildLandscapeFavButton(List<FoodItem> favoriteFood, int index) {
    return AdaptiveFavButton(
      title: 'Favorited',
      onPressed: () {
        final targetedItem = favoriteFood[index];
        int targetedIndex = food.indexOf(targetedItem);
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: false);
          favoriteFood.remove(targetedItem);
        });
      },
    );
  }

  Widget buildPortraitFavButton(
      List<FoodItem> favoriteFood, int index, Size size) {
    return IconButton(
      onPressed: () {
        final targetedItem = favoriteFood[index];
        int targetedIndex = food.indexOf(targetedItem);
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: false);
          favoriteFood.remove(targetedItem);
        });
      },
      icon: Icon(
        Icons.favorite,
        color: Theme.of(context).primaryColor,
        size: size.height * 0.035,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood =
        food.where((FoodItem foodItem) => foodItem.isFavorite == true).toList();

    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              AppAssets.emptyState,
              fit: BoxFit.cover,
              height: isLandscape ? size.height * 0.5 : size.height * 0.3,
            ),
            Text(
              'No favorite items found',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            int targetedIndex = food.indexOf(favoriteFood[index]);
            Navigator.of(context)
                .pushNamed(FoodDetailsPage.routeName,
                    arguments: FoodDetailsArgs(foodIndex: targetedIndex))
                .then((value) {
              setState(() {});
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.network(
                    favoriteFood[index].imgUrl,
                    height:
                        isLandscape ? size.height * 0.2 : size.height * 0.09,
                    width: size.width * 0.2,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favoriteFood[index].name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$${favoriteFood[index].price}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLandscape)
                    buildPortraitFavButton(favoriteFood, index, size),
                  if (isLandscape) buildLandscapeFavButton(favoriteFood, index),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
