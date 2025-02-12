import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/food_details_page.dart';

import 'pages/botom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery ',
      theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[100],
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          dividerTheme: const DividerThemeData(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.deepOrange),
          fontFamily: 'OpenSans',
          textTheme: TextTheme()),
      routes: {
        '/': (context) => const BottomNavBarPage(),
        FoodDetailsPage.routeName: (context) => FoodDetailsPage()
      },
    );
  }
}

  // WidgetsFlutterBinding
  //     .ensureInitialized(); // تستخدم لتثبيت الشاشة في حال التغيير
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
   //  home: const BottomNavBarPage(),