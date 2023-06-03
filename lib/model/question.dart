import 'package:flutter/cupertino.dart';

class Question {
  String id, title, description, date, askerId;
  List<String> tags;
  bool isAnswered;

  Question(
      {
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.date,
      @required this.askerId,
      @required this.tags,
      @required this.isAnswered
      });
}
