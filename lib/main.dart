import 'package:al_fetwa_app/widgets/answer_page.dart';
import 'package:al_fetwa_app/widgets/home.dart';
import 'package:flutter/material.dart';
import 'data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.orange,
      ),
      title: "Al Fetwa",
      
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
