
import 'package:dzkingdom/screens/userUI/boutiques.dart';
import 'package:flutter/cupertino.dart';

class boutique extends ChangeNotifier {
  final String id;
  final String name;
  final String imgUrl;
   int followers ;
   bool follow ;
   bool tendance ;

  boutique({required this.id, required this.name, required this.imgUrl, required this.followers,required this.follow,required this.tendance});
}

class boutiquess extends ChangeNotifier {

  bool search = false ;
  void searchup() {
    search=!search;
    notifyListeners();
  }
  List<boutique> list = [

    boutique(id: 'id1', name: 'Elmigneuww', imgUrl: '',followers: 124,follow: true ,tendance: true),
    boutique(id: 'id2', name: 'ScareX', imgUrl: '',followers: 67,follow: true,tendance: true),
    boutique(id: 'id3', name: 'yaekoub16', imgUrl: '',followers: 928,follow: false,tendance: true),
    boutique(id: 'id4', name: 'calyy29', imgUrl: '',followers: 29,follow: true,tendance: false),
    boutique(id: 'id5', name: 'billie', imgUrl: '',followers: 29,follow: false,tendance: false),
    boutique(id: 'id6', name: 'yasmyyn', imgUrl: '',followers: 29,follow: true,tendance: true),
    boutique(id: 'id7', name: 'hmiidaZ', imgUrl: '',followers: 29,follow: false,tendance: false),

  ];

   List<boutique> get list_abn {return list.where((element) => element.follow).toList();} 

   List<boutique> get list_ten {return list.where((element) => element.tendance).toList();} 



/*  void filterSearchResults(String query,int x,List<boutique> a) {
  List<boutique> Liste = [] ;
  if (x==1) {Liste=list;} else if  (x==2) {Liste=list_abn;} else {Liste=list_ten;};
  final List<boutique> duplicateItems =a;

    List<boutique> dummySearchList = <boutique>[];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<boutique> dummyListData = <boutique>[];
      dummySearchList.forEach((item) {
        if(item.name.contains(query)) {
          dummyListData.add(item);
        }
      });
    

     if (x==1) {
        list.clear();
        list.addAll(dummyListData);} else if  (x==2) {
          list_abn.clear();
        list_abn.addAll(dummyListData);} else {
           list_ten.clear();
        list_ten.addAll(dummyListData);};
       

     return ;

      }
      
else {

   if (x==1) {
        list.clear();
        list.addAll(duplicateItems);} else if  (x==2) {
          list_abn.clear();
        list_abn.addAll(duplicateItems);} else {
           list_ten.clear();
        list_ten.addAll(duplicateItems);};
       
      
   
      }

          notifyListeners();

    } */

 

   void switcher(int index ,int i ,String idd){
    
   if (i==1) {

    list[index].follow?list[index].followers-=1:list[index].followers+=1;
    list[index].follow = !list[index].follow;

    }
    
     else if  (i==2) {

     
   
     
    list.firstWhere((element) => element.id==idd).followers -=1 ;
    list.firstWhere((element) => element.id==idd).follow =false ;



     } else {

     bool b = list.firstWhere((element) => element.id==idd).follow ;
     b? list.firstWhere((element) => element.id==idd).followers-=1 : list.firstWhere((element) => element.id==idd).followers+=1;
     list.firstWhere((element) => element.id==idd).follow= !b ;

   

     };

 
    notifyListeners();
  }


 
 
}

