import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/likes.dart';
import 'package:al_fetwa_app/model/question.dart';
import 'package:al_fetwa_app/widgets/questionItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  String title;
  Questions(this.title);
  @override
  State<StatefulWidget> createState() {
    return QuestionsState(title);
  }
}

class QuestionsState extends State<Questions> {
  String title;
  QuestionsState(this.title);
  @override
  Widget build(BuildContext context) {
    return getQuestions();
  }

  Widget getQuestions() {
    if (title == "Questions") {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: Qs().getAllQuestions().length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionsItem(
                  question: Qs().getAllQuestions()[index],
                );
              },
            ),
          ),
        )
      ]);
    } else if (title == "Favourites") {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: getFavourites().length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionsItem(
                  question: getFavourites()[index],
                );
              },
            ),
          ),
        )
      ]);
    } else if (title == "My Questions") {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: getMyQuestion().length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionsItem(
                  question: getMyQuestion()[index],
                );
              },
            ),
          ),
        )
      ]);
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: getUnAnsweredQuestion(title).length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionsItem(
                    question: getUnAnsweredQuestion(title)[index],
                  );
                },
              ),
            ),
          )
        ],
      );
    }
  }

  List<Question> getUnAnsweredQuestion(String category) {
    List<Question> list = List();
    for (Question question in Qs().getUnansweredQuestion()) {
      for (String tags in question.tags) {
        if (tags == category) {
          list.add(question);
        }
      }
    }
    return list;
  }

  List<Question> getFavourites() {
    List<Question> list = [];
    for (Likes likes in Qs().likes) {
      if (likes.userId == "1") {
        for (Question question in Qs().questions) {
          if (question.id == likes.questionId) {
            list.add(question);
          }
        }
      }
    }
    return list;
  }

  List<Question> getMyQuestion() {
    List<Question> list = [];
    for (Question model in Qs().questions) {
      if (model.askerId == "1") {
        list.add(model);
      }
    }
    return list;
  }
}
