import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  final String id;
  final String name;
  final String imgUrl;

  User({required this.id, required this.name, required this.imgUrl});
}

class Users extends ChangeNotifier {
  List<User> list = [
    User(id: 'id1', name: 'name1', imgUrl: ''),
    User(id: 'id2', name: 'name2', imgUrl: ''),
    User(id: 'id3', name: 'name3', imgUrl: ''),
    User(id: 'id4', name: 'name4', imgUrl: ''),
  ];
}
