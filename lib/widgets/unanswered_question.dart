import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/category.dart';
import 'package:al_fetwa_app/widgets/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnAnsweredQuestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UnAnsweredQuestionState();
  }
}

class UnAnsweredQuestionState extends State<UnAnsweredQuestion> {
  int selectedIndex = 0;

  List<Questions> getScreens() {
    List<Questions> list = List();
    for (String model in Qs().users[0].profesion) {
      list.add(Questions(model));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Questions for me",
              style: TextStyle(color: Colors.white,fontSize: 20.0),
            ),
            elevation: 0.0,
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.keyboard_backspace_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Column(
          children: [
            Container(
              height: 90.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Qs().users[0].profesion.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(right: 20, left: 40)
                          : EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        child: Text(
                          Qs().users[0].profesion[index],
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
                    children: getScreens(),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
