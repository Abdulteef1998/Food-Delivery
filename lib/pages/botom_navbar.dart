import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/account_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex = 0;

  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = const [HomePage(), FavoritePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? appBar;
    Widget? bottomNavBar;

    if (Platform.isAndroid) {
      appBar = AppBar(
        centerTitle: true,
        title: const Text('Foodak'),
      );

      bottomNavBar = BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      );
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(
        middle: const Text('Foodak'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      );
    } else {
      appBar = null;
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: bodyOptions[selectedIndex]),
      drawer: const Drawer(
        child: Center(
          child: Text('I am in the drawer'),
        ),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
