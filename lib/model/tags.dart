import 'package:al_fetwa_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tags {
  String questionId, tags;
  Tags({
    @required this.questionId,
    @required this.tags,
  });
  Widget getTags(String Qid) {
    List<String> tagOfQs = [];
    for (String model in Qs().questions[int.parse(Qid)].tags) {
      
        tagOfQs.add(model);
      
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tagOfQs.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  tagOfQs[index],
                  style: TextStyle(color: Colors.white,fontSize: 12),
                ),
              )),
        );
      },
    );
  }
}
