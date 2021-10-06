import 'package:flutter/cupertino.dart';

class boutique extends ChangeNotifier {
  final String id;
  final String name;
  final String imgUrl;
   int followers ;
   bool follow ;

  boutique({required this.id, required this.name, required this.imgUrl, required this.followers,required this.follow,});
}

class boutiquess extends ChangeNotifier {
  List<boutique> list = [
 //  boutique(id: 'id1', name: 'Elmigneuw', imgUrl: '',followers: 124,follow: true ),
  //  boutique(id: 'id2', name: 'ScareX', imgUrl: '',followers: 67,follow: false),
  //  boutique(id: 'id3', name: 'yaekoub16', imgUrl: '',followers: 928,follow: false),
  //  boutique(id: 'id4', name: 'calyy29', imgUrl: '',followers: 29,follow: true),
   
  ];

   void switcher(int index){
    list[index].follow?list[index].followers+=1:list[index].followers-=1;
    list[index].follow = !list[index].follow;
    notifyListeners();
  }
}
