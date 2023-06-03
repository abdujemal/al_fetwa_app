import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/category.dart';
import 'package:al_fetwa_app/model/question.dart';
import 'package:al_fetwa_app/model/tags.dart';
import 'package:al_fetwa_app/widgets/searchPage.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem(this.category);

  int getNumOfQuestions(category) {
    int numOfQs = 0;
    for(Question question in Qs().questions){
      for (String tags in question.tags) {
        if (tags == category) {
          numOfQs++;
        }
      }
    }
    return numOfQs;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(category.categoryName)));
        },
        child: Container(
          child: Card(
            elevation: 10.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(category.categoryImage),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category.categoryName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${getNumOfQuestions(category.categoryName)} questions',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              ],
            ),
            
          ),
          
        ),
      ),
    );
  }
}
