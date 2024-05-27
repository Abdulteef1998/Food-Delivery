import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_arg.dart';
import 'package:food_delivery/widgets/food_details/food_item_counter.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';

import '../widgets/custom_back_button.dart';
import '../widgets/favorite_button.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/food-details';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FoodDetailsArgs foodArgs =
        ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;
    final foodIndex = foodArgs.foodIndex;
    return Scaffold(
      // appBar: AppBar(),

      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBackButton(
                        onTap: () => Navigator.of(context)
                            .pop<String>(food[foodIndex].name),
                        height: size.height * 0.04,
                        width: size.width * 0.09,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FavoriteButton(
                          foodindex: foodIndex,
                          width: size.width * 0.1,
                          height: size.height * 0.04,
                        ),
                      )
                    ],
                    expandedHeight: size.height * 0.35,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.network(
                              food[foodIndex].imgUrl,
                              fit: BoxFit.contain,
                              height: size.height * 0.28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 46),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food[foodIndex].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Buffalo Burger',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const FoodItemCounter(),
                              ],
                            ),
                            const SizedBox(height: 32),
                            const IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PropertyItem(
                                    propertyName: 'Size',
                                    propertyValue: 'Medium',
                                  ),
                                  VerticalDivider(
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  PropertyItem(
                                    propertyName: 'Calories',
                                    propertyValue: '150 kcl',
                                  ),
                                  VerticalDivider(
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  PropertyItem(
                                    propertyName: 'Cooking',
                                    propertyValue: '10-20 Min',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor ghfffffrtht Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor ghfffffrtht Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor ghfffffrtht  Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor ghfffffrtht Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor ghfffffrtht Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor ghfffffrtht',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Text(
                    '\$ ${food[foodIndex].price}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SizedBox(
                      // height: size.height * 0.058,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('CheckOut'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
