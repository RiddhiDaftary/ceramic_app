import 'package:ceramic_app/model/category_data.dart';
import 'package:ceramic_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() {

  runApp(MyApp());
//  runApp(MultiProvider(
//    providers: [
//      Provider<CategoryData>(create: (context) => CategoryData()),
//    ],
//    child: MyApp(),
//  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => HomeScreen(),
      },
    );
  }
}