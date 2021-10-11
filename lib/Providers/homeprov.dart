import 'package:flutter/cupertino.dart';

class HomeProv with ChangeNotifier{
  String desc = '';
  String name = '';
  String imgUrl = '';
  bool isClicked = false;

  void switcher(){
    isClicked = !isClicked;
    notifyListeners();
  }

  void passDesc(String descc , String url , String namee) {
    desc = descc;
    imgUrl = url;
    name = namee;
    notifyListeners();
  }
}

