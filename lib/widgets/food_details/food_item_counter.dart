import 'package:flutter/material.dart';

class FoodItemCounter extends StatefulWidget {
  const FoodItemCounter({super.key});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              children: [
                InkWell(
                  onTap: decrementCounter,
                  child: Text(
                    '-',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: counter > 1 ? Colors.black : Colors.grey[400]),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(counter.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black)),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: incrementCounter,
                  child: Text(
                    '+',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
