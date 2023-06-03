import 'package:al_fetwa_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comment {
   String questionId, comments,userId;
  Comment({
    @required this.questionId,
    @required this.comments,
    @required this.userId
  });
  List<Comment> getNumOfComments(String Qid) {
    List<Comment> CommentsOfQs = [];
    for (Comment model in Qs().comments) {
      if(model.questionId == Qid){
        CommentsOfQs.add(model);
      }
    }
    return CommentsOfQs;
  }
}