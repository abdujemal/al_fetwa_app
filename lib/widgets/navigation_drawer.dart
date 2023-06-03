import 'package:al_fetwa_app/data/data.dart';
import 'package:al_fetwa_app/model/question.dart';
import 'package:al_fetwa_app/widgets/questions.dart';
import 'package:al_fetwa_app/widgets/unanswered_question.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            CachedNetworkImageProvider(Qs().users[0].imageUri),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        Qs().users[0].userName,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Answer Questions"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> UnAnsweredQuestion()));
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.star_rate),
              title: Text("Rate us"),
            ),
            SizedBox(
              height: 50.0,
            ),
            ListTile(
              title: Text(
                "About us",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Do you want to answer fetwas?",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
