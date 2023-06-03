import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/category.dart';
import 'package:al_fetwa_app/model/question.dart';
import 'package:al_fetwa_app/model/tags.dart';
import 'package:al_fetwa_app/widgets/questionItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  String from;
  SearchPage(this.from);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState(from);
  }
}

class SearchPageState extends State<SearchPage> {
  bool isSearching = false;
  String from = '';
  String defaultV;

  SearchPageState(this.from) {
    defaultV = from;
    getQuestionsLists(from);
  }
  List<Question> list = List(), newList = List();

  

  List<Question> getQuestionsLists(String value) {
    list = List();

    if (value == 'All') {
      for (Question question in Qs().getAllQuestions()) {
        list.add(question);
      }
    } else {
     
      for (Question question in Qs().getAllQuestions()) {
        for (String tags in question.tags) {
          if (tags == value) {
            list.add(question);
          }
        }
      }
      return list;
    }
  }

  @override
  Widget build(BuildContext context) {
   

    // TODO: implement build
    return MaterialApp(
      title: "Search page",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.orange,
          leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.keyboard_backspace_outlined),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          actions: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 350.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            InputDecoration(
                                              
                                              hintText: "Search",
                                            ),
                                        onChanged: (String v) {
                                          setState(() {
                                            newList = List();
                                            isSearching = true;
                                            for (Question question in list) {
                                              if (question.title
                                                  .toLowerCase()
                                                  .contains(v.toLowerCase())) {
                                                newList.add(question);
                                              }
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(children: [
          SizedBox(height: 50.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "${defaultV} Question",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: isSearching ? newList.length : list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionsItem(
                                question:
                                    isSearching ? newList[index] : list[index]);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
