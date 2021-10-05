import 'package:flutter/cupertino.dart';

class HomeProv with ChangeNotifier{
  bool isClicked = false;

  void switcher(){
    isClicked = !isClicked;
    notifyListeners();
  }
}

