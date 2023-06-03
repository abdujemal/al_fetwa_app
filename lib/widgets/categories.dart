import 'package:al_fetwa_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categoryItem.dart';

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoriesState();
  }
}

class CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: Qs().categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(Qs().categories[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
