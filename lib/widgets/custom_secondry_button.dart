import 'package:flutter/material.dart';

class CustomSecondryButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final IconData iconData;
  const CustomSecondryButton(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
