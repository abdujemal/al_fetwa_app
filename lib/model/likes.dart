import 'package:al_fetwa_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Likes {
  String questionId, userId;
  Likes({
    @required this.questionId,
    @required this.userId,
  });
  List<Likes> getNumOfLikes({String Qid}) {
    List<Likes> CommentsOfQs = [];
    for (Likes model in Qs().likes) {
      if (model.questionId == Qid) {
        CommentsOfQs.add(model);
      }
    }
    return CommentsOfQs;
  }
}
