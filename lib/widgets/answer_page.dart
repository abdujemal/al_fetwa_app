import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/comments.dart';
import 'package:al_fetwa_app/model/question.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AnswerPage extends StatefulWidget {
  Question question;
  AnswerPage(this.question);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnswerPageState(question);
  }
}

class AnswerPageState extends State<AnswerPage> {
  Question question;

  AnswerPageState(this.question);

  // List<Comment> getComments(){
  //   List<Comment> list = List();
  //   for(Comment comment in Qs().comments){
  //     if(comment.questionId==question.id){
  //       list.add(comment);
  //     }
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange,
        title: Text('Answer Page',style: TextStyle(color: Colors.white,),),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_outlined),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.dotsVertical),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(children: [
        getItems(true), 
        question.isAnswered ? getItems(false) :
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Answer"
                  ),

                ),
              ),
              RaisedButton (
                child: Text("Submit",style: TextStyle(color: Colors.white,letterSpacing: 1),),
                color: Colors.orange,
                onPressed: () {
                  
                  },
                

              )
            ],
          )
        ),
        question.isAnswered ?
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Comments",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: Comment().getNumOfComments(question.id).length,
                      itemBuilder: (context , index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage: CachedNetworkImageProvider(Qs().users[int.parse(Comment().getNumOfComments(question.id)[index].userId)-1].imageUri),
                                    ),
                                    SizedBox(height: 4.0,),
                                    Text(Qs().users[int.parse(Comment().getNumOfComments(question.id)[index].userId)-1].userName,
                                        style: TextStyle(fontSize: 12.0,color: Colors.grey),)
                                  ],
                                ),
                              ),
                              Expanded(child: Card(elevation: 8.0,child: Center(child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(Comment().getNumOfComments(question.id)[index].comments),
                              ))))
                            ],),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ):SizedBox()
        ]),
    );
  }

  Widget getItems(bool isQuestion) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Expanded(
        child: Row(
          children: [
            !isQuestion
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: CachedNetworkImageProvider(Qs()
                              .users[int.parse(Qs()
                                      .answers[int.parse(question.id)]
                                      .answeredBy) -
                                  1]
                              .imageUri),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          Qs()
                              .users[int.parse(Qs()
                                      .answers[int.parse(question.id)]
                                      .answeredBy) -
                                  1]
                              .userName,
                          style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.7,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: isQuestion
                          ? BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))
                          : BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          isQuestion ? "Question" : "Answer",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        )),
                    SizedBox(height: 8.0),
                    isQuestion
                        ? Center(
                            child: Text(
                            question.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ))
                        : SizedBox(
                            height: 0.0,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        isQuestion
                            ? question.description
                            : Qs().answers[int.parse(question.id)].answer,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            Qs().answers[int.parse(question.id)].date,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
            isQuestion
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: CachedNetworkImageProvider(Qs()
                              .users[int.parse(question.askerId) - 1]
                              .imageUri),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          Qs().users[int.parse(question.askerId) - 1].userName,
                          style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.7,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
