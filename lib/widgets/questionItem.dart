import 'dart:ui';

import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/comments.dart';
import 'package:al_fetwa_app/model/likes.dart';
import 'package:al_fetwa_app/model/question.dart';
import 'package:al_fetwa_app/model/tags.dart';
import 'package:al_fetwa_app/widgets/answer_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QuestionsItem extends StatefulWidget {
  final Question question;
  QuestionsItem({@required this.question});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionsItemState(question: question);
  }
}

class QuestionsItemState extends State<QuestionsItem> {
  final Question question;
  QuestionsItemState({@required this.question});
  bool IsLiked() {
    bool isLiked = false;
    for (Likes model in Likes().getNumOfLikes(Qid: question.id)) {
      if (model.userId == "1") {
        isLiked = true;
      }
    }
    return isLiked;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnswerPage(question)));
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          question.title,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ))),
                        Row(
                          children: [
                            Container(
                              height: 37.0,
                              width: 130.0,
                              child: Tags().getTags(question.id),
                            )
                          ],
                        ),
                      ]),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 10.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: CachedNetworkImageProvider(
                                        Qs()
                                            .users[
                                                int.parse(question.askerId) - 1]
                                            .imageUri),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    Qs()
                                        .users[int.parse(question.askerId) - 1]
                                        .userName,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 60,
                                  child: Text(
                                    question.description,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 13.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              question.date,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11.0),
                            ),
                          ),
                          Text(
                              '${Likes().getNumOfLikes(Qid: question.id).length}',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 13.0)),
                          IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                                color: IsLiked() ? Colors.blue : Colors.grey,
                              ),
                              iconSize: 20),
                          SizedBox(width: 10),
                          Text(
                            '${Comment().getNumOfComments(question.id).length} Comments',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13.0),
                          )
                        ],
                      ),
                    )
                  ]))),
        ));
  }
}
