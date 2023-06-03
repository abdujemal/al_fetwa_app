import 'dart:core';

import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/Users.dart';
import 'package:al_fetwa_app/widgets/navigation_drawer.dart';
import 'package:al_fetwa_app/widgets/questions.dart';
import 'package:al_fetwa_app/widgets/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  final List<Widget> _screens = [
    Questions("Questions"),
    Categories(),
    Questions("Favourites"),
    Questions("My Questions"),
  ];

  final List<String> _menus = [
    "All Questions",
    "Categories",
    "Favourites",
    "My Questions"
  ];

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.orange,
        drawer: Drawer(child: NavigationDrawer()),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          backgroundColor: Colors.orange,
          title: Text(
            'Al Fetwa',
            style: TextStyle(fontSize: 28.0, color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage('All')));
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 90.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _menus.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(right: 20, left: 40)
                          : EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        child: Text(
                          _menus[index],
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? Colors.white
                                  : Colors.white60,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Center(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: _screens,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
