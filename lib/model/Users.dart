import 'package:flutter/cupertino.dart';

class Users {
  String userId, userName, imageUri, email;
  bool isUstaz;
  List<String> profesion;
  Users({
    @required this.userId,
    @required this.userName,
    @required this.imageUri,
    @required this.email,
    @required this.isUstaz,
    this.profesion
    });
}
