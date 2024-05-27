// Dart

// Flutter

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_items.dart';
// other Packages
// internal (files)
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_arg.dart';
import 'package:food_delivery/utilities/app_assests.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryChosenId;
  bool enableCategoryFilter = false;
  late List<FoodItem> filterdfood;
  void initState() {
    super.initState();
    filterdfood = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              AppAssets.burgerBanner,
              height: isLandscape ? size.height * 0.7 : size.height * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          SizedBox(
            height: size.height * 0.18,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    {
                      if (categoryChosenId == categories[index].id ||
                          !enableCategoryFilter)
                        enableCategoryFilter = !enableCategoryFilter;
                    }
                    if (enableCategoryFilter) {
                      categoryChosenId = categories[index].id;
                      filterdfood = food
                          .where((item) => item.categoryId == categoryChosenId)
                          .toList();
                    } else {
                      categoryChosenId = null;
                      filterdfood = food;
                    }
                  });
                },
                child: Container(
                  width: size.width * 0.21,
                  decoration: BoxDecoration(
                    color: categoryChosenId == categories[index].id
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(categories[index].imgPath),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          categories[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: categoryChosenId == categories[index].id
                                    ? Colors.white
                                    : null,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filterdfood.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscape ? 4 : 2,
              mainAxisSpacing: size.height * 0.02,
              crossAxisSpacing: size.height * 0.02,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                final targetedFoodItem =
                    food.firstWhere((item) => item.id == filterdfood[index].id);
                final targetedIndex = food.indexOf(targetedFoodItem);
                Navigator.of(context)
                    .pushNamed(
                  FoodDetailsPage.routeName,
                  arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                )
                    .then((value) {
                  setState(() {});
                  filterdfood = food;
                  categoryChosenId = null;
                });
              },
              child: FoodGridItem(
                foodindex: index,
                filteredfood: filterdfood,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
